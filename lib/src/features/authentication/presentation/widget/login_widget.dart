import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/tertiary_button.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future signUpWithEmail() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmail() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
        ),
        TextFormField(
          controller: _passwordController,
        ),
        PrimaryButton(
            text: 'SignUP',
            onPressed: () {
              signUpWithEmail();
              if (FirebaseAuth.instance.currentUser != null) {
                debugPrint('user registriert');
                //mache Irgendwas
                Navigator.pushNamed(context, '/email_verification');
              }
            }),
        SecondaryButton(
            text: 'Login',
            onPressed: () {
              signInWithEmail();
              if (FirebaseAuth.instance.currentUser != null) {
                debugPrint('user eingeloggt');
                //mache Irgendwas
              }
            }),
        TertiaryButton(
            text: 'Passwort vergessen',
            onPressed: () {
              Navigator.pushNamed(context, '/password_forgotten');
            })
      ],
    );
  }
}
