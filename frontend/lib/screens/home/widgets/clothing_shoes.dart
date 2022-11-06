import 'package:flutter/material.dart';

class ClothingAndShoesCatalog extends StatefulWidget {
  const ClothingAndShoesCatalog({super.key});

  @override
  State<ClothingAndShoesCatalog> createState() =>
      _ClothingAndShoesCatalogState();
}

class _ClothingAndShoesCatalogState extends State<ClothingAndShoesCatalog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1758.0,
      height: 618.4864501953125,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: const [
            Positioned(
              left: 18.785621643066406,
              top: -0.000213623046875,
              right: null,
              bottom: null,
              width: 1716.166259765625,
              height: 57.081478118896484,
              child: Text(
                '''The Clothing & Shoes ''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.right,
                style: TextStyle(
                  height: 1.1718750142027938,
                  fontSize: 50.36021423339844,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 2, 1),

                  /* letterSpacing: -1.259005069732666, */
                ),
              ),
            ),
            Positioned(
              left: 0.00017630074580665678,
              top: 81.83515167236328,
              right: null,
              bottom: null,
              width: 1758.0,
              height: 536.6510620117188,
              child: Text("catalog row pics"),
            )
          ]),
    );
  }
}
