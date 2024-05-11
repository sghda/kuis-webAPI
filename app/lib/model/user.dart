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

// class User {
//   final int id;
//   final String username;
//   final String token;

//   User({required this.id, required this.username, required this.token});

//   factory User.fromJson(Map<String, dynamic> json, String token) {
//     return User(
//       id: json['id'],
//       username: json['username'],
//       token: token,
//     );
//   }
// }
