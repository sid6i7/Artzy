import 'package:flutter/material.dart';
import 'package:frontend/screens/login/frame.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
            height: 1080.0,
            child: Stack(children: [
              SizedBox(
                  width: constraints.maxWidth,
                  child: SizedBox(
                    width: 1920.0,
                    height: 1080.0,
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 1920.0,
                            height: 1080.0,
                            child: SizedBox(
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
                          ),
                          const Positioned(
                            left: null,
                            top: null,
                            right: 960.0,
                            bottom: 0.0,
                            width: 960.0,
                            height: 1080.0,
                            child: LoginFrame(),
                          )
                        ]),
                  ))
            ])),
      );
    }));
  }
}
