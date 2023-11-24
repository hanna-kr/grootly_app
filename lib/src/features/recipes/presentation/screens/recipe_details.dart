import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_sliver_appbar.dart';
import 'package:grootly_app/src/core/presentation/widgets/horizontal__divider.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/recipe_details_listviews.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  late RecipeModel recipes;
  int servingCount = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    recipes = arguments['recipes'];
    servingCount = recipes.servings;
  }

  Widget buildDifficultyIcon(String difficulty) {
    IconData iconData = Icons.circle;
    Color iconColor = Colors.transparent;

    if (difficulty == 'leicht') {
      iconData = Icons.circle;
      iconColor = GrootlyColor.limegreen2;
    } else if (difficulty == 'mittel') {
      iconData = Icons.circle;
      iconColor = GrootlyColor.yellow2;
    } else if (difficulty == 'schwer') {
      iconData = Icons.circle;
      iconColor = GrootlyColor.red;
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 20,
    );
  }

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
                  padding: PaddingAll.m,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipes.title,
                        style: GrootlyTextStyle.headlineB3,
                      ),
                      const HorizontalOrLine(height: 10, thickness: 2),
                      Row(
                        children: [
                          const Text(
                            'Schwierigkeitsgrad:',
                            style: GrootlyTextStyle.headlineB5,
                          ),
                          SpacingW.s,
                          Text(
                            recipes.difficulty,
                            style: GrootlyTextStyle.body2,
                          ),
                          SpacingW.s,
                          buildDifficultyIcon(recipes.difficulty),
                        ],
                      ),
                      const HorizontalOrLine(height: 10, thickness: 2),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            color: GrootlyColor.mediumgrey,
                            onPressed: () {
                              setState(() {
                                if (servingCount > 1) {
                                  servingCount--;
                                }
                              });
                            },
                          ),
                          Text(
                            'Portionen:  $servingCount',
                            style: GrootlyTextStyle.body2,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            color: GrootlyColor.mediumgrey,
                            onPressed: () {
                              setState(() {
                                servingCount++;
                              });
                            },
                          ),
                        ],
                      ),
                      SpacingH.m,
                      const Text(
                        'Zutaten',
                        style: GrootlyTextStyle.headlineB5,
                      ),
                      IngredientsList(
                        recipes: recipes,
                        servingCount: servingCount,
                        orginalCount: recipes.servings,
                      ),
                      const HorizontalOrLine(height: 10, thickness: 2),
                      const Text(
                        'Utensilien',
                        style: GrootlyTextStyle.headlineB5,
                      ),
                      UtensilsList(recipes: recipes),
                      const HorizontalOrLine(height: 10, thickness: 2),
                      const Text(
                        'Zubereitung',
                        style: GrootlyTextStyle.headlineB5,
                      ),
                      DescriptionList(recipes: recipes),
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
