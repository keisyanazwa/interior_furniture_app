// core/config/my_app.dart
import 'package:flutter/material.dart';
// Import ZenSpaceScreen
import '../utils/route_app.dart';

class ZenSpaceApp extends StatelessWidget {
  const ZenSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteApp.login, // Set the initial route to login
      onGenerateRoute: RouteApp.generateRoute, // Use the generateRoute function
      debugShowCheckedModeBanner: false,
    );
  }
}
