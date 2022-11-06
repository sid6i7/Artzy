import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/models/gallery.dart';
import 'package:frontend/screens/common/footer/footer.dart';
import 'package:frontend/screens/common/header/header.dart';
import 'package:frontend/screens/gallery/profile/gallery_page_visit.dart';
import 'package:frontend/services/database/artwork_utils.dart';

import 'package:frontend/services/database/gallery_utils.dart';
import 'package:frontend/services/database/user_profile_utils.dart';

class ArtworkPage extends ConsumerStatefulWidget {
  final ArtworkInstance? artwork;
  const ArtworkPage({super.key, this.artwork});

  @override
  ConsumerState<ArtworkPage> createState() => _ArtworkPageState();
}

class _ArtworkPageState extends ConsumerState<ArtworkPage> {
  late GalleryInstance? gallery;
  Future<bool> fetchGallery() async {
    gallery = await GalleryUtils().getGallery(widget.artwork!.gallery);
    if (gallery != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchGallery(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ClipRRect(
            borderRadius: BorderRadius.zero,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                    height: 1499.406494140625,
                    child: Stack(children: [
                      SizedBox(
                          width: constraints.maxWidth,
                          child: SizedBox(
                            width: 1920.0,
                            height: 1499.0,
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
                                  Positioned(
                                    left: 1053.0,
                                    top: 999.0,
                                    right: null,
                                    bottom: null,
                                    width: 270.0,
                                    height: 72.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        '''Add to wishlist''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.0880000591278076,
                                          fontSize: 28.0,
                                          fontFamily: 'Archivo',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          /* letterSpacing: -1.259005069732666, */
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 1433.0,
                                    top: 999.0,
                                    right: null,
                                    bottom: null,
                                    width: 270.0,
                                    height: 72.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () async {
                                        final artworks = await ArtworkUtils()
                                            .getAllArtWorksOfGallery(
                                                gallery?.name ?? "");
                                        final artist = await UserProfileUtils()
                                            .getUserProfileFromDatabase(
                                                gallery?.owner ?? "");
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              VisitedGalleryPage(
                                                  gallery: gallery,
                                                  artworks: artworks,
                                                  artist: artist)),
                                        );
                                      },
                                      child: const Text(
                                        '''Gallery''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          height: 1.0880000591278076,
                                          fontSize: 28.0,
                                          fontFamily: 'Archivo',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          /* letterSpacing: -1.259005069732666, */
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 958.0,
                                    top: 371.0,
                                    right: null,
                                    bottom: null,
                                    width: 839.0,
                                    height: 571.0,
                                    child: Container(
                                      width: 839.0,
                                      height: 571.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                          fit: StackFit.expand,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              left: 0.0,
                                              top: 222.0,
                                              right: null,
                                              bottom: null,
                                              width: 839.0,
                                              height: 349.0,
                                              child: Container(
                                                width: 839.0,
                                                height: 349.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  boxShadow: kIsWeb
                                                      ? []
                                                      : [
                                                          const BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    63,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            offset: Offset(
                                                                0.0, 4.0),
                                                            blurRadius: 4.0,
                                                          )
                                                        ],
                                                ),
                                                child: Stack(
                                                    fit: StackFit.expand,
                                                    alignment: Alignment.center,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        child: Container(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 10.0,
                                                        top: 0.0,
                                                        right: null,
                                                        bottom: null,
                                                        width: 240.0,
                                                        height: 74.0,
                                                        child: Text(
                                                          widget.artwork
                                                                  ?.description ??
                                                              "",
                                                          overflow: TextOverflow
                                                              .visible,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              const TextStyle(
                                                            height:
                                                                1.0880000856187608,
                                                            fontSize: 36.0,
                                                            fontFamily:
                                                                'Archivo',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    191,
                                                                    191,
                                                                    191),

                                                            /* letterSpacing: 0.0, */
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                            ),
                                            const Positioned(
                                              left: 10.0,
                                              top: 159.0,
                                              right: null,
                                              bottom: null,
                                              width: 431.0,
                                              height: 68.0,
                                              child: Text(
                                                '''About''',
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  height: 1.0880001068115235,
                                                  fontSize: 40.0,
                                                  fontFamily: 'Archivo',
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),

                                                  /* letterSpacing: 0.0, */
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 2.0,
                                              top: 66.0,
                                              right: null,
                                              bottom: null,
                                              width: 839.0,
                                              height: 188.0,
                                              child: Text(
                                                widget.artwork?.title ??
                                                    "error fetching title",
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  height: 1.0880000591278076,
                                                  fontSize: 64.0,
                                                  fontFamily: 'Archivo',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),

                                                  /* letterSpacing: 0.0, */
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: -40.0,
                                              top: 0.0,
                                              right: null,
                                              bottom: null,
                                              width: 428.0,
                                              height: 65.0,
                                              child: Text(
                                                gallery?.owner ??
                                                    "error fetching gallery",
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  height: 1.0880001068115235,
                                                  fontSize: 40.0,
                                                  fontFamily: 'Archivo',
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),

                                                  /* letterSpacing: 0.0, */
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                  Positioned(
                                    left: 78.0,
                                    top: 371.0,
                                    right: null,
                                    bottom: null,
                                    width: 779.0,
                                    height: 687.0,
                                    child: SizedBox(
                                      width: 779.0,
                                      height: 687.0,
                                      child: Image(
                                        image: NetworkImage(
                                          widget.artwork?.imageUrl ?? "",
                                        ),
                                      ),
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
                                  )
                                ]),
                          ))
                    ])),
              );
            }),
          );
        } else {
          return const Center(
            child: Text("Error loading artwork"),
          );
        }
      },
    );
  }
}
