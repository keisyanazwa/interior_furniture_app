import 'package:flutter/material.dart';
import 'package:interior_furniture_app/features/wishlist/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'core/utils/route_app.dart';
import 'features/cart/cart_provider.dart'; // Keep only this import

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
            create: (_) => WishlistProvider()), // Pastikan ini ada
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteApp.zenSpace, // Set the initial route
      onGenerateRoute: RouteApp.generateRoute, // Use the generateRoute function
      debugShowCheckedModeBanner: false,
    );
  }
}
