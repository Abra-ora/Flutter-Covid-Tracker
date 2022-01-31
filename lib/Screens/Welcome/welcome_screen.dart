import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_auth/models/app_user.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
