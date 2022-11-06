import 'package:frontend/models/user.dart';

class UserProfile {
  final User user;
  final String? bio;
  final String gender;
  final String? profilePicture;
  final String? address;

  UserProfile({
    required this.user,
    this.bio,
    required this.gender,
    this.profilePicture,
    this.address,
  });

  factory UserProfile.updateProfile(
      {UserProfile? profile,
      User? user,
      String? bio,
      String? gender,
      String? profilePicture,
      String? address}) {
    print('aaa $address');
    return UserProfile(
      user: user ?? profile?.user ?? User.empty(),
      bio: bio ?? profile?.bio,
      gender: gender ?? profile?.gender ?? "",
      profilePicture: profilePicture ?? profile?.profilePicture,
      address: address ?? profile?.address,
    );
  }

  factory UserProfile.fromUser(User user) {
    return UserProfile(
      user: user,
      bio: "",
      gender: "N",
      profilePicture: null,
      address: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.username,
      'bio': bio,
      'gender': gender,
      'address': address,
    };
  }
}
