import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/home/home_page.dart';
import 'package:frontend/screens/login/login_page.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebase = ref.watch(firebaseAppProvider);

    if (firebase != null) {
      final state = ref.watch(authStateProvider);
      return state.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          ref.watch(firebaseAppProvider);
          return const Scaffold(
            body: Center(
              child: Text('could get fetch auth state'),
            ),
          );
        },
        data: (user) {
          if (user != null) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
