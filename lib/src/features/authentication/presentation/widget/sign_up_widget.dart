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
import 'package:grootly_app/src/core/presentation/widgets/utils.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  final VoidCallback onClickedSignIn;
  const SignUpWidget({super.key, required this.onClickedSignIn});

  @override
  Widget build(BuildContext context) {
    // UI Logic

    // Email Login
    void signUpAndNavigate(BuildContext context) async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: GrootlyLoadingIndicator()));
      try {
        final provider = context.read<AuthProvider>();
        await provider.signUp();
      } on FirebaseAuthException catch (e) {
        debugPrint(e.toString());
        Utils.showSnackBar(e.message);
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
              Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'Username',
                    //   style: GrootlyTextStyle.body1,
                    // ),
                    // SpacingH.s,
                    // TextFormField(
                    //   controller: provider.nameController,
                    //   decoration: kTextFieldDecoration.copyWith(
                    //     hintText: 'Name',
                    //   ),
                    // ),
                    // SpacingH.m,
                    const Text(
                      'Email',
                      style: GrootlyTextStyle.body1,
                    ),
                    SpacingH.s,
                    TextFormField(
                      controller: provider.emailController,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Geben Sie eine gültige E-Mail ein'
                              : null,
                    ),
                    SpacingH.m,
                    const Text(
                      'Passwort',
                      style: GrootlyTextStyle.body1,
                    ),
                    SpacingH.s,
                    TextFormField(
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Das Passwort muss 6 Zeichen beinhalten'
                          : null,
                    ),
                    SpacingH.l,
                    Column(
                      children: [
                        PrimaryButton(
                            text: 'Sign Up',
                            onPressed: () {
                              signUpAndNavigate(context);
                            }),
                        SpacingH.m,
                        RichText(
                            text: TextSpan(
                                style: GrootlyTextStyle.body2,
                                text: 'Schon registriert?',
                                children: [
                              const WidgetSpan(child: SpacingW.s),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = onClickedSignIn,
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
                              signInWithGoogleAndHandleErrors();
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
            ],
          );
        }),
      ),
    );
  }
}
