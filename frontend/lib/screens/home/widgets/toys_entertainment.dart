import 'package:flutter/material.dart';

class ToysAndEntertainmentCatalog extends StatefulWidget {
  const ToysAndEntertainmentCatalog({super.key});

  @override
  State<ToysAndEntertainmentCatalog> createState() =>
      _ToysAndEntertainmentCatalogState();
}

class _ToysAndEntertainmentCatalogState
    extends State<ToysAndEntertainmentCatalog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1767.0,
      height: 640.518798828125,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: const [
            Positioned(
              left: 25.30937957763672,
              top: 0.0001220703125,
              right: null,
              bottom: null,
              width: 1734.1978759765625,
              height: 57.081478118896484,
              child: Text(
                '''Toys & Entertainment''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.1718750142027938,
                  fontSize: 50.36021423339844,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: 0.00011518479004735127,
              top: 103.86788177490234,
              right: null,
              bottom: null,
              width: 1767.0,
              height: 536.6510620117188,
              child: Text("catalog row pics"),
            )
          ]),
    );
  }
}
