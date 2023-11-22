import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:shimmer/shimmer.dart';

class RecipeSmallCard extends StatefulWidget {
  final RecipeModel recipe;
  final bool isFavorite;
  final Function(String) onFavoritePressed;

  const RecipeSmallCard({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  State<RecipeSmallCard> createState() => _RecipeSmallCardState();
}

class _RecipeSmallCardState extends State<RecipeSmallCard> {
  void navigateToRecipeDetail() {
    Navigator.pushNamed(context, '/recipe_details', arguments: {
      'recipes': widget.recipe,
      'heroTag2': widget.recipe.imgURL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: GrootlyColor.lightgrey2,
      shape: const RoundedRectangleBorder(
        borderRadius: GrootlyBorderRadius.medium,
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: GrootlyColor.lightgrey2,
        borderRadius: GrootlyBorderRadius.medium,
        child: InkWell(
          borderRadius: GrootlyBorderRadius.medium,
          onTap: () {
            navigateToRecipeDetail();
          },
          child: Container(
            color: GrootlyColor.lightgrey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: GrootlyBorderRadius.imageCard,
                      child: Hero(
                        tag: widget.recipe.imgURL,
                        child: CachedNetworkImage(
                          height: 96,
                          width: double.infinity,
                          imageUrl: widget.recipe.imgURL,
                          fit: BoxFit.cover,
                          // Shimmer
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: GrootlyColor.lightgrey,
                            highlightColor: GrootlyColor.lightgrey2,
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                borderRadius: GrootlyBorderRadius.medium,
                                color: GrootlyColor.lightgrey2,
                              ),
                            ),
                          ),
                          // Error when Imagefailure
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            size: 30,
                            color: GrootlyColor.red,
                          ),
                        ),
                      ),
                    ),
                    // Label top right
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
                            widget.isFavorite
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: GrootlyColor.mediumgreen,
                          ),
                          onPressed: () {
                            widget.onFavoritePressed(widget.recipe.recipeId);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: PaddingAll.s,
                  child: Text(
                    widget.recipe.title,
                    style: GrootlyTextStyle.bodyB2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}