import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/gallery.dart';
import 'package:frontend/providers/gallery_creation.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/services/database/gallery_utils.dart';
import 'package:frontend/services/image/image_handler.dart';

import 'widgets/progress_bar.dart';

class GalleryCreationProfilePage extends ConsumerStatefulWidget {
  const GalleryCreationProfilePage({super.key});

  @override
  ConsumerState<GalleryCreationProfilePage> createState() =>
      _GalleryCreationProfilePageState();
}

class _GalleryCreationProfilePageState
    extends ConsumerState<GalleryCreationProfilePage> {
  String uploadBannerText = "Upload Banner";
  String uploadProfileText = "Upload Profile Photo";
  bool iconBannerIsVisible = true;
  bool iconProfileIsVisible = true;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              height: 1028.0,
              child: Stack(children: [
                SizedBox(
                    width: constraints.maxWidth,
                    child: SizedBox(
                      width: 1920.0,
                      height: 1028.0,
                      child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Container(
                                color: Color.fromARGB(255, 248, 244, 240),
                              ),
                            ),
                            const Positioned(
                              left: 521.0,
                              top: 115.0,
                              right: null,
                              bottom: null,
                              width: 886.0,
                              height: 57.0,
                              child: ProfilePageProgressBar(),
                            ),
                            const Positioned(
                              left: 118.0,
                              top: 43.0,
                              right: null,
                              bottom: null,
                              width: 115.0,
                              height: 55.0,
                              child: Text(
                                '''ARTZY''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 32.0,
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                            Positioned(
                              left: 132.0,
                              top: 530.0,
                              right: null,
                              bottom: null,
                              width: 1655.0,
                              height: 314.0,
                              child: SizedBox(
                                width: 1655.0,
                                height: 314.0,
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
                                        width: 1655.0,
                                        height: 314.0,
                                        child: SizedBox(
                                          width: 1655.0,
                                          height: 314.0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.zero,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 217, 217, 217),
                                                  image: DecorationImage(
                                                      image: Image.memory(
                                                    Uint8List.fromList(
                                                      ref
                                                              .watch(
                                                                  galleryCreationBannerPhotoProvider
                                                                      .notifier)
                                                              .getImage() ??
                                                          [],
                                                    ),
                                                  ).image)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 703.0,
                                        top: 98.0,
                                        right: null,
                                        bottom: null,
                                        width: 302.0,
                                        height: 70.0,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 70,
                                              child: IconButton(
                                                tooltip: uploadBannerText,
                                                icon: Visibility(
                                                  visible: iconBannerIsVisible,
                                                  child: const Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 90,
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  ref
                                                      .watch(
                                                          galleryCreationBannerPhotoProvider
                                                              .notifier)
                                                      .setImage(
                                                        await pickImage(),
                                                      );
                                                  setState(
                                                    () {
                                                      uploadBannerText = "";
                                                      iconBannerIsVisible =
                                                          false;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Positioned(
                              left: 877.0,
                              top: 428.0,
                              right: null,
                              bottom: null,
                              width: 179.0,
                              height: 39.0,
                              child: SizedBox(
                                width: 179.0,
                                height: 39.0,
                                child: Stack(
                                    fit: StackFit.expand,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -62.0,
                                        top: -208.0,
                                        right: null,
                                        bottom: null,
                                        width: 290.0,
                                        height: 271.0,
                                        child: SizedBox(
                                          width: 290.0,
                                          height: 271.0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.zero,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 217, 217, 217),
                                                image: DecorationImage(
                                                    image: Image.memory(
                                                  Uint8List.fromList(
                                                    ref
                                                            .watch(
                                                                galleryCreationProfilePhotoProvider
                                                                    .notifier)
                                                            .getImage() ??
                                                        [],
                                                  ),
                                                ).image),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          left: 0.0,
                                          top: 0.0,
                                          right: null,
                                          bottom: null,
                                          width: 181.0,
                                          height: 41.0,
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: IconButton(
                                              tooltip: uploadProfileText,
                                              icon: Visibility(
                                                visible: iconProfileIsVisible,
                                                child: const Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 50,
                                                ),
                                              ),
                                              onPressed: () async {
                                                ref
                                                    .watch(
                                                        galleryCreationProfilePhotoProvider
                                                            .notifier)
                                                    .setImage(
                                                      await pickImage(),
                                                    );
                                                setState(() {
                                                  uploadProfileText = "";
                                                  iconProfileIsVisible = false;
                                                });
                                              },
                                            ),
                                          )),
                                    ]),
                              ),
                            ),
                            const Positioned(
                              left: 132.0,
                              top: 392.0,
                              right: null,
                              bottom: null,
                              width: 237.0,
                              height: 43.0,
                              child: Text(
                                '''Profie Photo''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 36.0,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 132.0,
                              top: 443.0,
                              right: null,
                              bottom: null,
                              width: 633.0,
                              height: 50.0,
                              child: Text(
                                '''Profile photo which will be displayed to the the buyers in your profile page. The photo should be of size (atleast 400x400 pixels and smaller than 10MB in size)''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 16.0,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 0, 0, 0),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 1550.0,
                              top: 392.0,
                              right: null,
                              bottom: null,
                              width: 239.0,
                              height: 43.0,
                              child: Text(
                                '''Banner Photo''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 36.0,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 1151.0,
                              top: 443.0,
                              right: null,
                              bottom: null,
                              width: 638.0,
                              height: 50.0,
                              child: Text(
                                '''Banner photo which will be displayed to the the buyers in your profile page.The photo should be of size (atleast 1920x330 pixels and smaller than 10MB in size)**''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 16.0,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 0, 0, 0),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                            Positioned(
                              left: 801.0,
                              top: 897.0,
                              right: null,
                              bottom: null,
                              width: 296.26251220703125,
                              height: 66.39421844482422,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {
                                  final galleryName = ref
                                      .watch(galleryCreationGalleryNameProvider
                                          .notifier)
                                      .state;

                                  final owner = ref.watch(currentUserProvider);

                                  final galleryDescription = ref
                                      .watch(
                                          galleryCreationGalleryDescriptionProvider
                                              .notifier)
                                      .state;

                                  final galleryProfilePhoto = ref
                                      .watch(galleryCreationProfilePhotoProvider
                                          .notifier)
                                      .getImage();

                                  final galleryBannerPhoto = ref
                                      .watch(galleryCreationBannerPhotoProvider
                                          .notifier)
                                      .getImage();

                                  final GalleryCreation gallery =
                                      GalleryCreation(
                                    name: galleryName ?? "",
                                    owner: owner!.username,
                                    description: galleryDescription,
                                    profilePicture: galleryProfilePhoto,
                                    bannerPicture: galleryBannerPhoto,
                                  );

                                  print(gallery.getBannerPicture);

                                  bool created = await GalleryUtils()
                                      .createGallery(gallery);
                                  Navigator.of(context).pushNamed(
                                      GALLERY_CREATION_ARTWORK_ROUTE);
                                },
                                child: const Text(
                                  "Save & Continue",
                                  style: TextStyle(
                                    height: 1.171875,
                                    fontSize: 20.0,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,

                                    /* letterSpacing: 0.0, */
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ))
              ])),
        );
      }),
    ));
  }
}
