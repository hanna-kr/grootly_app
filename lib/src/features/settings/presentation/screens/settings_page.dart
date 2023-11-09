import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
      } else {
        debugPrint(e.toString());
      }
    } catch (e) {
      Utils.showSnackBar(
          'An error has occurred. If you encounter this error multiple times, we kindly suggest attempting the following steps to resolve it: 1. Log out of your account. 2. Log back in to ensure a fresh session. 3. Delete account.');
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData =
          FirebaseAuth.instance.currentUser?.providerData.first;
      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      Utils.showSnackBar(
          'An error has occurred. If you encounter this error multiple times, we kindly suggest attempting the following steps to resolve it: 1. Log out of your account. 2. Log back in to ensure a fresh session. 3. Delete account.');
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        deleteUserAccount();
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
