import 'package:firebase_auth/firebase_auth.dart';
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
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(s),
            accountEmail: Text('aleydon@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/person.png'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                child: Text('A'),
                backgroundColor: Colors.white60,
              ),
              CircleAvatar(
                child: Text('R'),
              ),
            ],
            onDetailsPressed: () {},
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onLongPress: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onLongPress: () async {
              await _auth.SingOut();
            },
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onLongPress: () {},
          ),
          ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
                // Scaffold.of(context).openDrawer();
              }),
        ]),
      ),
      body: HomeCategories(),
    );
  }
}
