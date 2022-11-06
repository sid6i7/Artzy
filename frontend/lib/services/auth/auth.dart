import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/services/auth/exceptions.dart';
import 'package:frontend/utils/widgets.dart';

initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class AuthService {
  late FirebaseAuth service;

  AuthService({required this.service});

  User? getCurrentUser() {
    return service.currentUser;
  }

  Stream<User?> get authStateChange => service.authStateChanges();

  Future<User?> registerWithEmail(String email, String password,
      String username, BuildContext context) async {
    try {
      var credential = await service.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = credential.user;
      user?.updateDisplayName(username);
      return user;
    } on FirebaseAuthException catch (e) {
      try {
        if (e.code == "email-already-in-use") {
          throw EmailAlreadyInUseException();
        } else {
          throw UnknownException();
        }
      } on AuthException catch (e) {
        showAlertDialog(
          context: context,
          title: "Error",
          content: e.message,
        );
      }
    }
    return null;
  }

  logout() async {
    await service.signOut();
  }

  Future<bool> loginWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await service.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      try {
        if (e.code == "user-disabled") {
          throw AccountDisabledException();
        } else if (e.code == "user-not-found") {
          throw AccountDoesNotExistException();
        } else if (e.code == "wrong-password") {
          throw WrongPasswordException();
        }
      } on AuthException catch (e) {
        showAlertDialog(
          context: context,
          title: "Error",
          content: e.message,
        );
      }
      return false;
    }
  }

  bool? isEmailVerified() {
    bool? isVerfied = service.currentUser?.emailVerified;
    return isVerfied;
  }

  sendEmailVerification() async {
    print("sending email verification");
    await service.currentUser?.sendEmailVerification();
  }
}
