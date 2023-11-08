import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeService {
  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');

  Future<List<RecipeModel>> getAllRecipes() async {
    try {
      QuerySnapshot collection = await recipesCollection.get();
      List<Map<String, dynamic>> rawData = collection.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      List<RecipeModel> recipes = rawData
          .map((val) => RecipeModel.fromJson(val, val.keys.toString()))
          .toList();
      return recipes;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Stream<List<RecipeModel>> getAllRecipesStream() {
    try {
      return recipesCollection.snapshots().map((snapshot) {
        List<Map<String, dynamic>> rawData = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<RecipeModel> recipes = rawData
            .map((val) => RecipeModel.fromJson(val, val.keys.toString()))
            .toList();
        return recipes;
      });
    } catch (e) {
      debugPrint(e.toString());
      return Stream.value([]);
    }
  }
}
