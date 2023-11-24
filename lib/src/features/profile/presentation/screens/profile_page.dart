import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User user = FirebaseAuth.instance.currentUser!;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = user.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        title: 'Profil',
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        trailingIcon: Icons.settings,
        onTrailingPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
      body: Padding(
        padding: PaddingAll.m,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Username',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  TextField(
                    controller: _nameController,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Username',
                      hintText: 'Ändere hier deinen Namen',
                    ),
                  ),
                  SpacingH.m,
                  const Text(
                    'E-mail',
                    style: GrootlyTextStyle.body1,
                  ),
                  SpacingH.s,
                  Text(
                    user.email ?? '',
                    style: GrootlyTextStyle.body2,
                  )
                ],
              ),
              SpacingH.l,
              Column(
                children: [
                  PrimaryButton(text: 'speichern', onPressed: () {}),
                  SpacingH.m,
                  SecondaryButton(
                      icon: Icons.logout,
                      text: 'Logout',
                      onPressed: () {
                        AuthService().logout();
                        Navigator.popUntil(context, (route) => route.isFirst);
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
