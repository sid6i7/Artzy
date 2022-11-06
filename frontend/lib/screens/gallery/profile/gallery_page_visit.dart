import 'package:flutter/material.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/models/gallery.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/screens/common/header/header.dart';

class VisitedGalleryPage extends StatelessWidget {
  final GalleryInstance? gallery;
  final List<ArtworkInstance> artworks;
  final UserProfile? artist;
  const VisitedGalleryPage(
      {super.key,
      required this.gallery,
      required this.artworks,
      required this.artist});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
            height: 8061.406494140625,
            child: Stack(children: [
              SizedBox(
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
                        top: 1273.0,
                        right: null,
                        bottom: null,
                        width: 1819.0,
                        height: 8000.0,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: artworks?.length,
                          itemBuilder: ((context, index) {
                            return SizedBox(
                              width: 450,
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Image.network(
                                      artworks[index].imageUrl ?? "",
                                      height: 300,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      artworks[index].title,
                                      style: const TextStyle(
                                          fontFamily: "Archivo-700",
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Chip(
                                      backgroundColor: Colors.black,
                                      label: Text(
                                          "${artworks[index].category.name}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Archivo-700",
                                            fontSize: 25,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Positioned(
                        left: 53.0,
                        top: 1164.0,
                        right: null,
                        bottom: null,
                        width: 500.0,
                        height: 96.0,
                        child: Row(
                          children: const [
                            Text(
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
                            SizedBox(
                              width: 15,
                            ),
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
                                    gallery?.name ?? "error",
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
                                    gallery?.description ?? "error",
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
                                  left: 1722.0,
                                  top: 406.0,
                                  right: null,
                                  bottom: null,
                                  width: 300,
                                  height: 500,
                                  child: SizedBox(
                                    width: 300.0,
                                    height: 500,
                                    child: Stack(
                                        fit: StackFit.expand,
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            left: 30.0,
                                            top: 0.0,
                                            right: null,
                                            bottom: null,
                                            width: 250.0,
                                            height: 250.0,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  artist?.profilePicture ?? ""),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0.0,
                                            top: 270.0,
                                            right: null,
                                            bottom: null,
                                            width: 300.0,
                                            height: 43.0,
                                            child: Text(
                                              artist?.user.username ?? "",
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                height: 1.0880000591278076,
                                                fontSize: 32.0,
                                                fontFamily: 'Archivo',
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),

                                                /* letterSpacing: -0.3934426009654999, */
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 15.0,
                                            top: 330.0,
                                            right: null,
                                            bottom: null,
                                            width: 250.0,
                                            height: 43.0,
                                            child: TextButton.icon(
                                              icon: const Icon(
                                                  Icons.message_outlined),
                                              onPressed: () {
                                                //TODO: Implement route to request page
                                              },
                                              label: const Text(
                                                '''Request''',
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  height: 1.0880000591278076,
                                                  fontSize: 32.0,
                                                  fontFamily: 'Archivo',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),

                                                  /* letterSpacing: -0.3934426009654999, */
                                                ),
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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              )),
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
      ),
    );
  }
}
