import 'package:flutter/material.dart';
import '../../core/utils/route_app.dart'; // Add this line to import RouteApp

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color to match the design
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Semi-transparent effect
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Log into your account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Username/Email TextField
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username/Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password TextField with Forgot link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password action
                    },
                    child: const Text(
                      'Forgot?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Remember Me Checkbox
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                      // Handle remember me action
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Log In Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  // Handle login action
                  Navigator.pushNamed(context,
                      RouteApp.menu); // or to ExploreScreen if you have one
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // Log in with Email Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                icon: const Icon(Icons.email,
                    color: Color.fromARGB(255, 1, 7, 12)),
                onPressed: () {
                  // Handle Email login action
                },
                label: const Text('Log in with Email'),
              ),
              const SizedBox(height: 20),

              // Log in with Facebook Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () {
                  // Handle Facebook login action
                },
                label: const Text('Log in with Facebook'),
              ),
              const SizedBox(height: 20),

              // Sign Up link
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle sign-up action
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.grey),
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

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}
