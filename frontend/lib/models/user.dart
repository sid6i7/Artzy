class User {
  late bool isArtist;
  late String username;
  late String email;
  late String phoneNumber;

  User({
    required this.isArtist,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  factory User.empty() {
    return User(
      isArtist: false,
      username: "",
      email: "",
      phoneNumber: "",
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isArtist: json['is_artist'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_artist': isArtist,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}
