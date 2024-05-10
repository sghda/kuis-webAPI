import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarayaFood Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

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
                            // Simulasi autentikasi sederhana
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to profile page
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Food Item 1'),
            subtitle: Text('Description of food item 1'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add food item to cart
              },
            ),
          ),
          ListTile(
            title: Text('Food Item 2'),
            subtitle: Text('Description of food item 2'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add food item to cart
              },
            ),
          ),
          // Add more food items here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to cart page
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
