import 'package:add_cart_app/auth/login_screen.dart';
import 'package:add_cart_app/auth/signup_screen.dart';
import 'package:add_cart_app/screens/Cart/cart_provider.dart';
import 'package:add_cart_app/screens/home/nav_bar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() 

async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) 
  {
  await Firebase.initializeApp(options: const FirebaseOptions(
  apiKey: "AIzaSyCbf-nB_SRUxSTNCYKiKQn7TxEHfEyO8a4",
  authDomain: "fire-log-23c1c.firebaseapp.com",
  projectId: "fire-log-23c1c",
  storageBucket: "fire-log-23c1c.appspot.com",
  messagingSenderId: "93779428981",
  appId: "1:93779428981:web:34b9904908fb3a0b83da3c"));
  }
  
  else
  {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
             ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),         
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.pink,
      ),
      
     home: const BottomNavBar(),
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
      }
      );
  }
}



