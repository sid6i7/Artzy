import 'package:flutter/material.dart';
import 'package:frontend/helpers/transform/transform.dart';
import 'package:frontend/screens/register/frame.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 1080.0,
            child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: 1920.0,
                    height: 1080.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        "images/5a585497170647d0d2c34e35bbb2045194f4669b.png",
                        color: null,
                        fit: BoxFit.cover,
                        width: 1920.0,
                        height: 1080.0,
                        colorBlendMode: BlendMode.dstATop,
                      ),
                    ),
                  ),
                  Positioned(
                    left: null,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    width: 960.0,
                    height: 1080.0,
                    child: TransformHelper.translate(
                      x: 480.00,
                      y: 0.00,
                      z: 0,
                      child: const RegisterFrame(),
                    ),
                  )
                ]),
          ));
    }));
  }
}
