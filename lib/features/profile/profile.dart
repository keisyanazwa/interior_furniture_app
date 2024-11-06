import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Variables for storing profile data
  String name = '';
  String major = '';
  String phone = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loadProfileData(); // Load profile data when the screen initializes
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Keisya Anazwa Octa Reviandy';
      major = prefs.getString('major') ?? 'Informatics Engineering';
      phone = prefs.getString('phone') ?? '(581)-307-6902';
      email = prefs.getString('email') ?? 'keisya123@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () async {
              // Navigate to EditProfileScreen and wait for the result
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );

              // Reload the profile data after returning from EditProfileScreen
              loadProfileData();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                major,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(phone, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(email, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.favorite_border, color: Colors.black),
                title: const Text("Your Favorites"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.black),
                title: const Text("Payment"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.people, color: Colors.black),
                title: const Text("Tell Your Friend"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.black),
                title: const Text("Promotions"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.black),
                title: const Text("Settings"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title:
                    const Text("Log out", style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
