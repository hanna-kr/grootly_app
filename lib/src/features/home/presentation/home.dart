import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/image_card_big.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/recipe_card_small.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      appBar: CustomAppBar(
        title: 'Welcome back',
        trailingIcon: Icons.person_2_outlined,
        onTrailingPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SingleChildScrollView(
              padding: PaddingAll.l,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BigImageCard(
                    image: 'assets/images/example/foodstorage.jpg',
                    title: 'Lebensmittel richtig lagern',
                    subtitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. At purus tellus arcu sit nibh consectetur.',
                  ),
                  SpacingH.m,
                  const Text(
                    'Zuletzt angesehen',
                    style: GrootlyTextStyle.headlineB3,
                  ),
                  SpacingH.s,
                  RecipeCardSmall(recipes: recipesNew),
                  SpacingH.m,
                  const Text(
                    'Aktuelles',
                    style: GrootlyTextStyle.headlineB3,
                  ),
                  SpacingH.s,
                  RecipeCardSmall(recipes: recipesNew),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
