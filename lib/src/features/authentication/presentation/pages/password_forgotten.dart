import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';

class PasswordForgottenPage extends StatefulWidget {
  const PasswordForgottenPage({super.key});

  @override
  State<PasswordForgottenPage> createState() => _PasswordForgottenPageState();
}

class _PasswordForgottenPageState extends State<PasswordForgottenPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: GrootlyLoadingIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      Utils.showSnackBar('Passwort Reset Email versendet');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: PaddingAll.l,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Passwort vergessen',
                    style: GrootlyTextStyle.headlineB2,
                  ),
                  SpacingH.m,
                  const Text(
                    'Gib bitte deine E-Mail-Adresse ein, um das Passwort zurückzusetzen.',
                    style: GrootlyTextStyle.body2,
                  ),
                  SpacingH.l,
                  const Text(
                    'Email',
                    style: GrootlyTextStyle.body2,
                  ),
                  SpacingH.s,
                  TextFormField(
                    controller: _emailController,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Email',
                      hintText: 'Email',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Geben Sie eine gültige E-Mail ein'
                            : null,
                  ),
                ],
              ),
              SpacingH.m,
              Padding(
                padding: PaddingVer.s,
                child: PrimaryButton(
                    text: 'Passwort zurücksetzen',
                    onPressed: () {
                      resetPassword();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
