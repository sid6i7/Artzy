import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/providers/gallery_creation.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/gallery/creation/artwork/widgets/progress_bar.dart';
import 'package:frontend/services/database/artwork_utils.dart';
import 'package:frontend/services/image/image_handler.dart';
import 'widgets/form.dart';
import 'package:flutter/foundation.dart';

class GalleryCreationArtworkPage extends ConsumerStatefulWidget {
  const GalleryCreationArtworkPage({super.key});

  @override
  ConsumerState<GalleryCreationArtworkPage> createState() =>
      _GalleryCreationArtworkPageState();
}

class _GalleryCreationArtworkPageState
    extends ConsumerState<GalleryCreationArtworkPage> {
  bool uploadIconIsVisible = true;
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
              height: 1024.0,
              child: Stack(children: [
                SizedBox(
                    width: constraints.maxWidth,
                    child: SizedBox(
                      width: 1920.0,
                      height: 1024.0,
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
                              left: 501.0,
                              top: 224.0,
                              right: null,
                              bottom: null,
                              width: 310.0,
                              height: 58.0,
                              child: Text(
                                '''Add artwork''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.1666666666666667,
                                  fontSize: 48.0,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.800000011920929, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 555.0,
                              top: 308.0,
                              right: null,
                              bottom: null,
                              width: 415.0,
                              height: 74.0,
                              child: Text(
                                '''Add artwork to your gallery so that others can see it''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 24.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            Positioned(
                              left: 705,
                              top: 535.0,
                              right: null,
                              bottom: null,
                              width: 280.0,
                              height: 240.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 217, 217, 217),
                                  image: DecorationImage(
                                      image: Image.memory(
                                    Uint8List.fromList(
                                      ref
                                              .watch(
                                                  galleryCreationArtworkPictureProvider
                                                      .notifier)
                                              .getImage() ??
                                          [],
                                    ),
                                  ).image),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () async {
                                      ref
                                          .watch(
                                              galleryCreationArtworkPictureProvider
                                                  .notifier)
                                          .setImage(await pickImage());
                                      setState(() {
                                        uploadIconIsVisible = false;
                                      });
                                    },
                                    icon: Visibility(
                                      visible: uploadIconIsVisible,
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 127.0,
                              top: 283.0,
                              right: null,
                              bottom: null,
                              width: 127.0,
                              height: 38.0,
                              child: RichText(
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  text: const TextSpan(
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 24.0,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 2, 1),

                                      /* letterSpacing: -0.25, */
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '''Photos''',
                                        style: TextStyle(
                                          fontSize: 31.0,
                                          fontFamily: 'Archivo',
                                          fontWeight: FontWeight.w700,

                                          /* letterSpacing: null, */
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            const Positioned(
                              left: 127.0,
                              top: 669.0,
                              right: null,
                              bottom: null,
                              width: 63.0,
                              height: 41.0,
                              child: Text(
                                '''Tips:''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.7142857142857142,
                                  fontSize: 21.0,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 168.0,
                              top: 334.0,
                              right: null,
                              bottom: null,
                              width: 193.0,
                              height: 146.0,
                              child: Text(
                                '''This is how you will be able to add artwork to your gallery!''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.6363636363636365,
                                  fontSize: 22.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 156.0,
                              top: 721.0,
                              right: null,
                              bottom: null,
                              width: 193.0,
                              height: 182.0,
                              child: Text(
                                '''Use natural light and no flash.
Shoot against a clean, simple background.''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 2.0,
                                  fontSize: 18.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 168.0,
                              top: 498.0,
                              right: null,
                              bottom: null,
                              width: 193.0,
                              height: 110.0,
                              child: Text(
                                '''You can add more through your gallery later''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 20.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 2, 1),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1181.0,
                              top: 950.0,
                              right: null,
                              bottom: null,
                              width: 345.0,
                              height: 54.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text(
                                  "Save & Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () async {
                                  final galleryName = ref
                                      .read(galleryCreationGalleryNameProvider
                                          .notifier)
                                      .state;

                                  final artworkTitle = ref
                                      .read(galleryCreationArtworkTitleProvider
                                          .notifier)
                                      .state;

                                  final artworkDescription = ref
                                      .read(
                                          galleryCreationArtworkDescriptionProvider
                                              .notifier)
                                      .state;

                                  final categories = ref
                                      .read(artworkCategoryProvider.notifier)
                                      .state;

                                  final image = ref
                                      .read(
                                          galleryCreationArtworkPictureProvider
                                              .notifier)
                                      .getImage();

                                  ArtworkCreation artwork = ArtworkCreation(
                                    gallery: galleryName ?? "",
                                    title: artworkTitle ?? "",
                                    description: artworkDescription,
                                    category: categories.first,
                                    image: image,
                                  );
                                  await ArtworkUtils().createArtwork(artwork);
                                  Navigator.of(context).pushNamed(
                                    GALLERY_ROUTE,
                                  );
                                },
                              ),
                            ),
                            const Positioned(
                              left: 531.0,
                              top: 118.0,
                              right: null,
                              bottom: null,
                              width: 850.376708984375,
                              height: 19.83333396911621,
                              child: ArtworkPageProgressBar(),
                            ),
                            const Positioned(
                              left: 977.0,
                              top: 380.0,
                              right: null,
                              bottom: null,
                              width: 753.0,
                              height: 541.0,
                              child: ArtworkFormFillWidget(),
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
                            )
                          ]),
                    ))
              ])),
        );
      }),
    ));
  }
}
