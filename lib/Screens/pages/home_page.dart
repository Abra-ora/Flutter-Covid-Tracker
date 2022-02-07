import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Screens/widgets/home_widgets/drawer.dart';
import 'package:flutter_auth/Services/Database/DB_service.dart';
import 'package:flutter_auth/Services/auth/auth.dart';
import 'package:flutter_auth/models/app_user.dart';
import 'package:provider/provider.dart';

import '../widgets/home_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = new AuthService();
  String s = "a";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //TODO: Add a drawer window
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "Covid-19 Tracker",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
        actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_2_rounded),
              tooltip: 'Show Snackbar',
              onPressed: () {   
              },
            ),
          ],
      ),
      drawer: Home_drawer("username", "email", context),
      body: HomeCategories(),
    );
  }
}
