import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';

class RecipeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference recipesCollection =
      FirebaseFirestore.instance.collection('recipes');

// Fetch User Favourites

  Future<List<String>> fetchUserFavorites() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    DocumentSnapshot favoriteDoc =
        await _firestore.collection('favorites').doc(userId).get();
    if (favoriteDoc.exists) {
      return List.from(favoriteDoc['recipeId']);
    }

    return [];
  }

// Add Favourites to Firebase

  Future<void> addToFavorites(String recipeId) async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    DocumentReference favoritesRef =
        _firestore.collection('favorites').doc(userId);
    await favoritesRef.set({
      'recipeId': FieldValue.arrayUnion([recipeId])
    }, SetOptions(merge: true));
  }

// Remove Favourites from Firebase

  Future<void> removeFromFavorites(String recipeId) async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    DocumentReference favoritesRef =
        _firestore.collection('favorites').doc(userId);
    await favoritesRef.update({
      'recipeId': FieldValue.arrayRemove([recipeId])
    });
  }

// Future Function to get all recipes

  Future<List<RecipeModel>> getAllRecipes() async {
    try {
      QuerySnapshot collection = await recipesCollection.get();
      List<RecipeModel> recipes = collection.docs
          .map((doc) =>
              RecipeModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      return recipes;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  // Stream Function to get all recipes

  Stream<List<RecipeModel>> getAllRecipesStream() {
    return recipesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecipeModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Stream Function to get favorite recipes
  Stream<List<RecipeModel>> getFavoritesStream() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      throw Exception('User not logged in');
    }
    return _firestore
        .collection('favorites')
        .doc(uid)
        .snapshots()
        .asyncMap((favoriteDocSnapshot) async {
      if (!favoriteDocSnapshot.exists) {
        return [];
      }
      List<dynamic> favoriteIds = favoriteDocSnapshot.data()?['recipeId'] ?? [];
      List<RecipeModel> favoriteRecipes = [];
      for (String id in favoriteIds) {
        DocumentSnapshot recipeSnapshot = await recipesCollection.doc(id).get();
        if (recipeSnapshot.exists) {
          favoriteRecipes.add(RecipeModel.fromJson(
              recipeSnapshot.data() as Map<String, dynamic>,
              recipeSnapshot.id));
        }
      }
      return favoriteRecipes;
    });
  }

  // Delete UserData eg Favorites
}
