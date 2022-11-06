import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 322.90155029296875,
      height: 59.928314208984375,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: const Color.fromARGB(255, 0, 2, 1),
              ),
            ),
            const Positioned(
              left: 127.0,
              top: 14.0,
              right: null,
              bottom: null,
              width: 71.0,
              height: 42.0,
              child: Text(
                '''Save''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 29.0,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),

                  /* letterSpacing: -0.25, */
                ),
              ),
            )
          ]),
    );
  }
}
