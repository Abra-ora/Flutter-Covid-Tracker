import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/pages/home_page.dart';
import 'package:flutter_auth/Services/nearby/nearby_connection.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/app_user.dart';
import 'package:flutter_auth/wrapper.dart';
import 'package:provider/provider.dart';
import 'Services/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Services/object_box/obj_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ObjectBox.createStore();
  NearbyConections cnx = NearbyConections();
  cnx.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
