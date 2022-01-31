// ignore_for_file: missing_return

import 'package:firebase_auth/firebase_auth.dart';
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
  String _email = "";
  String _password = "";
  String error = "";
  final AuthService _auth = AuthService();
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
              hintText: "E-mail",
              validatorMessage: "Please enter a valide e-mail",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              validatorMessage: "Please enter a valide password",
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (_formKey.currentState.validate()) {
                  dynamic res = await _auth.Login(_email, _password);
                  if (res == null) {
                    error = "Please check your informations";
                  } 
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  }
                }
              },
            ),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
