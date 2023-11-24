import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/features/tips/application/tips_service.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';
import 'package:grootly_app/src/features/tips/presentation/widgets/tips_big_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Tips getCurrentTip(List<Tips> tipsList) {
    int currentDay = DateTime.now().day;
    Random random = Random(currentDay);
    int tipIndex = random.nextInt(tipsList.length);

    return tipsList[tipIndex];
  }

  @override
  Widget build(BuildContext context) {
    TipsService tipsService = TipsService();

    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        trailingIcon: Icons.person,
        onTrailingPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: SingleChildScrollView(
        padding: PaddingAll.m,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hallo, Öko-Foodie!',
              style: GrootlyTextStyle.headlineB2,
            ),
            const Text(
              'Bereit für eine Prise Grün auf deinem Teller?',
              style: GrootlyTextStyle.body2,
            ),
            SpacingH.l,
            FutureBuilder(
              future: tipsService.getAllTipsFuture(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  String error = snapshot.error.toString();
                  debugPrint(error);
                  return const Text(
                    'Da ist etwas schief gelaufen',
                    style: GrootlyTextStyle.body2,
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: GrootlyColor.mediumgreen,
                    ),
                  );
                } else {
                  List<Tips> tipsList = snapshot.data ?? [];
                  Tips currentTip = getCurrentTip(tipsList);
                  return SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView(
                      children: [
                        TipBigCard(
                          hasLabel: true,
                          tips: currentTip,
                          text: 'Tipp des Tages',
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
