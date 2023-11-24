import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:provider/provider.dart';

class ReauthenticationPage extends StatelessWidget {
  const ReauthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: PaddingAll.m,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Column(children: [
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
                SpacingH.m,
                PrimaryButton(
                    text: 'Login',
                    onPressed: () {
                      provider.signInWithEmail();
                    })
              ],
            )
          ]);
        }),
      ),
    ));
  }
}
