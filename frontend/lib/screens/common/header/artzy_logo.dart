import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/home/home_page.dart';

class ArtzyLogoWidget extends StatelessWidget {
  const ArtzyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.52459716796875,
      height: 78.68852233886719,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 15.73770523071289,
              top: 25.73770523071289,
              right: null,
              bottom: null,
              width: 127.0,
              height: 60.0,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const HomePage()),
                      ));
                },
                child: const Text(
                  '''Artzy''',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.1718750319560076,
                    fontSize: 44.360652923583984,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 2, 1),
                  ),
                  /* letterSpacing: -1.2590162754058838, */
                ),
              ),
            )
          ]),
    );
  }
}
