import 'package:flutter/material.dart';
import 'package:interior_furniture_app/features/cart/cartscreen.dart';
import 'package:interior_furniture_app/features/home/explore_screen.dart';
import 'package:interior_furniture_app/features/profile/profile.dart';
import 'package:interior_furniture_app/features/wishlist/wishlist_screen.dart';
// Import WishlistScreen

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ExploreScreen(), // Index 0
    const CartScreen(), // Index 1 (Cart Screen)
    const WishlistScreen(), // Index 2 (Wishlist Screen)
    const ProfileScreen(), // Index 3 (Profile Screen)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
