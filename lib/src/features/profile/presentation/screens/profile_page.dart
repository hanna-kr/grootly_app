import 'package:flutter/material.dart';

import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/textfield.dart';
import 'package:grootly_app/src/features/profile/presentation/widgets/custom_image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String avatarImagePath = '';

  void setAvatarImagePath(imagePath) {
    avatarImagePath = imagePath ?? "";
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
        trailingIcon: Icons.settings_outlined,
        onTrailingPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
      body: Padding(
        padding: PaddingAll.l,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImagePicker(setImage: setAvatarImagePath),
                    SpacingH.l,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vorname',
                          style: GrootlyTextStyle.body1,
                        ),
                        SpacingH.s,
                        CustomTextField(
                          labelText: 'Vorname',
                          hintText: 'Ändere hier deinen Vornamen',
                        ),
                        SpacingH.m,
                        Text(
                          'Nachname',
                          style: GrootlyTextStyle.body1,
                        ),
                        SpacingH.s,
                        CustomTextField(
                          labelText: 'Nachname',
                          hintText: 'Ändere hier deinen Nachnamen',
                        ),
                        SpacingH.m,
                        Text(
                          'E-mail',
                          style: GrootlyTextStyle.body1,
                        ),
                        SpacingH.s,
                        CustomTextField(
                          labelText: 'E-mail',
                          hintText: 'Ändere hier deine E-mail',
                        ),
                      ],
                    ),
                    SpacingH.l,
                    PrimaryButton(text: 'speichern', onPressed: () {}),
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
