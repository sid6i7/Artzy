import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/helpers/svg/svg.dart';
import 'package:frontend/helpers/transform/transform.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/services/database/user_profile_utils.dart';
import 'package:frontend/services/image/image_handler.dart';

class ProfileFrame extends ConsumerStatefulWidget {
  const ProfileFrame({super.key});

  @override
  ConsumerState<ProfileFrame> createState() => _ProfileFrameState();
}

class _ProfileFrameState extends ConsumerState<ProfileFrame> {
  @override
  Widget build(BuildContext context) {
    final request = ref.watch(currentUserProfileProvider);
    return request.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      data: (data) {
        print(data.profilePicture);
        final profile = data;
        return SizedBox(
          width: 539.0,
          height: 986.0,
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
                  width: 539.0,
                  height: 957.0,
                  child: SizedBox(
                    width: 539.0,
                    height: 957.0,
                    child: SvgWidget(painters: [
                      SvgPathPainter.fill()
                        ..addPath('M0 0L539 0L539 957L0 957L0 0Z')
                        ..color = const Color.fromARGB(255, 217, 217, 217),
                    ]),
                  ),
                ),
                Positioned(
                  left: 190.0,
                  top: null,
                  right: null,
                  bottom: null,
                  width: 164.0,
                  height: 39.0,
                  child: TransformHelper.translate(
                      x: 0.00,
                      y: 152.00,
                      z: 0,
                      child: Text(
                        profile.user.phoneNumber,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.1718749799610835,
                          fontSize: 26.770000457763672,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 157, 150, 144),

                          /* letterSpacing: -0.3934426009654999, */
                        ),
                      )),
                ),
                Positioned(
                  left: 82.0,
                  top: null,
                  right: null,
                  bottom: null,
                  width: 380.0,
                  height: 40.0,
                  child: TransformHelper.translate(
                      x: 0.00,
                      y: 105.50,
                      z: 0,
                      child: Text(
                        profile.user.email,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.1718749806826865,
                          fontSize: 27.770000457763672,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 157, 150, 144),

                          /* letterSpacing: -0.3934426009654999, */
                        ),
                      )),
                ),
                Positioned(
                  left: 119.0,
                  top: null,
                  right: null,
                  bottom: null,
                  width: 303.0,
                  height: 60.0,
                  child: TransformHelper.translate(
                      x: 0.00,
                      y: 30.50,
                      z: 0,
                      child: Text(
                        profile.user.username,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.17187498827962,
                          fontSize: 45.77000045776367,
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 2, 1),

                          /* letterSpacing: -0.3934426009654999, */
                        ),
                      )),
                ),
                Positioned(
                  left: 136.0,
                  top: 147.0,
                  right: null,
                  bottom: null,
                  width: 268.0,
                  height: 259.0,
                  child: SizedBox(
                    width: 268.0,
                    height: 259.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: Image(
                          image: NetworkImage(
                            profile.profilePicture ??
                                "https://media.istockphoto.com/photos/space-capsule-astronaut-picture-id1356503404?b=1&k=20&m=1356503404&s=170667a&w=0&h=TG5W7G1VYIPBw6V8x7166X8qVJ6vkIqcUHO4ORdNWe0=",
                          ),
                          color: null,
                          fit: BoxFit.cover,
                          width: 40.0,
                          height: 35.69230651855469,
                          colorBlendMode: BlendMode.dstATop,
                        )),
                  ),
                ),
                Positioned(
                  left: 401.0,
                  top: 88.0,
                  right: null,
                  bottom: null,
                  width: 65.0,
                  height: 58.0,
                  child: Container(
                    child: IconButton(
                      onPressed: () async {
                        final image = await pickImage();
                        if (image != null) {
                          UserProfileUtils().changeProfilePhoto(profile, image);
                        }
                        ref.invalidate(currentUserProfileProvider);
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ]),
        );
      },
    );
  }
}
