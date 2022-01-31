import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Services/Database/DB_service.dart';
import 'package:flutter_auth/models/app_user.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // get User from FirebaseUser
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(user.uid, user.email) : null;
  }

  // Auth change user stream
  Stream<AppUser> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in  : with email & password
  Future Login(String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register  : with email & password
  Future Register(String name, String email, String password) async {
    try {
      UserCredential res = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = res.user;
      await DBService(user.uid).UpdateUserData(name, email, false);

      return this._userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future SingOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
