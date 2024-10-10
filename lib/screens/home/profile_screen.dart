import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Text(
              user?.displayName ?? "No Name",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? "No Email",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {

                 await GoogleSignIn().signOut();
                 FirebaseAuth.instance.signOut();
                
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
