import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/models/gallery.dart';
import 'package:frontend/providers/artwork.dart';
import 'package:frontend/providers/gallery.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/common/header/header.dart';

class GalleryProfile extends ConsumerStatefulWidget {
  const GalleryProfile({super.key});

  @override
  ConsumerState<GalleryProfile> createState() => _GalleryProfileState();
}

class _GalleryProfileState extends ConsumerState<GalleryProfile> {
  late List<ArtworkInstance> artworks = [];
  late GalleryInstance? gallery;
  // late UserProfile user = ref.watch(currentUserProfileProvider);

  fetchGalleryContent() async {
    gallery = ref.watch(galleryProvider);
    artworks = ref.watch(artistArtworksProvider);
  }

  @override
  Widget build(BuildContext context) {
    fetchGalleryContent();
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              height: 2061.406494140625,
              child: Stack(children: [
                SizedBox(
                    width: constraints.maxWidth,
                    child: SizedBox(
                      width: 1920.0,
                      height: 2061.0,
                      child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 51.0,
                              top: 1173.0,
                              right: null,
                              bottom: null,
                              width: 1819.0,
                              height: 441.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: artworks.length,
                                itemBuilder: ((context, index) {
                                  return SizedBox(
                                    width: 200,
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            artworks[index].imageUrl ?? "",
                                            height: 150,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "Name: ${artworks[index].title}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "Category: ${artworks[index].category.name}"),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ), //TODO: LIST VIEW BUILDER HERE
                            ),
                            Positioned(
                              left: 53.0,
                              top: 1064.0,
                              right: null,
                              bottom: null,
                              width: 500.0,
                              height: 96.0,
                              child: Row(
                                children: [
                                  const Text(
                                    '''Artwork''',
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      height: 1.0880000591278076,
                                      fontSize: 64.0,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0),

                                      /* letterSpacing: -0.3934426009654999, */
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white),
                                    label: const Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    icon:
                                        const Icon(Icons.add_a_photo_outlined),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(ARTWORK_CREATION_ROUTE);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0.0,
                              top: 325.0,
                              right: null,
                              bottom: null,
                              width: 1920.0,
                              height: 680.0,
                              child: SizedBox(
                                width: 1920.0,
                                height: 680.0,
                                child: Stack(
                                    fit: StackFit.expand,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 391.0,
                                        top: 414.0,
                                        right: null,
                                        bottom: null,
                                        width: 335.0,
                                        height: 57.0,
                                        child: Text(
                                          gallery?.name ?? "",
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            height: 1.2102272033691406,
                                            fontSize: 40.0,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(255, 0, 0, 0),

                                            /* letterSpacing: 0.0, */
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 400.0,
                                        top: 464.0,
                                        right: null,
                                        bottom: null,
                                        width: 996.0,
                                        height: 221.0,
                                        child: Text(
                                          gallery?.description ?? "",
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            height: 1.2102272033691406,
                                            fontSize: 30.0,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(255, 0, 0, 0),

                                            /* letterSpacing: 0.0, */
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1622.0,
                                        top: 426.0,
                                        right: null,
                                        bottom: null,
                                        width: 195.0,
                                        height: 248.0,
                                        child: SizedBox(
                                          width: 195.0,
                                          height: 248.0,
                                          child: Stack(
                                              fit: StackFit.expand,
                                              alignment: Alignment.center,
                                              clipBehavior: Clip.none,
                                              children: [
                                                const Positioned(
                                                  left: 51.0,
                                                  top: 65.0,
                                                  right: null,
                                                  bottom: null,
                                                  width: 101.0,
                                                  height: 72.0,
                                                  child: Text(
                                                    '''Artist Photo''',
                                                    overflow:
                                                        TextOverflow.visible,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      height:
                                                          1.2760000228881836,
                                                      fontSize: 32.0,
                                                      fontFamily:
                                                          'Space Grotesk',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),

                                                      /* letterSpacing: -0.3934426009654999, */
                                                    ),
                                                  ),
                                                ),
                                                const Positioned(
                                                  left: 28.0,
                                                  top: 210.0,
                                                  right: null,
                                                  bottom: null,
                                                  width: 150.0,
                                                  height: 43.0,
                                                  child: Text(
                                                    '''Request''',
                                                    overflow:
                                                        TextOverflow.visible,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      height:
                                                          1.0880000591278076,
                                                      fontSize: 32.0,
                                                      fontFamily: 'Archivo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      decoration: TextDecoration
                                                          .underline,
                                                      /* letterSpacing: -0.3934426009654999, */
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0.0,
                                        top: 0.0,
                                        right: null,
                                        bottom: null,
                                        width: 1920.0,
                                        height: 350.0,
                                        child: SizedBox(
                                          width: 1920.0,
                                          height: 350.0,
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
                                                  height: 350.0,
                                                  child: SizedBox(
                                                    width: 1920.0,
                                                    height: 350.0,
                                                    child: Image(
                                                      image: NetworkImage(
                                                        gallery?.bannerPictureUrl ??
                                                            "",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Positioned(
                                        left: 51.0,
                                        top: 409.0,
                                        right: null,
                                        bottom: null,
                                        width: 290.0,
                                        height: 271.0,
                                        child: SizedBox(
                                          width: 290.0,
                                          height: 271.0,
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
                                                  width: 290.0,
                                                  height: 271.0,
                                                  child: SizedBox(
                                                    width: 290.0,
                                                    height: 271.0,
                                                    child: Image(
                                                      image: NetworkImage(
                                                        gallery?.profilePictureUrl ??
                                                            "",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      )
                                    ]),
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
    ));
  }
}
