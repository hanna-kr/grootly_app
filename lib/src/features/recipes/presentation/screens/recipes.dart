import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');

  Future<List<RecipeModel>> getAllRecipes() async {
    QuerySnapshot snapshot = await recipesCollection.get();
    if (snapshot.docs.isNotEmpty) {
      List<RecipeModel> recipes = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        recipes.add(RecipeModel.fromSnapshot(doc));
      }
      return recipes;
    } else {
      throw Exception('No recipes found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Rezepte',
      ),
      body: FutureBuilder<List<RecipeModel>>(
        future: getAllRecipes(),
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
                    leading: Text(recipe.difficulty),
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
