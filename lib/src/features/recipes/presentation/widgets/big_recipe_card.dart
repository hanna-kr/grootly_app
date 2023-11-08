import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:shimmer/shimmer.dart';

class RecipeBigCard extends StatelessWidget {
  final RecipeModel recipe;
  final bool isFavorite;
  final bool hasLabel;
  final Function(String) onFavoritePressed;
  final String text;

  const RecipeBigCard(
      {super.key,
      required this.recipe,
      required this.isFavorite,
      required this.onFavoritePressed,
      required this.hasLabel,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: GrootlyColor.lightgrey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: recipe.imgURL,
                  fit: BoxFit.cover,
                  height: 180.0,
                  width: double.infinity,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: GrootlyColor.lightgrey,
                    highlightColor: GrootlyColor.lightgrey2,
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      color: GrootlyColor.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 30,
                    color: GrootlyColor.red,
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: GrootlyBorderRadius.medium,
                    color: GrootlyColor.white,
                  ),
                  child: IconButton(
                    iconSize: 20,
                    icon: FaIcon(
                      isFavorite
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      color: GrootlyColor.mediumgreen,
                    ),
                    onPressed: () {
                      onFavoritePressed(recipe.recipeId);
                    },
                  ),
                ),
              ),
              if (hasLabel)
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: GrootlyBorderRadius.medium,
                          color: GrootlyColor.limegreen),
                      child: Center(
                          child: Padding(
                        padding: PaddingAll.s,
                        child: Text(
                          text,
                          style: GrootlyTextStyle.label,
                        ),
                      )),
                    ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.title, style: GrootlyTextStyle.headlineB4),
                const SizedBox(height: 5.0),
                Text(recipe.duration, style: GrootlyTextStyle.body2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
