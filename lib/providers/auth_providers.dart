import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String? email;
  String? password;

  void logIn(String emailText, String passwordText) {
    email = emailText;
    password = passwordText;
    notifyListeners();
  }

  void getUserName(String emailtxt) {
    email = emailtxt;
    notifyListeners();
  }
}
