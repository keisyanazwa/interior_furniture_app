import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart/cart_provider.dart';
import 'wishlist/wishlist_provider.dart';
import 'cart/cartscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
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
      home: ProductDetailScreen(
        imageUrl: 'assets/img/rosegrey.jpg',
        description: 'A chair with a modern classic style resembling a shell.',
        title: 'Scalloped Chair',
        price: '\$86',
        colorOptions: [
          Color.fromARGB(255, 114, 13, 5),
          Colors.grey,
          Colors.black,
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String title;
  final String price;
  final List<Color> colorOptions;

  const ProductDetailScreen({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.price,
    required this.colorOptions,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Color? _selectedColor;
  int _quantity = 1;
  bool _isLiked = false; // Menyimpan status "disukai"

  void _addToCart() {
    if (_selectedColor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a color.')),
      );
      return;
    }

    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    cartProvider.addToCart(CartItem(
      title: widget.title,
      imageUrl: widget.imageUrl,
      color: _selectedColor!,
      price: double.parse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')),
      quantity: _quantity,
    ));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${widget.title} to cart! Quantity: $_quantity'),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  void _toggleWishlist() {
    setState(() {
      _isLiked = !_isLiked; // Mengubah status "disukai"
    });

    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final product = {
      'title': widget.title,
      'imageUrl': widget.imageUrl,
      'price': widget.price,
    };

    if (_isLiked) {
      wishlistProvider.addToWishlist(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.title} added to wishlist')),
      );
    } else {
      wishlistProvider.removeFromWishlist(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.title} removed from wishlist')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.black,
            ),
            onPressed: _toggleWishlist, // Panggil fungsi untuk toggle wishlist
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.imageUrl,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  children: widget.colorOptions.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                      child: ColorOption(
                        color: color,
                        isSelected: _selectedColor == color,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                QuantitySelector(
                  initialCount: _quantity,
                  onChanged: (newCount) {
                    setState(() {
                      _quantity = newCount;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _addToCart,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 8),
                      Text('Add to Cart'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorOption({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isSelected
            ? Border.all(
                width: 2.0, color: const Color.fromARGB(255, 72, 130, 197))
            : null,
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final int initialCount;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    required this.initialCount,
    required this.onChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _increment() {
    setState(() {
      count++;
    });
    widget.onChanged(count);
  }

  void _decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
      widget.onChanged(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
        ),
        Text(count.toString(), style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}
