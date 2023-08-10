import 'package:flutter/material.dart';

class Recipe {
  String recipeName;
  int recipeTime;
  Image recipeImage;

  Recipe(
      {required this.recipeName,
      required this.recipeTime,
      required this.recipeImage});
}

class RecipeCardSmall extends StatelessWidget {
  const RecipeCardSmall({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              width: 160,
              child: Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  recipes[index].recipeImage,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Ausrichtung der Widgets nach links
                          children: [
                            Text(
                              recipes[index].recipeName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${recipes[index].recipeTime} min',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline),
                                  alignment: Alignment.bottomRight),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )));
        },
      ),
    );
  }
}
