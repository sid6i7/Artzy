import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/services/auth/auth.dart';

class FirebaseAppNotifier extends StateNotifier<FirebaseApp?> {
  FirebaseAppNotifier() : super(null) {
    initialize();
  }
  initialize() async {
    state = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

final firebaseAppProvider =
    StateNotifierProvider<FirebaseAppNotifier, FirebaseApp?>(
  (ref) {
    return FirebaseAppNotifier();
  },
);

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthService>((ref) {
  return AuthService(service: ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
