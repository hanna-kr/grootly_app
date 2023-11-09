import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_sliver_appbar.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';

class TipDetailsPage extends StatelessWidget {
  const TipDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildParagraphs(String text) {
      List<String> paragraphs = text.split(RegExp(r'\. '));

      return Column(
        children: paragraphs.map((paragraph) {
          return Column(
            children: [
              Text(
                '$paragraph.',
                style: GrootlyTextStyle.body2,
              ),
              SpacingH.s,
            ],
          );
        }).toList(),
      );
    }

    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Tips tips = arguments['tips'];
    final String heroTag = arguments['heroTag'];

    return Scaffold(
      backgroundColor: GrootlyColor.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            icon: Icons.chevron_left,
            imageUrl: tips.imgURL,
            heroTag: heroTag,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tips.title,
                        style: GrootlyTextStyle.headlineB3,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        tips.subtitle,
                        style: GrootlyTextStyle.body1,
                      ),
                      const SizedBox(height: 16.0),
                      buildParagraphs(
                        tips.description,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
