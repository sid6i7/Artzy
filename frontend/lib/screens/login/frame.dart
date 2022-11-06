import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/routes.dart';

class LoginFrame extends StatefulWidget {
  const LoginFrame({super.key});

  @override
  State<LoginFrame> createState() => _LoginFrameState();
}

class _LoginFrameState extends State<LoginFrame> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Opacity(
        opacity: 0.9700000286102295,
        child: SizedBox(
          width: 960.0,
          height: 1080.0,
          child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Container(
                    color: const Color.fromARGB(255, 248, 244, 240),
                  ),
                ),
                const Positioned(
                  left: 397.0,
                  top: 306.5,
                  right: null,
                  bottom: null,
                  width: 171.0,
                  height: 82.0,
                  child: Text(
                    '''Login''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 64.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),

                      /* letterSpacing: 0.0, */
                    ),
                  ),
                ),
                Positioned(
                  left: 237.5,
                  top: 448.5,
                  right: null,
                  bottom: null,
                  width: 500.0,
                  height: 39.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.9),
                      child: TextFormField(
                        validator: EmailValidator(
                          errorText: "Enter a valid email id",
                        ),
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          icon: Icon(Icons.email),
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          height: 1.171875,
                          fontSize: 16.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),

                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 237.5,
                  top: 512.5,
                  right: null,
                  bottom: null,
                  width: 500.0,
                  height: 39.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.9),
                      child: TextFormField(
                        validator: RequiredValidator(
                            errorText: "password is required"),
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          icon: Icon(Icons.password),
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          height: 1.171875,
                          fontSize: 16.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),

                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 410.5,
                  top: 623.5,
                  right: null,
                  bottom: null,
                  width: 141.0,
                  height: 22.0,
                  child: Text(
                    '''Forgot password?''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.25,
                      fontSize: 16.0,
                      fontFamily: 'Lexend Deca',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),

                      /* letterSpacing: 0.0, */
                    ),
                  ),
                ),
                Consumer(builder: (_, WidgetRef ref, __) {
                  final authService = ref.watch(authServicesProvider);
                  return Positioned(
                    left: 370,
                    top: 683.5,
                    right: null,
                    bottom: null,
                    width: 205.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool loggedIn = await authService.loginWithEmail(
                            _email.text,
                            _password.text,
                            context,
                          );
                          if (loggedIn) {
                            ref.refresh(currentUserProvider);

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HOME_ROUTE,
                              (route) => false,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.75),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
                Positioned(
                  left: 371.5,
                  top: 753.5,
                  right: null,
                  bottom: null,
                  width: 219.0,
                  height: 22.0,
                  child: RichText(
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          height: 1.25,
                          fontSize: 16.0,
                          fontFamily: 'Lexend Deca',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),

                          /* letterSpacing: 0.0, */
                        ),
                        children: [
                          const TextSpan(
                            text: '''need an account?   ''',
                          ),
                          TextSpan(
                            text: '''Sign up''',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed(REGISTER_ROUTE),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 21, 211, 223),
                              /* letterSpacing: null, */
                            ),
                          ),
                        ],
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
