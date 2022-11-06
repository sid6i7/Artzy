import 'services/database/user_profile_utils.dart';

var service = UserProfileUtils();

void main(List<String> args) async {
  var profile = await service.getUserProfileFromDatabase("sid6i7");
  print(profile.gender);
}
