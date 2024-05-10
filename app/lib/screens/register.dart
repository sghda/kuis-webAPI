import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Success"),
          content: Text("Your account has been successfully registered."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
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
                    "Register",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              // Konfirmasi Password
              TextFormField(
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
                obscureText: _obscureText1,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                    icon: Icon(
                      _obscureText1 ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: _obscureText2,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    icon: Icon(
                      _obscureText2 ? Icons.visibility : Icons.visibility_off,
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
                    // Add register logic here
                    _showSuccessDialog(); // Panggil fungsi untuk menampilkan dialog sukses
                  },
                  child: Text("REGISTER"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Set button border radius
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Already have an account? Login here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
