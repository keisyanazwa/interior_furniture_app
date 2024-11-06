import 'package:flutter/material.dart';
import '../../core/constants/images.dart';
import '../../data/repo_furniture.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Bagian atas dengan wallpaper
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.explore),
                  fit: BoxFit.cover,
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'explore',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Reflection of your style, taste, and personality',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        // Handle discover more button press
                      },
                      child: const Text('Discover More'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Bagian bawah dengan background putih
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommend for you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DefaultTabController(
                      length: 3,
                      child: Expanded(
                        child: Column(
                          children: [
                            const TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                              tabs: [
                                Tab(text: 'Living Room'),
                                Tab(text: 'Dining Room'),
                                Tab(text: 'Office Room'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  FurnitureRepo.livingRoomListView(context),
                                  FurnitureRepo.diningRoomListView(context),
                                  FurnitureRepo.officeRoomListView(context),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
