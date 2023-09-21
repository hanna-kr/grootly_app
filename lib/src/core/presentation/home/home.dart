import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/image_card_big.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/recipe_card_small.dart';

import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Recipe> recipesNew = [
    Recipe(
      recipeName: 'Baguette',
      recipeTime: 30,
      recipeImage: Image.asset('assets/images/example/baguette.jpg'),
    ),
    Recipe(
      recipeName: 'Butter',
      recipeTime: 40,
      recipeImage: Image.asset('assets/images/example/butter.jpg'),
    ),
    Recipe(
      recipeName: 'Frischkäse',
      recipeTime: 30,
      recipeImage: Image.asset('assets/images/example/creamcheese.jpg'),
    ),
    Recipe(
      recipeName: 'Pesto',
      recipeTime: 30,
      recipeImage: Image.asset('assets/images/example/pesto.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GrootlyColor.primary,
        title: const Text(
          'Home',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.list_alt),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingH.s,
              const BigImageCard(
                  image: 'assets/images/example/foodstorage.jpg',
                  title: 'Lebensmittel richtig lagern',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.'),
              SpacingH.m,
              const Text(
                'Zuletzt angesehen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SpacingH.s,
              RecipeCardSmall(recipes: recipesNew),
              SpacingH.m,
              const Text(
                'Aktuelles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SpacingH.s,
              RecipeCardSmall(recipes: recipesNew),
            ],
          ),
        ),
      ),
    );
  }
}
