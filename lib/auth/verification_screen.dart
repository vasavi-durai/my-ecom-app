import 'dart:async';

import 'package:add_cart_app/auth/auth_service.dart';
import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:add_cart_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final User user;
  const VerificationScreen({super.key, required this.user});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _auth = AuthService();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _auth.sendEmailVerificationLink();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await widget.user.reload(); 
      User? user = FirebaseAuth.instance.currentUser;
      if(mounted){
        if (user != null && user.emailVerified == true) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("We have sent an email verification", textAlign: TextAlign.center),
              const SizedBox(height: 20),
              CustomButton(
                label: "Resend Email",
                onPressed: () async {
                  await _auth.sendEmailVerificationLink();
                },
              ),
            ],
          ), 
        ),
      ),
    );
  }
}
