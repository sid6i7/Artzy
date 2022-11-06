import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/gallery.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';
import 'profile_popup_menu.dart';

enum Menu { viewProfile, messages, createGallery, signOut }

class ProfileButtonWidget extends StatefulWidget {
  const ProfileButtonWidget({super.key});

  @override
  State<ProfileButtonWidget> createState() => _ProfileButtonWidgetState();
}

class _ProfileButtonWidgetState extends State<ProfileButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(currentUserProvider);
        return Container(
          width: 100.78688049316406,
          height: 58.22951126098633,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.88524627685547),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(63, 0, 0, 0),
                offset: Offset(0.0, 6.295081615447998),
                blurRadius: 6.295081615447998,
              )
            ],
          ),
          child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.88524627685547),
                  child: Container(
                    width: 50,
                    color: const Color.fromARGB(255, 217, 217, 217),
                  ),
                ),
                PopupMenuButton<Menu>(
                  itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem<Menu>(
                      value: Menu.viewProfile,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed(PROFILE_ROUTE);
                        },
                        icon: Icon(Icons.person),
                        label: Text("${user?.username}",
                            style: const TextStyle(
                              height: 1.171875,
                              fontSize: 25.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            )),
                      ),
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
                                Navigator.of(context)
                                    .pushNamed(GET_STARTED_ROUTE);
                              }
                            },
                            icon: const Icon(
                              Icons.draw,
                            ),
                            label: Text(
                              (user?.isArtist ?? false)
                                  ? "Gallery"
                                  : "Create a gallery",
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
                              ref.invalidate(currentUserProvider);
                              ref.invalidate(currentUserProfileProvider);
                              ref.invalidate(galleryProvider);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                LOGIN_ROUTE,
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
                    )
                  ],
                )
              ]),
        );
      },
    );
  }
}
