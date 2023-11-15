import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/app.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/utils.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // UI Logic

    void resetPasswordAndNavigate(BuildContext context) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: GrootlyLoadingIndicator()),
      );
      try {
        final provider = context.read<AuthProvider>();
        await provider.resetPassword();
        Utils.showSnackBar('Password reset email sent');
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
      } catch (e) {
        Utils.showSnackBar(e.toString());
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return Form(
        key: provider.formKey,
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
                  controller: provider.emailController,
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
                    resetPasswordAndNavigate(context);
                  }),
            ),
          ],
        ),
      );
    });
  }
}
