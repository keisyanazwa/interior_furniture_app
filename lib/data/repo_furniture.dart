// Import necessary packages
import 'package:flutter/material.dart';
import 'package:interior_furniture_app/features/material.dart';
import '../../core/constants/images.dart'; // Ensure this path is correct

class Product {
  final String imageUrl;
  final String thumbnailUrl;
  final String name;
  final String description;
  final String price;
  final List<Color> colorOptions;
  final String category; // Add category field

  Product({
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.colorOptions,
    required this.category, // Initialize category field
  });
}

// Define a list of products with unique image URLs
final List<Product> products = [
  // Living Room
  Product(
    imageUrl: Images.rosegrey,
    thumbnailUrl: Images.rosegrey,
    name: 'Scalloped Chair',
    description: 'A chair with a modern classic style resembling a shell.',
    price: '\$86',
    colorOptions: [
      const Color.fromARGB(255, 114, 13, 5),
      Colors.grey,
      Colors.black,
    ],
    category: 'Living Room',
  ),
  Product(
    imageUrl: Images.swoon,
    thumbnailUrl: Images.swoon,
    name: 'Crimson Comfort',
    description: 'A luxurious crimson-finished chair for any living space.',
    price: '\$150',
    colorOptions: [
      const Color.fromARGB(255, 18, 79, 4),
      const Color.fromARGB(255, 2, 94, 108),
      Colors.black,
    ],
    category: 'Living Room',
  ),
  Product(
    imageUrl: Images.sapphire,
    thumbnailUrl: Images.sapphire,
    name: 'Sapphire Serenity',
    description: 'A soothing and stylish addition to your office room.',
    price: '\$120',
    colorOptions: [
      const Color.fromARGB(255, 159, 111, 155),
      Colors.white,
      const Color.fromARGB(255, 44, 13, 127),
    ],
    category: 'Living Room',
  ),
  Product(
    imageUrl: Images.chenille,
    thumbnailUrl: Images.chenille,
    name: 'Chenille Swivel',
    description: 'A soothing and stylish addition to your office room.',
    price: '\$120',
    colorOptions: [
      const Color.fromARGB(255, 188, 12, 12),
      Colors.white,
      const Color.fromARGB(255, 190, 91, 55),
    ],
    category: 'Living Room',
  ),

  // Dining Room
  Product(
    imageUrl: Images.dining1,
    thumbnailUrl: Images.dining1,
    name: 'Classic Dining',
    description: 'Traditional and stylish dining chair.',
    price: '\$200',
    colorOptions: [
      const Color.fromARGB(255, 212, 159, 140),
      Colors.white,
      Colors.black,
    ],
    category: 'Dining Room',
  ),
  Product(
    imageUrl: Images.dining2,
    thumbnailUrl: Images.dining2,
    name: 'Elegant Dining',
    description: 'A perfect addition to your dining area.',
    price: '\$250',
    colorOptions: [
      Colors.black,
      Colors.white,
      Colors.brown,
    ],
    category: 'Dining Room',
  ),

  // Office Room
  Product(
    imageUrl: Images.high_back_office_chair,
    thumbnailUrl: Images.high_back_office_chair,
    name: 'High Back Office Chair',
    description: 'Elegant and comfy.',
    price: '\$82',
    colorOptions: [
      Colors.black,
      Colors.grey,
    ],
    category: 'Office Room',
  ),
  Product(
    imageUrl: Images.minimal,
    thumbnailUrl: Images.minimal,
    name: 'Minimal Office Chair',
    description: 'Modern, minimalist, comfy.',
    price: '\$75',
    colorOptions: [
      const Color.fromARGB(255, 154, 104, 86),
      const Color.fromARGB(255, 104, 66, 52),
      const Color.fromARGB(255, 13, 92, 157),
      Colors.white,
      Colors.black,
    ],
    category: 'Office Room',
  ),
];

class FurnitureRepo {
  // Function to build a single product card widget
  static Widget buildProductCard({
    required BuildContext context,
    required Product product,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imageUrl: product.imageUrl,
              title: product.name,
              description: product.description,
              price: product.price, // Pass the correct price here
              colorOptions: product.colorOptions,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              width:
                  120.0, // Increased width to provide more space for the name
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 14, // Adjusted font size for clarity
              ),
              maxLines: 1, // Limit to one line for cleaner look
              overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
            ),
            const SizedBox(height: 4),
            Text(
              product.price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: product.colorOptions.map((color) {
                return Container(
                  margin: const EdgeInsets.only(right: 4.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  static Widget livingRoomListView(BuildContext context) {
    final List<Product> firstRowProducts = products
        .where((product) => product.category == 'Living Room')
        .take(3)
        .toList();

    final Product secondRowProduct = products.firstWhere(
        (product) => product.name == 'Chenille Swivel',
        orElse: () => firstRowProducts.last);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 160.0, // Increased height to fit better
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: firstRowProducts
                  .map((product) =>
                      buildProductCard(context: context, product: product))
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 160.0, // Increased height to fit better
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildProductCard(context: context, product: secondRowProduct),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget diningRoomListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: products
          .where((product) => product.category == 'Dining Room')
          .map(
              (product) => buildProductCard(context: context, product: product))
          .toList(),
    );
  }

  static Widget officeRoomListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: products
          .where((product) => product.category == 'Office Room')
          .map(
              (product) => buildProductCard(context: context, product: product))
          .toList(),
    );
  }
}
