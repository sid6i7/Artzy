import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/user.dart' as models;
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/services/database/user_profile_utils.dart';
import 'package:frontend/services/database/user_utils.dart';

class CurrentUserNotifier extends StateNotifier<models.User?> {
  CurrentUserNotifier(firebase.User? user) : super(null) {
    setUser(user);
  }

  void setUser(firebase.User? user) async {
    String currentEmail = user?.email ?? "";
    state = await UserUtils().getUserFromDatabaseByEmail(currentEmail);
  }

  models.User? getUser() {
    return state;
  }
}

final currentUserProvider =
    StateNotifierProvider<CurrentUserNotifier, models.User?>(
  (ref) {
    final auth = ref.watch(authServicesProvider);
    final user = auth.getCurrentUser();
    return CurrentUserNotifier(user);
  },
);

final currentUserProfileProvider = FutureProvider<UserProfile>(
  (ref) async {
    final user = ref.watch(currentUserProvider);
    print(user?.username);
    final profile = await UserProfileUtils().getUserProfileFromDatabase(
      user?.username ?? "",
    );
    return profile;
  },
);
