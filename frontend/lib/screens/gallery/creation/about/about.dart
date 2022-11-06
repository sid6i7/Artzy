import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/gallery/creation/about/widgets/form.dart';
import 'package:frontend/screens/gallery/creation/about/widgets/progress_bar.dart';

class GalleryCreationAboutPage extends StatefulWidget {
  const GalleryCreationAboutPage({super.key});

  @override
  State<GalleryCreationAboutPage> createState() =>
      _GalleryCreationAboutPageState();
}

class _GalleryCreationAboutPageState extends State<GalleryCreationAboutPage> {
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
                              left: 525.0,
                              top: 115.0,
                              right: null,
                              bottom: null,
                              width: 884.0,
                              height: 55.0,
                              child: AboutPageProgressBar(),
                            ),
                            const Positioned(
                              left: 274.0,
                              top: 305.0,
                              right: null,
                              bottom: null,
                              width: 1399.0,
                              height: 537.0262451171875,
                              child: AboutPageForm(),
                            ),
                            Positioned(
                              left: 775.0,
                              top: 897.0,
                              right: null,
                              bottom: null,
                              width: 356.26251220703125,
                              height: 66.39421844482422,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      GALLERY_CREATION_PROFILE_ROUTE);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  "Save & Continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 281.0,
                              top: 404.0,
                              right: null,
                              bottom: null,
                              width: 241.0,
                              height: 25.0,
                              child: Text(
                                '''Between 10-20 charachters''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 13.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 157, 150, 144),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 281.0,
                              top: 427.0,
                              right: null,
                              bottom: null,
                              width: 323.0,
                              height: 19.0,
                              child: Text(
                                '''No special characters, spaces, or accented letters''',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 13.0,
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 157, 150, 144),

                                  /* letterSpacing: -0.25, */
                                ),
                              ),
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
