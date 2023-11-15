import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/utils.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    // UI Logic

    // delete function
    void deleteUserAccountAndNavigate(BuildContext context) async {
      try {
        await authService.deleteUserAccount().then((value) =>
            Navigator.of(context).popUntil((route) => route.isFirst));
      } catch (e) {
        Utils.showSnackBar(
            'Error. If you encounter this error multiple times, we kindly suggest the following steps: 1. Log out. 2. Log back in. 3. Delete account.');
      }
    }

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
                                        authService.deleteUserAccount();
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


// Reauthenticate with email password before delete: 

// AuthService authService = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GrootlyColor.white,
//       appBar: CustomAppBar(
//         title: 'Einstellungen',
//         leadingIcon: Icons.chevron_left,
//         onLeadingPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: PaddingAll.l,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Konto löschen',
//                     style: GrootlyTextStyle.body1,
//                   ),
//                   SpacingH.s,
//                   SecondaryButton(
//                       text: 'Konto löschen',
//                       onPressed: () {
//                         final providerData = FirebaseAuth
//                             .instance.currentUser?.providerData.first;
//                         (providerData!.providerId ==
//                                 EmailAuthProvider.PROVIDER_ID)
//                             ? showLoginThenDelete()
//                             : showDelete();
//                       }),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showLoginThenDelete() async {
//     await showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return Consumer<AuthProvider>(builder: (context, provider, child) {
//             return AlertDialog(
//               title: const Text(
//                 'Erneuter Login nötig',
//                 style: GrootlyTextStyle.headlineB5,
//               ),
//               content: const Text(
//                 'Bevor du dein Konto löschst, logge dich bitte noch einmal ein.',
//                 style: GrootlyTextStyle.body2,
//               ),
//               actions: [
//                 TextField(
//                   controller: provider.emailController,
//                   decoration: kTextFieldDecoration.copyWith(
//                     hintText: 'Email',
//                   ),
//                 ),
//                 SpacingH.s,
//                 TextField(
//                   controller: provider.passwordController,
//                   decoration: kTextFieldDecoration.copyWith(
//                     hintText: 'Passwort',
//                   ),
//                 ),
//                 SpacingH.s,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       child: const Text(
//                         'Abbrechen',
//                         style: GrootlyTextStyle.body2,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     TextButton(
//                       child: const Text(
//                         'Login',
//                         style: GrootlyTextStyle.reauthenticate,
//                       ),
//                       onPressed: () {
//                         authService.signIn(provider.emailController.text,
//                             provider.passwordController.text);
//                         provider.clearController();
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           });
//         });
//     showDelete();
//   }

//   showDelete() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             'Konto löschen?',
//             style: GrootlyTextStyle.headlineB5,
//           ),
//           content: const Text(
//             'Wenn du hier klickst, wird dein Konto, als auch deine App-Daten auf unserem Server gelöscht. Dieser Vorgang ist nicht rückgängig.',
//             style: GrootlyTextStyle.body2,
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   child: const Text(
//                     'Abbrechen',
//                     style: GrootlyTextStyle.body2,
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: const Text(
//                     'Delete',
//                     style: GrootlyTextStyle.delete,
//                   ),
//                   onPressed: () {
//                     authService.deleteUserAccount();
//                     Navigator.of(context).popUntil((route) => route.isFirst);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }