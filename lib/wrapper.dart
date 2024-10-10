import 'package:add_cart_app/auth/login_screen.dart';
import 'package:add_cart_app/auth/verification_screen.dart';
import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        } else if (snapshot.hasData) {

          User? user = snapshot.data;
          if (user != null && user.emailVerified) {
            return const HomeScreen();
          } else {
            return VerificationScreen(user: user!);
          }
        } else {
          return const LoginScreen(); 
        }
      },
    ),
  );
}
}