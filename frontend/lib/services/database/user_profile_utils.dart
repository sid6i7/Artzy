import 'package:frontend/config.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/services/database/user_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http_parser/http_parser.dart';

class UserProfileUtils {
  createUserProfile(User user) async {
    final UserProfile profile = UserProfile.fromUser(user);
    var body = jsonEncode(profile.toJson());
    final response = await http.post(
      Uri.parse(BASE_URL + USER_PROFILE_ENDPOINT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(profile.toJson()),
    );

    print("s $response.body");

    if (response.statusCode == 201) {
      print('created user profile');
      return profile;
    } else {
      throw Exception('Failed to create user profile.');
    }
  }

  Future<UserProfile> getProfileFromJson(Map<String, dynamic> json) async {
    final User user =
        await UserUtils().getUserFromDatabaseByUsername(json['user']);
    print(json);
    return UserProfile(
      user: user,
      gender: json['gender'],
      bio: json['bio'],
      address: json['address'],
      profilePicture: "http://127.0.0.1:8000/" + json['profile_picture'],
    );
  }

  Future<UserProfile> getUserProfileFromDatabase(String username) async {
    final url = BASE_URL + USER_PROFILE_ENDPOINT + username + "/";
    final response = await http.get(
      Uri.parse(url),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      final profile = await getProfileFromJson(jsonDecode(response.body));
      return profile;
    } else {
      throw Exception('Failed to get user profile.');
    }
  }

  deleteUserProfileFromDatabase(String username) async {
    final url = BASE_URL + USER_PROFILE_ENDPOINT + username;
    final response = await http.delete(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print('deleted user profile');
    } else {
      throw Exception('Failed to delete user profile.');
    }
  }

  changeProfilePhoto(UserProfile profile, List<int>? image) async {
    final url =
        BASE_URL + USER_PROFILE_ENDPOINT + profile.user.username + "/update/";

    final request = http.MultipartRequest("PUT", Uri.parse(url));
    request.fields['user'] = profile.user.username;
    request.fields['bio'] = profile.bio ?? "";
    request.fields['gender'] = profile.gender;
    request.fields['address'] = profile.address ?? "";
    request.files.add(
      http.MultipartFile.fromBytes(
        "profile_picture",
        image ?? [],
        filename: "${profile.user}_profile_pic.png",
        contentType: MediaType("image", "png"),
      ),
    );
    await request.send().then((response) async {
      if (response.statusCode == 200) {
        print('updated profile picture');
      } else {
        print("could not update profile pic");
        print(await response.stream.bytesToString());
      }
    });
  }

  updateUserProfileInDatabase(UserProfile profile) async {
    final url =
        BASE_URL + USER_PROFILE_ENDPOINT + profile.user.username + "/update/";
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(profile.toJson()),
    );
    print(jsonEncode(profile.toJson()));
    if (response.statusCode == 200) {
      print('updated user profile');
    } else {
      throw Exception('Failed to update user profile.');
    }
  }
}
