import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';
import 'package:grootly_app/src/features/home/presentation/home_page.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final email = FirebaseAuth.instance.currentUser!.email;

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : SafeArea(
          child: Scaffold(
            backgroundColor: GrootlyColor.white,
            body: Padding(
                padding: PaddingAll.l,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Verify Email',
                            style: GrootlyTextStyle.headlineB2,
                          ),
                          SpacingH.l,
                          const FaIcon(
                            Icons.email,
                            size: 100,
                            color: GrootlyColor.mediumgreen2,
                          ),
                          SpacingH.l,
                          Text(
                            'Es wurde ein Verifizierunglink an $email gesendet.',
                            style: GrootlyTextStyle.body2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PrimaryButton(
                              text: 'Nochmal senden',
                              onPressed: () {
                                if (canResendEmail) {
                                  sendVerificationEmail();
                                }
                              }),
                          SpacingH.m,
                          SecondaryButton(
                              text: 'Abbrechen',
                              onPressed: () => AuthService().logout()),
                        ],
                      )
                    ])),
          ),
        );
}
