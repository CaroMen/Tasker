import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasker/screens/dashboard.dart';
import 'package:tasker/screens/login_screen.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUp(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImgUrl': '',
        });
        // Navigator.pop(context);
        Navigator.pushReplacementNamed(context, DashboardScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  static void logout() {
    _auth.signOut();
    // Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
