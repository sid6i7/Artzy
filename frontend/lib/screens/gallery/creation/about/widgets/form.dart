import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/gallery_creation.dart';

class AboutPageForm extends ConsumerStatefulWidget {
  const AboutPageForm({super.key});

  @override
  ConsumerState<AboutPageForm> createState() => _AboutPageFormState();
}

class _AboutPageFormState extends ConsumerState<AboutPageForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1399.0,
      height: 537.0262451171875,
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
              width: 1399.0,
              height: 92.50248718261719,
              child: SizedBox(
                width: 1399.0,
                height: 92.50248718261719,
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 1.1368683772161603e-13,
                        top: 37.50248336791992,
                        right: null,
                        bottom: null,
                        width: 1399.0,
                        height: 55.0,
                        child: SizedBox(
                          width: 1399.0,
                          height: 55.0,
                          child: Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.zero,
                                  child: Container(
                                    color: Color.fromARGB(255, 241, 236, 230),
                                  ),
                                ),
                                Positioned(
                                  left: 16.0,
                                  top: 16.0,
                                  right: null,
                                  bottom: null,
                                  width: 555.0,
                                  height: 25.0,
                                  child: TextFormField(
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counterText: "",
                                      hintText: "Enter your gallery name",
                                    ),
                                    textAlign: TextAlign.left,
                                    onChanged: (value) {
                                      ref
                                          .watch(
                                              galleryCreationGalleryNameProvider
                                                  .notifier)
                                          .state = value;
                                    },
                                    style: const TextStyle(
                                      height: 1.171875,
                                      fontSize: 18.0,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0),

                                      /* letterSpacing: -0.25, */
                                    ),
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
                        width: 65.0,
                        height: 25.0,
                        child: Text(
                          '''Name *''',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 18.0,
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 2, 1),

                            /* letterSpacing: -0.25, */
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Positioned(
              left: 0.0,
              top: 162.0,
              right: null,
              bottom: null,
              width: 1399.0,
              height: 375.0262756347656,
              child: SizedBox(
                width: 1399.0,
                height: 375.0262756347656,
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 1.1368683772161603e-13,
                        top: 41.66967010498047,
                        right: null,
                        bottom: null,
                        width: 1399.0,
                        height: 333.3565673828125,
                        child: SizedBox(
                          width: 1399.0,
                          height: 333.3565673828125,
                          child: Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.zero,
                                  child: Container(
                                    color: Color.fromARGB(255, 241, 236, 230),
                                  ),
                                ),
                                Positioned(
                                  left: 16.0,
                                  top: 16.0,
                                  right: null,
                                  bottom: null,
                                  width: 1365.0,
                                  height: 330.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    maxLength: 1300,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          '''What is your gallery about?''',
                                    ),
                                    textAlign: TextAlign.left,
                                    onChanged: (value) {
                                      ref
                                          .watch(
                                              galleryCreationGalleryDescriptionProvider
                                                  .notifier)
                                          .state = value;
                                    },
                                    style: const TextStyle(
                                      height: 1.171875,
                                      fontSize: 18.0,
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0),

                                      /* letterSpacing: -0.25, */
                                    ),
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
                        width: 114.0,
                        height: 25.0,
                        child: Text(
                          '''Description *''',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 18.0,
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 2, 1),

                            /* letterSpacing: -0.25, */
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ]),
    );
  }
}
