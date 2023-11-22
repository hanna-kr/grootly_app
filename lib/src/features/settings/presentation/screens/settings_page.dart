import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/utils.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  // UI Logic

  // delete function
  void deleteUserAccountAndNavigate(BuildContext context) async {
    try {
      AuthService authService = AuthService();
      await authService.deleteUserAccount().then(
          (value) => Navigator.of(context).popUntil((route) => route.isFirst));
    } on FirebaseAuthException {
      // ignore: use_build_context_synchronously
      showReauthentication(context);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        title: 'Einstellungen',
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: PaddingAll.l,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Konto löschen',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  SecondaryButton(
                      text: 'Konto löschen',
                      onPressed: () {
                        showDeleteConfirmationDialog(context);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Konto löschen?',
            style: GrootlyTextStyle.headlineB5,
          ),
          content: const Text(
            'Wenn du hier klickst, wird dein Konto, als auch deine App-Daten auf unserem Server gelöscht. Dieser Vorgang ist nicht rückgängig.',
            style: GrootlyTextStyle.body2,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    'Abbrechen',
                    style: GrootlyTextStyle.body2,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Delete',
                    style: GrootlyTextStyle.delete,
                  ),
                  onPressed: () {
                    deleteUserAccountAndNavigate(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void showReauthentication(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Consumer<AuthProvider>(builder: (context, provider, child) {
          return Center(
            child: SizedBox(
              height: 420,
              child: SingleChildScrollView(
                child: AlertDialog(
                  title: const Text(
                    'Erneuter Login nötig',
                    style: GrootlyTextStyle.headlineB5,
                  ),
                  content: Form(
                    key: provider.formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Bevor du dein Konto löschst, logge dich bitte noch einmal ein.',
                          style: GrootlyTextStyle.body2,
                        ),
                        SpacingH.m,
                        TextFormField(
                            controller: provider.emailController,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Bitte gebe deine Email an';
                              }
                              return null;
                            }),
                        SpacingH.m,
                        TextFormField(
                          controller: provider.passwordController,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Passwort',
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Bitte gebe dein Passwort an';
                            }
                            return null;
                          },
                        ),
                        if (provider.errormessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(provider.errormessage,
                                style: GrootlyTextStyle.errorMessage),
                          )
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            'Abbrechen',
                            style: GrootlyTextStyle.body2,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: GrootlyTextStyle.reauthenticate,
                          ),
                          onPressed: () {
                            if (provider.formKey.currentState!.validate()) {
                              provider.signInWithEmail().then((value) {
                                Navigator.pop(context);
                              }).catchError((error) {
                                if (error is FirebaseAuthException) {
                                  String errorMessage =
                                      error.message.toString();
                                  if (errorMessage.length > 80) {
                                    provider.setErrorMessage(
                                        'Oops, there was an error. Please try again.');
                                  } else {
                                    provider.setErrorMessage(errorMessage);
                                  }
                                } else {
                                  provider.setErrorMessage(
                                      'Error. Please try again.');
                                }
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
