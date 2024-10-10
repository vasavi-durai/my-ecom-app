
import 'package:add_cart_app/auth/login_screen.dart';
import 'package:add_cart_app/screens/Cart/cart_screen.dart';
import 'package:add_cart_app/screens/home/favorite.dart';
import 'package:add_cart_app/screens/home/home_screen.dart';
import 'package:add_cart_app/screens/home/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:add_cart_app/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:add_cart_app/screens/Cart/cart_provider.dart'; 
import 'package:badges/badges.dart' as badges;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2; 
  List screens = const [
    Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: tdPink,
        child: const Icon(
          Icons.home,
          color: Color.fromARGB(255, 252, 249, 249),
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? tdPink : const Color.fromARGB(255, 92, 90, 90),
              ),
            ),
          
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: currentIndex == 1 ? tdPink : const Color.fromARGB(255, 92, 90, 90),
              ),
            ),
            const SizedBox(width: 15),
          
            Consumer<CartProvider>(builder: (context, cartProvider, child) {
              return badges.Badge(
                badgeContent: Text(
                  "${cartProvider.cartItemCount}", 
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: currentIndex == 3 ? tdPink : const Color.fromARGB(255, 92, 90, 90),
                  ),
                ),
              );
            }),
            IconButton(
              onPressed: () {
                  _navigateToProfileOrLogin(context); 
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 4 ? tdPink : const Color.fromARGB(255, 92, 90, 90),
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
   void _navigateToProfileOrLogin(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser; 

    if (user != null) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
