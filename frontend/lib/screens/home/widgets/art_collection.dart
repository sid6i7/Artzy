import 'package:flutter/material.dart';

class ArtCollectionCatalog extends StatefulWidget {
  const ArtCollectionCatalog({super.key});

  @override
  State<ArtCollectionCatalog> createState() => _ArtCollectionCatalogState();
}

class _ArtCollectionCatalogState extends State<ArtCollectionCatalog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1757.9998779296875,
      height: 618.4869384765625,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: const [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 1725.37451171875,
              height: 57.081478118896484,
              child: Text(
                '''The Art & Collectibles''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
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
              left: -0.0000559248510398902,
              top: 81.83586883544922,
              right: null,
              bottom: null,
              width: 1757.9998779296875,
              height: 536.6510620117188,
              child: Text("catalog row pics"),
            )
          ]),
    );
  }
}
