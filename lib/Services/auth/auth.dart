import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = true;
  bool get authentidied => _isLoggedIn;

  void login(Map cred) {
    _isLoggedIn = true;
    print(cred);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
