// ignore_for_file: unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
// import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
// import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    color: Color(0xFF6F35A5),
                    fontWeight: FontWeight.w800,
                  ),
                  minFontSize: 14,
                  stepGranularity: 2,
                  maxLines: 1,
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/corona.svg",
                    height: size.height * 0.2,
                  ),
                ),
                RoundedInputField(
                  hintText: "Username",
                  controller: _usernameController,
                  onChanged: (value) {},
                  validatorMessage: "Please enter the username",
                ),
                RoundedInputField(
                  icon: IconData(0xe22a, fontFamily: 'MaterialIcons'),
                  hintText: "Your Email",
                  controller: _emailController,
                  validatorMessage: "Please enter your e-mail",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  icon: IconData(0xe4a2, fontFamily: 'MaterialIcons'),
                  hintText: "Phone Number",
                  controller: _numberController,
                  validatorMessage: "Please enter your phone number",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: _passwordController,
                  validatorMessage: "Please enter a valide password",
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () {
                    Map signup = {
                      'username': _usernameController.text,
                      'email': _emailController.text,
                      'phoneNumber': _numberController.text,
                      'password': _passwordController.text
                    };
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                // OrDivider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     SocalIcon(
                //       iconSrc: "assets/icons/facebook.svg",
                //       press: () {},
                //     ),
                //     SocalIcon(
                //       iconSrc: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //     SocalIcon(
                //       iconSrc: "assets/icons/google-plus.svg",
                //       press: () {},
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
