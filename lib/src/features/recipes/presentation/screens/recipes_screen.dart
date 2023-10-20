import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final RecipeService recipeService = RecipeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leadingIcon: Icons.add,
        onLeadingPressed: () {
          Navigator.pushNamed(context, '/recipe_creator');
        },
        title: 'Rezepte',
      ),
      body: FutureBuilder<List<RecipeModel>>(
        future: recipeService.getAllRecipes(),
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
            List<RecipeModel> recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                RecipeModel recipe = recipes[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(recipe.imgURL),
                    title: Text(recipe.title),
                    subtitle: Text(recipe.category),
                  ),
                );
              },
            );
          } else {
            return const Text('No recipes found');
          }
        },
      ),
    );
  }
}