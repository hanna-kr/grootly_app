import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';

class TipDetailsPage extends StatelessWidget {
  const TipDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Tips tips = ModalRoute.of(context)!.settings.arguments as Tips;
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
          title: 'Tipp Details',
          leadingIcon: Icons.chevron_left,
          onLeadingPressed: () => Navigator.pop(context)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: PaddingAll.l,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: GrootlyTextStyle.headlineB3,
              ),
              SpacingH.s,
              Text(
                tips.subtitle,
                style: GrootlyTextStyle.body1,
              ),
              SpacingH.m,
              Text(
                tips.description,
                style: GrootlyTextStyle.body2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
