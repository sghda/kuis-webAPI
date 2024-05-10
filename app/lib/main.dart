import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuis/model/item.dart';
import 'package:kuis/provider/item_provider.dart';
import 'package:kuis/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNhbG1hIiwiZXhwIjoxNzE1NDQxMDE2fQ.HZJrQj9H2qAGGED2sD9tTn3D1wKIMNBcydLGjmHNAFs'; // Ganti dengan token autentikasi yang valid
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(authToken), // Sertakan token autentikasi saat membuat instance ItemProvider
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
