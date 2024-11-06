// features/login_screen.dart
import 'package:flutter/material.dart';
import '../../core/constants/images.dart';
import '../../core/utils/route_app.dart'; // Import RouteApp

class ZenSpaceScreen extends StatelessWidget {
  const ZenSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image without opacity
        Positioned.fill(
          child: Image.asset(
            Images.background, // Ensure the image path is correct
            fit: BoxFit.cover,
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),

              // Title Text without underline
              const Text(
                'zenspace',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 16),

              // Subtitle Text
              Text(
                'Step into a world of luxury and sophistication with our meticulously curated collections',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),

              const Spacer(),

              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  foregroundColor: Colors.black, // Text color
                  minimumSize: const Size(double.infinity, 50), // Button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: () {
                  // Navigasi ke ExploreScreen
                  Navigator.pushNamed(context, RouteApp.login);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Proceed to Login'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Sign Up Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  foregroundColor: Colors.white, // Text color
                  minimumSize: const Size(double.infinity, 50), // Button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(color: Colors.white), // Border color
                  ),
                ),
                onPressed: () {
                  // Handle sign up button press
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User? Sign Up'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
