import 'package:flutter/material.dart';
import 'package:grootly_app/image_card_big.dart';
import 'package:grootly_app/recipe_card_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1599819055803-717bba43890f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Butter',
        recipeTime: 40,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Frischkäse',
        recipeTime: 25,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1442604699113-7d805614c476?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
    Recipe(
        recipeName: 'Pesto',
        recipeTime: 30,
        recipeImage: Image.network(
            'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')),
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              placeholder2,
              const BigImageCard(
                  imageUrl:
                      'https://media.istockphoto.com/id/1170328725/photo/close-up-of-various-food-in-airtight-jars.jpg?s=612x612&w=0&k=20&c=u5tUqbQPbcZ5zvMuRWrLv4VRxRpEBc8zbZpVh5TCqSk=',
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
