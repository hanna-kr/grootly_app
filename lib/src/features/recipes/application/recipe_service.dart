import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeService {
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
}
