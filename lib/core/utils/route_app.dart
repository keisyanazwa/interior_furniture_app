// route_app.dart
import 'package:flutter/material.dart';
import '../../features/screen/zen_space_screen.dart'; // Import ZenSpace screen
import '../../features/screen/login.dart'; // Import Login screen
import '../../features/main/menu_screen.dart'; // Import Menu screen

class RouteApp {
  static const String zenSpace = '/zen'; // Use '=' instead of '=>'
  static const String login = '/login';
  static const String menu = '/menu';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case zenSpace:
        return MaterialPageRoute(builder: (_) => const ZenSpaceScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const ZenSpaceScreen()); // Fallback to ZenSpaceScreen
    }
  }
}
