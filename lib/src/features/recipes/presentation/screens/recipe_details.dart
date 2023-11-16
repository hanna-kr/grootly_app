import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_sliver_appbar.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final RecipeModel recipes = arguments['recipes'];
    final String heroTag = arguments['heroTag2'];

    return Scaffold(
      backgroundColor: GrootlyColor.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            icon: Icons.chevron_left,
            imageUrl: recipes.imgURL,
            heroTag: heroTag,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: PaddingAll.l,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipes.title,
                        style: GrootlyTextStyle.headlineB3,
                      ),
                      SpacingH.m,
                      Text(
                        'Portionen:  ${recipes.servings}',
                        style: GrootlyTextStyle.body2,
                      ),
                      SpacingH.l,
                      const Text(
                        'Zutaten',
                        style: GrootlyTextStyle.headlineB5,
                      ),
                      ListView.builder(
                        padding: PaddingVer.s,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recipes.ingredients.length,
                        itemBuilder: (context, index) {
                          final ingredient =
                              recipes.ingredients.keys.toList()[index];
                          final quantity =
                              recipes.ingredients.values.toList()[index];
                          return Table(
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: PaddingVer.s,
                                    child: Text(
                                      ingredient,
                                      style: GrootlyTextStyle.body2,
                                    ),
                                  ),
                                  Padding(
                                    padding: PaddingVer.s,
                                    child: Text(
                                      quantity,
                                      style: GrootlyTextStyle.body2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      SpacingH.m,
                      const Text(
                        'Utensilien',
                        style: GrootlyTextStyle.headlineB5,
                      ),
                      SpacingH.m,
                      // recipes.utensils,
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
