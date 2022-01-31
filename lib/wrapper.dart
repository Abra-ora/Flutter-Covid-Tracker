import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/pages/home_page.dart';
import 'package:flutter_auth/models/app_user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    print("==============================");
    print(user);
    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }
}
