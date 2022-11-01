import 'package:flutter/material.dart';
import 'package:testovoe_zadanie/constants/app_assets.dart';
import 'package:testovoe_zadanie/screen/user_screen.dart';
import 'dart:math' as math;

import '../constants/app_styles.dart';
import '../widgets/login_text_field.dart';
import '../widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? login;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(height: 400, color: Colors.grey),
          ),
          Align(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
                      image: AssetImage(AppAssets.images.background))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.rotate(
              angle: math.pi / 2.6,
              child: Container(
                  width: 200,
                  height: 615,
                  decoration: const BoxDecoration(
                    gradient: SweepGradient(
                      startAngle: 0.7,
                      endAngle: 3.5,
                      colors: [Colors.grey, Colors.grey],
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 123, left: 24, right: 23),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Вход',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 327,
                  height: 348,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LoginTextField(
                          onSaved: (login) {
                            this.login = login;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        PasswordTextField(
                          onSaved: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 49,
                            right: 48,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 56,
                              ),
                              Container(
                                width: 230,
                                height: 38,
                                child: TextButton(
                                  style: AppStyles.textButton3.copyWith(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ))),
                                  child: const Text(
                                    'Войти',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    final isValidated =
                                        formKey.currentState?.validate() ??
                                            false;

                                    if (isValidated) {
                                      formKey.currentState?.save();

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserPage(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
