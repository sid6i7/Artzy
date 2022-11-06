import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/providers/gallery_creation.dart';
import 'package:frontend/screens/gallery/creation/artwork/widgets/category.dart';

class ArtworkFormFillWidget extends ConsumerStatefulWidget {
  const ArtworkFormFillWidget({super.key});

  @override
  ConsumerState<ArtworkFormFillWidget> createState() =>
      _ArtworkFormFillWidgetState();
}

class _ArtworkFormFillWidgetState extends ConsumerState<ArtworkFormFillWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Color.fromARGB(255, 217, 217, 217),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 50,
          bottom: 30,
          right: 40,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          1.0,
                          2.0,
                        ),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                  ),
                  width: 500,
                  padding: const EdgeInsets.only(left: 20),
                  child: TextFormField(
                    maxLength: 40,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    onChanged: (value) {
                      ref
                          .watch(galleryCreationArtworkTitleProvider.notifier)
                          .state = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name of your creation",
                      counterText: "",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          1.0,
                          2.0,
                        ),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                  ),
                  width: 500,
                  height: 150,
                  padding: EdgeInsets.only(left: 20),
                  child: CategoryWidget(),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          1.0,
                          2.0,
                        ),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                  ),
                  width: 500,
                  height: 210,
                  padding: EdgeInsets.only(left: 20),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Description cannot be empty"),
                      MaxLengthValidator(230,
                          errorText: "cannot be more than 230 words"),
                    ]),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    onChanged: (value) {
                      ref
                          .watch(galleryCreationArtworkDescriptionProvider
                              .notifier)
                          .state = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "About your creation",
                      counterText: "",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
