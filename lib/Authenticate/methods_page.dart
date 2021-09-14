import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo_project/Authenticate/loginScreen_page.dart';
import 'package:flutter_demo_project/pages/home_page.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Login Successful");
      return user;
    } else {
      print("Account creation faild");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> LogIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print('Login Successful');
      return user;
    } else {
      print('Login Failed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future LogOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (_) => LoginScreen())));
  } catch (e) {
    print('Error');
  }
}
