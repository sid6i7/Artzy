import 'package:flutter/material.dart';
import 'package:frontend/helpers/transform/transform.dart';

class EditorsPickCatalog extends StatefulWidget {
  const EditorsPickCatalog({super.key});

  @override
  State<EditorsPickCatalog> createState() => _EditorsPickCatalogState();
}

class _EditorsPickCatalogState extends State<EditorsPickCatalog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1757.30078125,
      height: 878.15625,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 11.116576194763184,
              top: 0.0001220703125,
              right: null,
              bottom: null,
              width: 313.26300048828125,
              height: 200.29330444335938,
              child: RichText(
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    style: TextStyle(
                      height: 1.1718750142027938,
                      fontSize: 50.36021423339844,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 0, 2, 1),

                      /* letterSpacing: -1.259005069732666, */
                    ),
                    children: [
                      TextSpan(
                        text: '''Editor's Picks\n\n''',
                      ),
                      TextSpan(
                        text: '''Shop these Unique Finds''',
                        style: TextStyle(
                          fontSize: 25.18010711669922,

                          /* letterSpacing: null, */
                        ),
                      )
                    ],
                  )),
            ),
            Positioned(
              left: 1495.0,
              top: null,
              right: null,
              bottom: null,
              width: 213.0,
              height: 58.0,
              child: TransformHelper.translate(
                  x: 0.00,
                  y: 242.21,
                  z: 0,
                  child: const Text(
                    '''These are our top picks for you!''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.1718750142027938,
                      fontSize: 25.18010711669922,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),

                      /* letterSpacing: -1.259005069732666, */
                    ),
                  )),
            ),
            Positioned(
              left: 0.0,
              top: null,
              right: null,
              bottom: null,
              width: 1398.3941650390625,
              height: 404.4554138183594,
              child: TransformHelper.translate(
                x: 0.00,
                y: 236.85,
                z: 0,
                child: Text("Row 1 of pics"),
              ),
            ),
            Positioned(
              left: 358.90655517578125,
              top: null,
              right: null,
              bottom: null,
              width: 1398.3941650390625,
              height: 404.4554138183594,
              child: TransformHelper.translate(
                x: 0.00,
                y: -236.85,
                z: 0,
                child: Text("Row 2 of pics"),
              ),
            )
          ]),
    );
  }
}
