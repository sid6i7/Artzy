import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 897.0490112304688,
      height: 27.000015258789062,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
      ),
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
              width: 305.03021240234375,
              height: 29.0,
              child: Text(
                '''Art and Collectibles''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171874968889389,
                  fontSize: 22.032785415649414,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: 303.73773193359375,
              top: 0.000015766458091093227,
              right: null,
              bottom: null,
              width: 220.75408935546875,
              height: 29.0,
              child: Text(
                '''Clothing and Shoes''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171874968889389,
                  fontSize: 22.032785415649414,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: 621.5670166015625,
              top: 0.000015766458091093227,
              right: null,
              bottom: null,
              width: 277.48199462890625,
              height: 29.0,
              child: Text(
                '''Toys And Entertainment''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.171874968889389,
                  fontSize: 22.032785415649414,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            )
          ]),
    );
  }
}
