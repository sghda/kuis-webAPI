import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:kuis/model/user.dart'; // Import model user
import 'homepage.dart'; // Import halaman homepage
import 'register.dart'; // Import halaman register

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              // Judul
              Column(
                children: [
                  Text(
                    "BarayaFood",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              // Form
              Center(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<User>(context, listen: false).LogIn(usernameController.text.toString(), passwordController.text.toString());
                            Get.to(()=>HomePage());
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomePage()),
                            // );
                          },
                          child: Text("LOGIN"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6), // Set button border radius
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Register button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text("Don't have an account? Register here"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
