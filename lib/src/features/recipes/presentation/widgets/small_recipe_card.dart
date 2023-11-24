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
    Key? key,
    required this.recipe,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

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
    final heroTag = UniqueKey().toString();

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
          onTap: navigateToRecipeDetail,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: GrootlyBorderRadius.imageCard,
                      child: Hero(
                        tag: heroTag,
                        child: CachedNetworkImage(
                          width: double.infinity,
                          imageUrl: widget.recipe.imgURL,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: GrootlyColor.lightgrey,
                            highlightColor: GrootlyColor.lightgrey2,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: GrootlyBorderRadius.medium,
                                color: GrootlyColor.lightgrey2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            size: 30,
                            color: GrootlyColor.red,
                          ),
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
              Expanded(
                flex: 2,
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
                        style: GrootlyTextStyle.body3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
