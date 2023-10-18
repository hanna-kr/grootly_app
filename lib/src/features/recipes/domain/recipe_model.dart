import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String category;
  Map<String, String> description;
  String difficulty;
  String duration;
  String imgURL;
  Map<String, String> ingredients;
  String title;
  List<String> utensils;

  RecipeModel({
    required this.category,
    required this.description,
    required this.difficulty,
    required this.duration,
    required this.imgURL,
    required this.ingredients,
    required this.title,
    required this.utensils,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      category: map['category'],
      description: Map<String, String>.from(map['description']),
      difficulty: map['difficulty'],
      duration: map['duration'],
      imgURL: map['imgURL'],
      ingredients: Map<String, String>.from(map['ingredients']),
      title: map['title'],
      utensils: List<String>.from(map['utensils']),
    );
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
      'duration': duration,
      'imgURL': imgURL,
      'ingredients': ingredients,
      'title': title,
      'utensils': utensils,
    };
  }
}
