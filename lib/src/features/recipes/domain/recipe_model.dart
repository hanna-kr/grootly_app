class RecipeModel {
  String recipeId;
  List<String> category;
  List<String> description;
  String difficulty;
  String prepDuration;
  String cookDuration;
  String imgURL;
  Map<String, String> ingredients;
  String title;
  List<String> utensils;
  int servings;
  String duration;
  String? restTime;
  String subCategory;

  RecipeModel(
      {required this.recipeId,
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
      required this.duration,
      required this.restTime,
      required this.subCategory});

  factory RecipeModel.fromJson(Map<String, dynamic> json, String recipeId) {
    return RecipeModel(
        recipeId: recipeId,
        category: List<String>.from(json['category']),
        description: List<String>.from(json['description']),
        difficulty: json['difficulty'],
        imgURL: json['imgURL'],
        ingredients: Map<String, String>.from(json['ingredients']),
        title: json['title'],
        utensils: List<String>.from(json['utensils']),
        prepDuration: json['prepDuration'],
        cookDuration: json['cookDuration'],
        servings: json['servings'],
        duration: json['duration'],
        restTime: json['restTime'],
        subCategory: json['subcategory']);
  }
  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
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
      'duration': duration,
      'restTime': restTime ?? '',
      'subCategory': subCategory,
    };
  }
}
