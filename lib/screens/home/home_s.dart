import 'package:add_cart_app/auth/auth_service.dart';
import 'package:add_cart_app/widgets/button.dart';

import 'package:flutter/material.dart';

class HomeS extends StatelessWidget {
  const HomeS({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
               
               
              },
            )
          ],
        ),
      ),
    );
  }

 
}