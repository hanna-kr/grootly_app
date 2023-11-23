import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/small_recipe_card.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
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
      appBar: CustomAppBar(
        leadingIcon: Icons.add,
        onLeadingPressed: () {
          Navigator.pushNamed(context, '/recipe_creator');
        },
        title: 'Rezepte',
      ),
      body: Padding(
        padding: PaddingAll.l,
        child: StreamBuilder<List<RecipeModel>>(
          stream: recipeService.getAllRecipesStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: GrootlyColor.mediumgreen,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              recipes = snapshot.data ?? [];
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
            } else {
              return const Center(
                child: Text('No recipes found'),
              );
            }
          },
        ),
      ),
    );
  }
}
