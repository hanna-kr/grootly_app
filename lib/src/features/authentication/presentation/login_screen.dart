import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child:
                            Image.asset('assets/images/logo/grootlylogo.png')),
                    Column(
                      children: [
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Gib hier deine Emailadresse an',
                        ),
                        SpacingH.l,
                        CustomTextField(
                          labelText: 'Password',
                          hintText: 'Gib hier dein Passwort an',
                        ),
                      ],
                    ),
                    PrimaryButton(text: 'Login', onPressed: () {}),
                    Divider(),
                    SecondaryButton(text: 'Login mit Google', onPressed: () {})
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
