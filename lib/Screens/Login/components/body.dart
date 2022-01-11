// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/pages/home_page.dart';
import 'package:flutter_auth/Services/auth/auth.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Body extends StatelessWidget {
  // const Body({
  //   Key key,
  // }) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            AutoSizeText(
              "Sign In",
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
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/corona.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              icon: IconData(0xe22a, fontFamily: 'MaterialIcons'),
              hintText: "Your Email",
              validatorMessage: "Please enter your e-mail",
              controller: _emailController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              validatorMessage: "Please enter a valide password",
              controller: _passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Map login = {
                  'email': _emailController.text,
                  'password': _passwordController.text
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
                // Consumer<Auth>(
                //   builder: (context, auth, child) {
                //     if (auth.authentidied) {

                //     } else {
                //       return null;
                //     }
                //   },
                // );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
