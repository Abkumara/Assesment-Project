import 'package:assesmnet_project/Model/usermodel.dart';
import 'package:assesmnet_project/View/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, UserModel user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup successful for ${user.email}'),
          duration: const Duration(seconds: 5),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
            duration: Duration(seconds: 5),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The account already exists for ${user.email}.'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      BuildContext context, UserModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign in successful for ${user.email}'),
          duration: const Duration(seconds: 5),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for ${user.email}.'),
            duration: const Duration(seconds: 5),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for ${user.email}.'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }
}
