import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

// Ingredients

class IngredientsList extends StatelessWidget {
  final RecipeModel recipes;
  final int servingCount;
  final int orginalCount;

  const IngredientsList(
      {super.key,
      required this.recipes,
      required this.servingCount,
      required this.orginalCount});

  @override
  Widget build(BuildContext context) {
    RegExpMatch extractNumberAndString(String input) {
      input = input.replaceAll(',', '.');
      var matches = RegExp(r'(\d*\.?\d+)( [a-zA-Z]+)').allMatches(input);

      return matches.first;
    }

    return ListView.separated(
      padding: PaddingVer.s,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.ingredients.length,
      separatorBuilder: (context, index) => SpacingH.s,
      itemBuilder: (context, index) {
        final ingredientEntry = recipes.ingredients.entries.toList()[index];
        final ingredient = ingredientEntry.key;
        final quantity = ingredientEntry.value;
        final numberandStringObject = extractNumberAndString(quantity);
        final double parsedQuantity =
            double.parse(numberandStringObject.group(1)!);

        final String parsedUnit = numberandStringObject.group(2)!;
        final double calculatedQuantity =
            servingCount / (orginalCount) * parsedQuantity;

        final String formattetQuantity = calculatedQuantity.toStringAsFixed(2);
        final String displayedQuantity = formattetQuantity.endsWith('.00')
            ? formattetQuantity.substring(0, formattetQuantity.length - 3)
            : formattetQuantity;
        return Table(columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(4),
        }, children: [
          TableRow(
            children: [
              Text(
                "$displayedQuantity $parsedUnit",
                style: GrootlyTextStyle.body2,
              ),
              Text(
                ingredient,
                style: GrootlyTextStyle.body2,
              ),
            ],
          ),
        ]);
      },
    );
  }
}

// Utensils

class UtensilsList extends StatelessWidget {
  final RecipeModel recipes;

  const UtensilsList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: PaddingVer.s,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.utensils.length,
      separatorBuilder: (context, index) => SpacingH.s,
      itemBuilder: (context, index) {
        final utensil = recipes.utensils[index];
        return Text(
          utensil,
          style: GrootlyTextStyle.body2,
        );
      },
    );
  }
}

// Zubereitung

class DescriptionList extends StatelessWidget {
  final RecipeModel recipes;

  const DescriptionList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: PaddingVer.s,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recipes.description.length,
        separatorBuilder: (context, index) => SpacingH.s,
        itemBuilder: (context, index) {
          final description = recipes.description[index];
          final stepNumber = index + 1;
          final stepLabel = 'Schritt $stepNumber:';
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stepLabel,
                style: GrootlyTextStyle.bodyB2l,
              ),
              SpacingH.s,
              Text(
                description,
                style: GrootlyTextStyle.body2,
              )
            ],
          );
        });
  }
}
