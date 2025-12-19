import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String? username;
  final String? email;
  final String? password;
  const ProfileScreen({super.key, this.username, this.email, this.password});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.username!), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage(
              //   'assets/profile_picture.png',
              // ), // Replace with your asset path
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.email ?? 'test email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
