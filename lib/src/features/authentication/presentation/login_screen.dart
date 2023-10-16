import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/navigation/bottom_nav_page.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;
  String email = '';
  String password = '';

  Future<void> login() async {
    String? message = await AuthService().login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (message != null && message.contains('Success')) {
      navigateToBottomNavPage();
    }

    showSnackBar(message ?? 'An error occurred.');
  }

  void navigateToBottomNavPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomNavPage(),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    child: Image.asset('assets/images/logo/grootlylogo.png'),
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
                                Navigator.pushNamed(context, '/login');
                              }),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PrimaryButton(
                        text: 'Login',
                        onPressed: () async {
                          login();
                        },
                      ),
                      SpacingH.s,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Noch nicht registriert?',
                            style: GrootlyTextStyle.body2,
                          ),
                          TertiaryButton(
                              text: 'SignUp',
                              onPressed: () {
                                Navigator.pushNamed(context, '/sign_up');
                              })
                        ],
                      ),
                    ],
                  ),
                  const HorizontalOrLine(
                    label: 'oder',
                    height: 10,
                    thickness: 2,
                  ),
                  SecondaryButton(
                    image: Image.asset('assets/images/example/googlelogo.png'),
                    text: 'Login mit Google',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
