// ignore_for_file: unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/pages/home_page.dart';
import 'package:flutter_auth/Services/auth/auth.dart';
// import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
// import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  String _email = '';
  String _password = '';
  String _username = '';
  bool infected = false;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                  onChanged: (value) {
                    _username = value.toString().trim();
                  },
                  validatorMessage: "Please enter the username",
                ),
                RoundedInputField(
                  icon: IconData(0xe22a, fontFamily: 'MaterialIcons'),
                  hintText: "Your Email",
                  validatorMessage: "Please enter your e-mail",
                  onChanged: (value) {
                    _email = value.toString().trim();
                  },
                ),
                RoundedPasswordField(
                  validatorMessage:
                      "Please enter a valide password (more than 6 character).",
                  onChanged: (value) {
                    _password = value.toString().trim();
                  },
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () async {
                    print(_email);
                    print(_password);

                    if (_formKey.currentState.validate()) {
                      dynamic res = await _auth.Register(_username,_email, _password);

                      if (res != null) {
                        // _firestore.collection('users').doc(_email).set({
                        //   'name': _username,
                        //   'infected': false
                        // });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      } else {
                        error = "Please check your informations";
                      }
                    }
                  },
                ),
                // SizedBox(height: size.height * 0.03),
                Text(error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0)),
                // SizedBox(height: size.height * 0.03),
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
              ],
            ),
          ),
        ));
  }
}
