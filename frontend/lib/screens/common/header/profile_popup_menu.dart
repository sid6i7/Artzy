import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/helpers/svg/svg.dart';
import 'package:frontend/helpers/transform/transform.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/common/header/drop_down_menu.dart';

enum Menu { viewProfile, messages, createGallery, signOut }

final popupItemsLoggedIn = [
  const PopupMenuItem<Menu>(
    value: Menu.viewProfile,
    child: ProfileCardLogginIn(),
  ),
  PopupMenuItem<Menu>(
    value: Menu.messages,
    child: TextButton.icon(
      onPressed: () {
        // TODO: route to messages page
      },
      icon: const Icon(Icons.message),
      label: const Text(
        "Messages",
        style: TextStyle(
          height: 1.171875,
          fontSize: 25.0,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 0, 0, 0),

          /* letterSpacing: 0.0, */
        ),
      ),
    ),
  ),
  PopupMenuItem<Menu>(
    value: Menu.createGallery,
    child: Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(currentUserProvider);

        return TextButton.icon(
          onPressed: () async {
            if (user?.isArtist ?? false) {
              Navigator.of(context).pushNamed(GALLERY_ROUTE);
            } else {
              Navigator.of(context).pushNamed(GET_STARTED_ROUTE);
            }
          },
          icon: const Icon(
            Icons.draw,
          ),
          label: Text(
            (user?.isArtist ?? false) ? "Gallery" : "Create a gallery",
            style: const TextStyle(
              height: 1.171875,
              fontSize: 25.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0),

              /* letterSpacing: 0.0, */
            ),
          ),
        );
      },
    ),
  ),
  PopupMenuItem<Menu>(
    value: Menu.signOut,
    child: Consumer(
      builder: (context, ref, child) {
        final service = ref.watch(authServicesProvider);
        return TextButton.icon(
          onPressed: () async {
            await service.logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
              START_ROUTE,
              (route) => false,
            );
          },
          icon: const Icon(Icons.logout),
          label: const Text(
            "Sign out",
            style: TextStyle(
              height: 1.171875,
              fontSize: 25.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0),

              /* letterSpacing: 0.0, */
            ),
          ),
        );
      },
    ),
  ),
];

final popupItemsLoggedOut = [
  const PopupMenuItem<Menu>(
    value: Menu.viewProfile,
    child: ProfileFileCardLoggedOut(),
  ),
];

class ProfileCardLogginIn extends ConsumerWidget {
  const ProfileCardLogginIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Container(
      width: 250.0,
      height: 86.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 6.518341064453125,
              top: 10.946533203125,
              right: null,
              bottom: null,
              width: 53.47993469238281,
              height: 56.443050384521484,
              child: TransformHelper.rotate(
                  a: 1.00,
                  b: 0.01,
                  c: -0.01,
                  d: 1.00,
                  child: SizedBox(
                    width: 53.47993469238281,
                    height: 56.443050384521484,
                    child: SvgWidget(painters: [
                      SvgPathPainter.fill()
                        ..addPath(
                            'M53.4799 28.2215C53.4799 43.8078 41.508 56.4431 26.74 56.4431C11.9719 56.4431 0 43.8078 0 28.2215C0 12.6352 11.9719 0 26.74 0C41.508 0 53.4799 12.6352 53.4799 28.2215Z')
                        ..color = const Color.fromARGB(255, 217, 217, 217),
                    ]),
                  )),
            ),
            Positioned(
              left: 75.96216583251953,
              top: 9.5555419921875,
              right: null,
              bottom: null,
              width: 255.037841796875,
              height: 45.9555549621582,
              child: Text(
                user!.username,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  height: 1.171875,
                  fontSize: 30.0,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: 75.96216583251953,
              top: 48.73333740234375,
              right: null,
              bottom: null,
              width: 180.61492919921875,
              height: 23.9777774810791,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PROFILE_ROUTE);
                },
                child: const Text(
                  '''View your Profile''',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 20.0,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0),
                    decoration: TextDecoration.underline,
                    /* letterSpacing: 0.0, */
                  ),
                ),
              ),
            )
          ]),
    );
  }
}

class ProfileFileCardLoggedOut extends StatelessWidget {
  const ProfileFileCardLoggedOut({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(LOGIN_ROUTE);
      },
      icon: const Icon(Icons.login),
      label: const Text("Login"),
    );
  }
}
