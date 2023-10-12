import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/navigation/bottom_nav_page.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/features/profile/application/auth_service.dart';

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

  Future<String?> registerUser() async {
    final message = await AuthService().registration(
      email: _emailController.text,
      password: _passwordController.text,
    );
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      body: Padding(
        padding: PaddingAll.l,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Email',
                            border: OutlineInputBorder()),
                      ),
                      SpacingH.l,
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            labelText: 'Passwort',
                            hintText: 'Passwort',
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    text: 'Jetzt registrieren',
                    onPressed: () async {
                      final message = await registerUser();
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const BottomNavPage()));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SecondaryButton(text: 'Login mit Google', onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
