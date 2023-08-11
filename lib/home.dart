import 'package:flutter/material.dart';
import 'package:grootly_app/image_card_big.dart';
import 'package:grootly_app/recipe_card_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final placeholder = const SizedBox(
    height: 24,
  );

  final placeholder2 = const SizedBox(
    height: 8,
  );

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
              placeholder2,
              const BigImageCard(
                  image: 'assets/images/example/foodstorage.jpg',
                  title: 'Lebensmittel richtig lagern',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.'),
              placeholder,
              const Text(
                'Zuletzt angesehen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              placeholder2,
              RecipeCardSmall(recipes: recipesNew),
              placeholder,
              const Text(
                'Aktuelles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              placeholder2,
              RecipeCardSmall(recipes: recipesNew),
            ],
          ),
        ),
      ),
    );
  }
}
