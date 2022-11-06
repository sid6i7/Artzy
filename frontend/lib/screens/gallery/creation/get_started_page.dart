import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/services/database/user_utils.dart';

class GetStartedPage extends ConsumerWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Material(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
            height: 1080.0,
            child: Stack(children: [
              SizedBox(
                  width: constraints.maxWidth,
                  child: SizedBox(
                    width: 1920.0,
                    height: 1080.0,
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 1920.0,
                            height: 1080.0,
                            child: SizedBox(
                              width: 1920.0,
                              height: 1080.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.zero,
                                child: Image.asset(
                                  "images/f064d5e330bea7996963db944b668d19ee2d233d.png",
                                  color: null,
                                  fit: BoxFit.cover,
                                  width: 1920.0,
                                  height: 1080.0,
                                  colorBlendMode: BlendMode.dstATop,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 869.0,
                            top: 356.0,
                            right: null,
                            bottom: null,
                            width: 169.1226348876953,
                            height: 53.928314208984375,
                            child: SizedBox(
                                width: 199.1226348876953,
                                height: 59.928314208984375,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    user?.isArtist = true;
                                    UserUtils().updateUserInDatabase(user);
                                    ref.invalidate(currentUserProvider);
                                    ref.invalidate(currentUserProfileProvider);
                                    Navigator.of(context).pushNamed(
                                        GALLERY_CREATION_ABOUT_ROUTE);
                                  },
                                  child: const Text(
                                    "Get Started",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                )),
                          ),
                          const Positioned(
                            left: 304.0,
                            top: 45.0,
                            right: null,
                            bottom: null,
                            width: 1332.0,
                            height: 237.0,
                            child: Text(
                              '''Millions of people can’t wait to see what your mind is capable of!''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 55.0,
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255),

                                /* letterSpacing: -0.25, */
                              ),
                            ),
                          )
                        ]),
                  ))
            ])),
      );
    }));
  }
}
