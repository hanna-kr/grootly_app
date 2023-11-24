import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/tips/application/tips_service.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';
import 'package:grootly_app/src/features/tips/presentation/widgets/tips_big_card.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TipsService tipsService = TipsService();

    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: const CustomAppBar(
        title: 'Tipps',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: PaddingAll.m,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entdecke unsere Tipps für nachhaltiges Essen und einen umweltfreundlichen Alltag!',
              style: GrootlyTextStyle.body1,
              textAlign: TextAlign.center,
            ),
            SpacingH.m,
            StreamBuilder(
                stream: tipsService.getAllTipsStream(),
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
                    return const CircularProgressIndicator(
                      color: GrootlyColor.mediumgreen,
                    );
                  } else {
                    List<Tips> tipsList = snapshot.data ?? [];
                    return SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: tipsList
                            .map((tip) => Padding(
                                  padding: PaddingBottom.s,
                                  child: TipBigCard(
                                    tips: tip,
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
