import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/horizontal__divider.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/tertiary_button.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';
  bool passwordVisible = false;

  Future<void> registerUser() async {
    final message = await AuthService().registration(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (message != null && message.contains('Success')) {
      navigateToBottomNavPage();
    }

    showSnackBar(message ?? 'An error occurred.');
  }

  void navigateToBottomNavPage() {
    Navigator.pushReplacementNamed(context, '/bottom_nav_page');
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      body: Padding(
        padding: PaddingAll.l,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/images/logo/grootlylogo.png')),
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
                    ],
                  ),
                  Column(
                    children: [
                      SpacingH.m,
                      PrimaryButton(
                        text: 'Jetzt registrieren',
                        onPressed: () async {
                          registerUser();
                        },
                      ),
                      SpacingH.s,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Bist du schon registriert?',
                            style: GrootlyTextStyle.body2,
                          ),
                          TertiaryButton(
                              text: 'Login',
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              }),
                        ],
                      ),
                    ],
                  ),
                  SpacingH.s,
                  const HorizontalOrLine(
                    label: 'oder',
                    height: 10,
                    thickness: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SecondaryButton(
                          image: Image.asset(
                              'assets/images/example/googlelogo.png'),
                          text: 'Login with Google',
                          onPressed: () {}),
                      SpacingH.s,
                      const Text(
                          'Wenn Sie fortfahren, stimmen Sie unseren Nutzungsbedingungen und Datenschutzrichtlinien zu.'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
