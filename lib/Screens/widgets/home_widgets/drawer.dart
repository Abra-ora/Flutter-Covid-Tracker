import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/pages/contacts_page.dart';
import 'package:flutter_auth/Screens/pages/profile_page.dart';

// parameters (String username, String email)
Drawer Home_drawer(String username, String email, BuildContext context) {
  // AuthService _auth = new AuthService();
  // Future<User> user = DBService.CurrUser();
  // String username = user;
  // String email = "email";
  return Drawer(
    child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text(username),
        accountEmail: Text(email),
        currentAccountPicture: CircleAvatar(
          backgroundImage: ExactAssetImage('assets/person2.png'),
        ),
        onDetailsPressed: () {},
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      ),
      ListTile(
        title: Text('Profile'),
        leading: Icon(Icons.person),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage();
              },
            ),
          );
        },
      ),
      Divider(),
      ListTile(
        title: Text('Tracked contacts'),
        leading: Icon(Icons.account_box),
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Contacts();
              },
            ),
          );
        },
      ),
      Divider(),
      ListTile(
        title: Text('Log out'),
        leading: Icon(Icons.logout),
        onTap: () async {
          // await _auth.SingOut();
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
            // Navigator.of(context).pop();
            // Scaffold.of(context).openDrawer();
          }),
    ]),
  );
}
