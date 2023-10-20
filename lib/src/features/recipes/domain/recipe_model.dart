import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String category;
  Map<String, String> description;
  String difficulty;
  String prepDuration;
  String cookDuration;
  String imgURL;
  Map<String, String> ingredients;
  String title;
  List<String> utensils;
  String servings;

  RecipeModel({
    required this.category,
    required this.description,
    required this.difficulty,
    required this.prepDuration,
    required this.cookDuration,
    required this.imgURL,
    required this.ingredients,
    required this.title,
    required this.utensils,
    required this.servings,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
        category: map['category'],
        description: Map<String, String>.from(map['description']),
        difficulty: map['difficulty'],
        imgURL: map['imgURL'],
        ingredients: Map<String, String>.from(map['ingredients']),
        title: map['title'],
        utensils: List<String>.from(map['utensils']),
        prepDuration: map['prepDuration'],
        cookDuration: map['cookDuration'],
        servings: map['servings']);
  }

  factory RecipeModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return RecipeModel.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'description': description,
      'difficulty': difficulty,
      'prepDuration': prepDuration,
      'cookDuration': cookDuration,
      'imgURL': imgURL,
      'ingredients': ingredients,
      'title': title,
      'utensils': utensils,
      'servings': servings,
    };
  }
}
