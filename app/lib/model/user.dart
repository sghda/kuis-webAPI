import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String username = '';
  String password = '';
  void LogIn(String username, String password) {
    this.username = username;
    this.password = password;
    notifyListeners();
  }
}