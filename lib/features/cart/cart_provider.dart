// cart_provider.dart
import 'package:flutter/material.dart';

class CartItem {
  final String imageUrl;
  final String title;
  final Color color;
  final double price;
  int quantity; // make quantity mutable

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.color,
    required this.price,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalCost =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(CartItem item) {
    final existingItemIndex = _items
        .indexWhere((i) => i.title == item.title && i.color == item.color);

    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
