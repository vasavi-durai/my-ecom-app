
import 'dart:developer';

import 'package:add_cart_app/auth/auth_service.dart';
import 'package:add_cart_app/auth/login_screen.dart';
import 'package:add_cart_app/auth/verification_screen.dart';
import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:add_cart_app/widgets/button.dart';
import 'package:add_cart_app/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Signup",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: "Enter Name",
              label: "Name",
              controller: _name, 
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email, 
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Signup",
              onPressed: _signup,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToLogin(context),
                child: const Text("Login", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

 _signup() async {
  try {
    User? user = await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
  if (user != null) {
    if(mounted){
        Navigator.push(
      
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen(user: user)),
    );
    }
  
  }
  } catch (e) {
    log("signup error, $e");
  }
  
    
}
}
