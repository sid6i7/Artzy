import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/services/auth/auth.dart';
import 'package:frontend/services/auth/validation.dart';
import 'package:frontend/services/database/user_profile_utils.dart';
import 'package:frontend/services/database/user_utils.dart';
import 'package:frontend/utils/widgets.dart';

class RegisterFrame extends StatefulWidget {
  const RegisterFrame({super.key});

  @override
  State<RegisterFrame> createState() => _RegisterFrameState();
}

class _RegisterFrameState extends State<RegisterFrame> {
  var accountType = "Enthusiast";

  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _phoneNumber;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _phoneNumber = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Opacity(
          opacity: 0.9700000286102295,
          child: Container(
            color: const Color.fromARGB(255, 248, 244, 240).withOpacity(0.9),
            width: 960.0,
            height: 1080.0,
            child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    left: 247.5,
                    top: 220.0,
                    right: null,
                    bottom: null,
                    width: 467.0,
                    height: 79.0,
                    child: Text(
                      '''Register''',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 55.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),
                        /* letterSpacing: 0.0, */
                      ),
                    ),
                  ),
                  Positioned(
                    left: 273.5,
                    top: 368.0,
                    right: null,
                    bottom: null,
                    width: 413.0,
                    height: 39.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: TextFormField(
                          controller: _username,
                          validator: RequiredValidator(
                              errorText: "Username cannot be empty"),
                          decoration: const InputDecoration(
                            hintText: "Username",
                            icon: Icon(Icons.abc),
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
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 273.5,
                    top: 452.0,
                    right: null,
                    bottom: null,
                    width: 413.0,
                    height: 39.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) =>
                              Validator.validateEmail(email: value),
                          decoration: const InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.abc),
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
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 273.5,
                    top: 536.0,
                    right: null,
                    bottom: null,
                    width: 413.0,
                    height: 39.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        child: TextFormField(
                          controller: _phoneNumber,
                          validator: MultiValidator([
                            RequiredValidator(
                              errorText: "Phone number is required",
                            ),
                            MaxLengthValidator(10,
                                errorText: "enter a valid phone no.")
                          ]),
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            icon: Icon(Icons.phone),
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
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 273.5,
                    top: 620.0,
                    right: null,
                    bottom: null,
                    width: 413.0,
                    height: 39.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: (value) =>
                              Validator.validatePassword(password: value),
                          decoration: const InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock),
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
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 273.5,
                    top: 704.0,
                    right: null,
                    bottom: null,
                    width: 413.0,
                    height: 39.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        child: TextFormField(
                          controller: _confirmPassword,
                          obscureText: true,
                          validator: RequiredValidator(
                            errorText: "Password confirmation is required",
                          ),
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            icon: Icon(Icons.lock),
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
                          /* letterSpacing: 0.0, */
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 275.5,
                    top: 825.0,
                    right: null,
                    bottom: null,
                    width: 409.0,
                    height: 40.0,
                    child: Consumer(builder: (_, WidgetRef ref, __) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_password.text == _confirmPassword.text) {
                              var service = ref.watch(authServicesProvider);
                              final response = await service.registerWithEmail(
                                _email.text,
                                _password.text,
                                _username.text,
                                context,
                              );
                              if (response != null) {
                                await service.sendEmailVerification();
                                await showAlertDialog(
                                  context: context,
                                  title: "Success",
                                  content:
                                      "A confirmation email has been sent to your email address",
                                );
                                var user = User(
                                  isArtist: false,
                                  username: _username.text,
                                  email: _email.text,
                                  phoneNumber: _phoneNumber.text,
                                );
                                await UserUtils().addUserToDatabase(user);
                                await UserProfileUtils()
                                    .createUserProfile(user);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    LOGIN_ROUTE,
                                    (Route<dynamic> route) => false);
                              }
                            } else {
                              showAlertDialog(
                                  context: context,
                                  title: "Error",
                                  content: "Passwords don't match");
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.75),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            height: 1.171875,
                            fontSize: 16.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255),
                            /* letterSpacing: 0.0, */
                          ),
                        ),
                      );
                    }),
                  ),
                  Positioned(
                    left: 372.5,
                    top: 920.0,
                    right: null,
                    bottom: null,
                    width: 217.0,
                    height: 42.0,
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
                              text: '''Already have an account?   ''',
                            ),
                            TextSpan(
                              text: '''Login''',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        LOGIN_ROUTE, (route) => false),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 21, 211, 223),

                                /* letterSpacing: null, */
                              ),
                            )
                          ],
                        )),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
