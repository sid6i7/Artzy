import 'dart:convert';
import 'package:frontend/config.dart';
import 'package:frontend/models/user.dart';
import 'package:http/http.dart' as http;

class UserUtils {
  addUserToDatabase(User user) async {
    final response = await http.post(
      Uri.parse(BASE_URL + USER_ENDPOINT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    print(response.body);

    if (response.statusCode == 201) {
      print('user added');
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add user to database.');
    }
  }

  Future<List<User>> getAllUsersFromDatabase() async {
    List<User> users = [];

    const url = BASE_URL + USER_ENDPOINT;
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      users = items.map<User>((json) {
        return User.fromJson(json);
      }).toList();
    } else {
      print("Error: ${response.statusCode}");
    }

    return users;
  }

  Future<User?> getUserFromDatabaseByEmail(String email) async {
    User user = User(
      isArtist: false,
      username: "",
      email: "",
      phoneNumber: "",
    );

    var url = BASE_URL + USER_EMAIL_ENDPOINT + email + "/";
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // print(response.body);
      user = User.fromJson(json.decode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }

    return user;
  }

  Future<User> getUserFromDatabaseByUsername(String username) async {
    User user = User(
      isArtist: false,
      username: "",
      email: "",
      phoneNumber: "",
    );

    var url = BASE_URL + USER_USERNAME_ENDPOINT + username + "/";
    final response = await http.get(
      Uri.parse(url),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body));
    } else {
      print("Error: ${response.statusCode}");
    }

    return user;
  }

  updateUserInDatabase(User? user) async {
    var url = BASE_URL + USER_USERNAME_ENDPOINT + (user?.username ?? "") + "/";
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user?.toJson()),
    );

    if (response.statusCode == 200) {
      print("User updated");
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  deleteUserFromDatabase(String username) async {
    var url = BASE_URL + USER_ENDPOINT + username;
    final response = await http.delete(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print("User deleted");
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
