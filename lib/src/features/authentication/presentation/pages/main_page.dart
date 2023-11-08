import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_page.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/verify_email.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GrootlyColor.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: GrootlyLoadingIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text(
                  'Da ist etwas schief gelaufen!',
                  style: GrootlyTextStyle.body2,
                ));
              } else if (snapshot.hasData) {
                return const VerifyEmailPage();
              } else {
                return const AuthPage();
              }
            }));
  }
}
