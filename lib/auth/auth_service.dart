import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  
  Future<void> sendEmailVerificationLink()async{
     try{
             await _auth.currentUser?.sendEmailVerification();
             log("Verification email sent");
     }
     catch(e){
  
            log("Error Sending Verification Email : $e"); 
     }
  }
  signinwithGoogle()async{ 
    try{
     GoogleSignInAccount? googleUser =   await  GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken ,
        accessToken: googleAuth?.accessToken,
        );

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(cred);
      if (kDebugMode) {
        print(userCredential.user?.displayName);
      }
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) 
      async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  } 
}  