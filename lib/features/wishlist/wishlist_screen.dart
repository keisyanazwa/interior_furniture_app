// wishlist_screen.dart
import 'package:flutter/material.dart';
import 'package:interior_furniture_app/features/wishlist/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
      ),
      body: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          if (wishlistProvider.wishlist.isEmpty) {
            return const Center(child: Text("No items in wishlist"));
          }
          return ListView.builder(
            itemCount: wishlistProvider.wishlist.length,
            itemBuilder: (context, index) {
              final product = wishlistProvider.wishlist[index];
              return ListTile(
                leading: Image.network(product['imageUrl']),
                title: Text(product['title']),
                subtitle: Text(product['price']),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    wishlistProvider.removeFromWishlist(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

extension on Object? {}
