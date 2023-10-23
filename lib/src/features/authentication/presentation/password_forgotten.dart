import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';

class PasswordForgottenPage extends StatefulWidget {
  const PasswordForgottenPage({super.key});

  @override
  State<PasswordForgottenPage> createState() => _PasswordForgottenPageState();
}

class _PasswordForgottenPageState extends State<PasswordForgottenPage> {
  TextEditingController _emailController = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Passwort vergessen',
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Text('Gebe deine Email ein um das Passwort zurückzusetzen'),
          TextFormField(
            controller: _emailController,
          ),
          PrimaryButton(
              text: 'Passwort zurücksetzen',
              onPressed: () {
                resetPassword();
              })
        ],
      ),
    );
  }
}
