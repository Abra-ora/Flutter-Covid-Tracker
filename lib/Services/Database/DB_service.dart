import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Services/auth/auth.dart';
import 'package:flutter_auth/models/firestore_user.dart';

class DBService {
  final FirebaseFirestore _usersCollection = FirebaseFirestore.instance;
  final String uid;
  DBService(this.uid);

  Future UpdateUserData(String name, String email, bool infected) async {
    return await _usersCollection.collection("users").doc(uid).set({
      'name': name,
      'email': email,
      'infected': infected,
    });
  }

  Stream<QuerySnapshot> get users {
    return _usersCollection.snapshotsInSync();
  }

  // // Current user
  // static Future<DocumentReference> CurrUser() async {
  //   final AuthService auth = new AuthService();
  //   User user = await auth.auth.currentUser;
  //   // final curruser =
  //   //     _usersCollection.collection('users').doc(user.uid).get().then(
  //   //         String name =
  //   //     );
  // }

  static Future<User> CurrUser() async {
    final AuthService auth = new AuthService();

    User user = await auth.auth.currentUser;
    
  }
}
