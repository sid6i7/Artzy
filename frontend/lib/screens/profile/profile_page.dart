import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/fill_frame_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/common/header/header.dart';
import 'package:frontend/screens/profile/widgets/fill_frame.dart';
import 'package:frontend/screens/profile/widgets/profile_frame.dart';
import 'package:frontend/services/database/user_profile_utils.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final request = ref.watch(currentUserProfileProvider);
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 1616.0,
            child: Stack(
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  child: SizedBox(
                    width: 1920.0,
                    height: 1616.0,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Container(
                            color: const Color.fromARGB(255, 248, 244, 240),
                          ),
                        ),
                        const Positioned(
                          left: 0.0,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          width: 1920.0,
                          height: 300.5901794433594,
                          child: HeaderWidget(),
                        ),
                        const Positioned(
                          left: 107.0,
                          top: 390.0,
                          right: null,
                          bottom: null,
                          width: 228.0,
                          height: 57.0,
                          child: Text(
                            '''Profile''',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              height: 1.1718749892215834,
                              fontSize: 66.36000061035156,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 2, 1),

                              /* letterSpacing: -1.2590163946151733, */
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 113.0,
                          top: 531.0,
                          right: null,
                          bottom: null,
                          width: 539.0,
                          height: 957.0,
                          child: ProfileFrame(),
                        ),
                        const Positioned(
                          left: 726.0,
                          top: 502.0,
                          right: null,
                          bottom: null,
                          width: 1095.0,
                          height: 986.0,
                          child: DetailsFill(),
                        ),
                        Positioned(
                          left: 1113.0,
                          top: 1526.0,
                          right: null,
                          bottom: null,
                          width: 322.90155029296875,
                          height: 59.928314208984375,
                          child: request.when(
                            loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            error: (error, stackTrace) {
                              return Text(error.toString());
                            },
                            data: (data) {
                              final profile = data;

                              return TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  width: 322.90155029296875,
                                  height: 59.928314208984375,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      String? bio = ref
                                          .read(fillBioFieldProvider.notifier)
                                          .state;
                                      String? gender = ref
                                          .read(
                                              fillGenderFieldProvider.notifier)
                                          .state;
                                      String? address = ref
                                          .read(
                                              fillAddressFieldProvider.notifier)
                                          .state;

                                      UserProfile updatedProfile =
                                          UserProfile.updateProfile(
                                        profile: profile,
                                        bio: bio,
                                        gender: genderMap[gender],
                                        address: address,
                                      );
                                      UserProfileUtils()
                                          .updateUserProfileInDatabase(
                                        updatedProfile,
                                      );
                                      ref.invalidate(
                                        currentUserProfileProvider,
                                      );
                                    },
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    ));
  }
}
