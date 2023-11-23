import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeSearchCard extends StatefulWidget {
  final RecipeModel recipe;
  final bool isFavorite;
  final Function(String) onFavoritePressed;

  const RecipeSearchCard({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  State<RecipeSearchCard> createState() => _RecipeSearchCardState();
}

class _RecipeSearchCardState extends State<RecipeSearchCard> {
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
      child: InkWell(
        onTap: navigateToRecipeDetail,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: GrootlyBorderRadius.recipeSearch,
                    child: Hero(
                      tag: widget.recipe.imgURL,
                      child: CachedNetworkImage(
                        width: 80,
                        height: 80,
                        imageUrl: widget.recipe.imgURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: PaddingAll.s,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipe.title,
                          style: GrootlyTextStyle.bodyB2,
                        ),
                        Text(
                          widget.recipe.duration,
                          style: GrootlyTextStyle.body2,
                        ),
                        Text(
                          widget.recipe.subCategory,
                          style: GrootlyTextStyle.body3,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
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
      ),
    );
  }
}
