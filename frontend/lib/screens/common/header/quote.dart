import 'package:flutter/material.dart';
import 'package:frontend/helpers/transform/transform.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1920.0,
      height: 119.60655975341797,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: const Color.fromARGB(255, 217, 217, 217),
              ),
            ),
            Positioned(
              left: 178.36883544921875,
              top: null,
              right: null,
              bottom: null,
              width: 1581.0,
              height: 50.0,
              child: TransformHelper.translate(
                  x: 0.00,
                  y: 1.00,
                  z: 0,
                  child: const Text(
                    '''The object of art is not to reproduce reality, but to create a reality of the same intensity''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.1718749684385135,
                      fontSize: 37.77049255371094,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 2, 1),

                      /* letterSpacing: -0.3934426009654999, */
                    ),
                  )),
            )
          ]),
    );
  }
}
