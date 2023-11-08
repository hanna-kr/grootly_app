import 'package:email_validator/email_validator.dart';
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
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUpWidget({super.key, required this.onClickedSignIn});

  @override
  State<SignUpWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool passwordVisible = false;

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: GrootlyLoadingIndicator()));

    try {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } else {
        Utils.showSnackBar("Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: GrootlyTextStyle.body1,
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
                  SpacingH.l,
                  const Text(
                    'Passwort',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  TextFormField(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Das Passwort muss 6 Zeichen beinhalten'
                        : null,
                  ),
                  SpacingH.m,
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !passwordVisible,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Passwort bestätigen',
                      hintText: 'Passwort bestätigen',
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Das Passwort muss 6 Zeichen beinhalten'
                        : null,
                  ),
                ],
              ),
            ),
            SpacingH.l,
            Column(
              children: [
                PrimaryButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    signUp();
                  },
                ),
                SpacingH.m,
                RichText(
                    text: TextSpan(
                        style: GrootlyTextStyle.body2,
                        text: 'Schon registriert?',
                        children: [
                      const WidgetSpan(child: SpacingW.s),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Log In',
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
