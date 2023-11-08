import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/big_recipe_card.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeService recipeService = RecipeService();
  List<RecipeModel> recipes = [];
  List<String> userFavorites = [];

  void _handleFavoritesListChanged(String recipeId) {
    setState(() {
      if (userFavorites.contains(recipeId)) {
        userFavorites.remove(recipeId);
      } else {
        userFavorites.add(recipeId);
      }
    });
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
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  RecipeModel recipe = recipes[index];
                  return RecipeBigCard(
                    text: 'Tipp der Woche',
                    hasLabel: false,
                    recipe: recipe,
                    isFavorite: userFavorites.contains(recipe.recipeId),
                    onFavoritePressed: _handleFavoritesListChanged,
                  );
                },
              );
            } else {
              return const Text('No recipes found');
            }
          },
        ),
      ),
    );
  }
}
