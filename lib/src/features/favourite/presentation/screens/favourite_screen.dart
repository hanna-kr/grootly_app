import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/small_recipe_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final RecipeService recipeService = RecipeService();
  List<RecipeModel> recipes = [];
  List<String> userFavorites = [];

  void _fetchUserFavorites() async {
    try {
      userFavorites = await recipeService.fetchUserFavorites();
      setState(() {});
    } catch (e) {
      debugPrint('Error fetching favorites: $e');
    }
  }

  void _handleFavoritesListChanged(String recipeId) async {
    try {
      if (userFavorites.contains(recipeId)) {
        await recipeService.removeFromFavorites(recipeId);
        userFavorites.remove(recipeId);
      } else {
        await recipeService.addToFavorites(recipeId);
        userFavorites.add(recipeId);
      }
      debugPrint('Updated Favorites: $userFavorites');
      setState(() {});
    } catch (e) {
      debugPrint('Error updating favorites: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: const CustomAppBar(
        title: 'Favoriten',
      ),
      body: Padding(
        padding: PaddingAll.m,
        child: StreamBuilder<List<RecipeModel>>(
          stream: recipeService.getFavoritesStream(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RecipeModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: GrootlyColor.primary,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                'Du hast noch keine Favoriten ausgewählt.',
                style: GrootlyTextStyle.body2,
              ));
            } else {
              var recipes = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  RecipeModel recipe = recipes[index];
                  return RecipeSmallCard(
                    recipe: recipe,
                    isFavorite: userFavorites.contains(recipe.recipeId),
                    onFavoritePressed: _handleFavoritesListChanged,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
