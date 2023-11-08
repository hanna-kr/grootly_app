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
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({super.key, required this.onClickedSignUp});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: GrootlyLoadingIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Utils.showSnackBar('Incorrect password');
      } else {
        debugPrint(e.toString());
        Utils.showSnackBar(e.message);
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingAll.l,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                  controller: _emailController,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                ),
                SpacingH.l,
                const Text(
                  'Passwort',
                  style: GrootlyTextStyle.body1,
                ),
                SpacingH.s,
                TextField(
                  controller: _passwordController,
                  obscureText: !passwordVisible,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Passwort',
                    hintText: 'Passwort',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
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
                  onPressed: () async {
                    signIn();
                  },
                ),
                SpacingH.m,
                RichText(
                    text: TextSpan(
                        style: GrootlyTextStyle.body2,
                        text: 'Noch nicht registriert?',
                        children: [
                      const WidgetSpan(child: SpacingW.s),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
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
                      AuthService().signInWithGoogle();
                    },
                    imagePath: 'assets/images/example/googlelogo.png'),
                SpacingW.l,
                SquareSecondaryButton(
                    onPressed: () {},
                    imagePath: 'assets/images/example/apple-logo.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
