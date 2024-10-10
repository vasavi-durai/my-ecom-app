import 'dart:developer';
import 'package:add_cart_app/auth/auth_service.dart';
import 'package:add_cart_app/auth/signup_screen.dart';
import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:add_cart_app/widgets/button.dart';
import 'package:add_cart_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false; 

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
             
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
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
        const SizedBox(
              height: 30),
            CustomButton(
              label: _isLoading ? "Loading..." : "Login",
              onPressed: _isLoading ? null : _login, 
            ),
            const SizedBox(height: 20),
        CustomButton(
              label: "Signin With Google",
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await _auth.signinwithGoogle();
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                        // ignore: use_build_context_synchronously
                        goToHome(context); 
                      }
                    },
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToSignup(context),
                child: const Text(
                  "Signup",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    FocusScope.of(context).unfocus(); 
    setState(() {
      _isLoading = true; 
    });

    try {
      final user = await _auth.loginUserWithEmailAndPassword(
        _email.text,
        _password.text,
      );

      if (mounted) {
        if (user != null) {
          log("User Logged In");
          goToHome(context); 
        } else {
          _showError("Login failed. Invalid credentials.");
        }
      }
    } catch (e) {
      log("Login error: $e");
      _showError("An error occurred during login.");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; 
        });
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
