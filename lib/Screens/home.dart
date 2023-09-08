import 'package:flutter/material.dart';
import 'package:grootly_app/Components/image_card_big.dart';
import 'package:grootly_app/Components/recipe_card_small.dart';
import 'package:grootly_app/Styles/spacing.dart';

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
        backgroundColor: Theme.of(context).primaryColor,
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
              SpacingH.kSpacing8,
              const BigImageCard(
                  image: 'assets/images/example/foodstorage.jpg',
                  title: 'Lebensmittel richtig lagern',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.'),
              SpacingH.kSpacing16,
              const Text(
                'Zuletzt angesehen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SpacingH.kSpacing8,
              RecipeCardSmall(recipes: recipesNew),
              SpacingH.kSpacing16,
              const Text(
                'Aktuelles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SpacingH.kSpacing8,
              RecipeCardSmall(recipes: recipesNew),
            ],
          ),
        ),
      ),
    );
  }
}
