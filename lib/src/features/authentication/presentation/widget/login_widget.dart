import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/app.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/horizontal__divider.dart';
import 'package:grootly_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/square_secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/tertiary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/utils.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({super.key, required this.onClickedSignUp});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    // UI Logic

    // Email Login

    void signInAndNavigate(BuildContext context) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: GrootlyLoadingIndicator()),
      );
      try {
        final provider = context.read<AuthProvider>();
        await provider.signInWithEmail();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          Utils.showSnackBar('Incorrect email and/or password');
        } else {
          debugPrint(e.toString());
          Utils.showSnackBar(e.message);
        }
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    // Gmail Login

    void signInWithGoogleAndHandleErrors() async {
      try {
        await AuthService().signInWithGoogle();
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
      }
    }

    return Padding(
      padding: PaddingAll.l,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<AuthProvider>(builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/logo/grootly_logo2.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  TextField(
                    controller: provider.emailController,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email',
                    ),
                  ),
                  SpacingH.m,
                  const Text(
                    'Passwort',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  TextField(
                    controller: provider.passwordController,
                    obscureText: !provider.passwordVisible,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Passwort',
                      suffixIcon: IconButton(
                        icon: Icon(provider.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          provider.isVisible();
                        },
                      ),
                      alignLabelWithHint: false,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TertiaryButton(
                          text: 'Passwort vergessen?',
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot_password');
                          }),
                    ],
                  ),
                ],
              ),
              SpacingH.l,
              Column(
                children: [
                  PrimaryButton(
                      text: 'Login',
                      onPressed: () {
                        signInAndNavigate(context);
                      }),
                  SpacingH.m,
                  RichText(
                      text: TextSpan(
                          style: GrootlyTextStyle.body2,
                          text: 'Noch nicht registriert?',
                          children: [
                        const WidgetSpan(child: SpacingW.s),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = onClickedSignUp,
                            text: 'Sign Up',
                            style: GrootlyTextStyle.underline)
                      ])),
                ],
              ),
              SpacingH.l,
              const HorizontalOrLine(
                label: 'oder',
                height: 10,
                thickness: 2,
              ),
              SpacingH.l,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareSecondaryButton(
                      onPressed: () {
                        signInWithGoogleAndHandleErrors();
                      },
                      imagePath: 'assets/images/example/googlelogo.png'),
                  SpacingW.l,
                  SquareSecondaryButton(
                      onPressed: () {
                        authService.signInWithApple();
                      },
                      imagePath: 'assets/images/example/apple-logo.png'),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
