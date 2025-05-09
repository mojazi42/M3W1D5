import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String name = "Mohammed";
  final String email = "mojazi42@gmail.com";


  final String networkImageUrl = "https://api.dicebear.com/7.x/bottts/png?seed=flutter";

  bool useLocalImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: useLocalImage
                      ? const AssetImage('assets/profile.png')
                      : NetworkImage(networkImageUrl),
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      useLocalImage = !useLocalImage;
                    });
                  },
                  child: Text(
                    useLocalImage
                        ? "Switch to Network Image"
                        : "Switch to Local Image",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
