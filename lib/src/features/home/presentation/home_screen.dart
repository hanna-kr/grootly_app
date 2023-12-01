import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/small_recipe_card.dart';
import 'package:grootly_app/src/features/tips/application/tips_service.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';
import 'package:grootly_app/src/features/tips/presentation/widgets/tips_big_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService recipeService = RecipeService();
  List<RecipeModel> recipes = [];
  List<String> userFavorites = [];

  @override
  void initState() {
    super.initState();
    _fetchUserFavorites();
  }

  void _fetchUserFavorites() async {
    try {
      userFavorites = await recipeService.fetchUserFavorites();
      setState(() {});
    } catch (e) {
      debugPrint('Error fetching favorites: $e');
    }
  }

  void _handleFavoritesListChanged(String recipeId) async {
    try {
      if (userFavorites.contains(recipeId)) {
        await recipeService.removeFromFavorites(recipeId);
        userFavorites.remove(recipeId);
      } else {
        await recipeService.addToFavorites(recipeId);
        userFavorites.add(recipeId);
      }
      debugPrint('Updated Favorites: $userFavorites');
      setState(() {});
    } catch (e) {
      debugPrint('Error updating favorites: $e');
    }
  }

  Tips getCurrentTip(List<Tips> tipsList) {
    int currentDay = DateTime.now().day;
    Random random = Random(currentDay);
    int tipIndex = random.nextInt(tipsList.length);

    return tipsList[tipIndex];
  }

  @override
  Widget build(BuildContext context) {
    TipsService tipsService = TipsService();

    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        trailingIcon: Icons.person,
        onTrailingPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: SingleChildScrollView(
        padding: PaddingAll.m,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hallo, Öko-Foodie!',
              style: GrootlyTextStyle.headlineB2,
            ),
            const Text(
              'Bereit für eine Prise Grün auf deinem Teller?',
              style: GrootlyTextStyle.body2,
            ),
            SpacingH.l,
            FutureBuilder(
              future: tipsService.getAllTipsFuture(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  String error = snapshot.error.toString();
                  debugPrint(error);
                  return const Text(
                    'Da ist etwas schief gelaufen',
                    style: GrootlyTextStyle.body2,
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: GrootlyColor.mediumgreen,
                    ),
                  );
                } else {
                  List<Tips> tipsList = snapshot.data ?? [];
                  Tips currentTip = getCurrentTip(tipsList);
                  return TipBigCard(
                    hasLabel: true,
                    tips: currentTip,
                    text: 'Tipp des Tages',
                  );
                }
              },
            ),
            SpacingH.l,
            const Text(
              'Deine Favoriten',
              style: GrootlyTextStyle.headlineB3,
            ),
            SpacingH.l,
            Column(
              children: [
                StreamBuilder<List<RecipeModel>>(
                  stream: recipeService.getFavoritesStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RecipeModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: GrootlyColor.primary,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'Du hast noch keine Favoriten ausgewählt.',
                          style: GrootlyTextStyle.body2,
                        ),
                      );
                    } else {
                      var recipes = snapshot.data!;
                      return CarouselSlider.builder(
                        itemCount: recipes.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          RecipeModel recipe = recipes[itemIndex];
                          return RecipeSmallCard(
                            recipe: recipe,
                            isFavorite: userFavorites.contains(recipe.recipeId),
                            onFavoritePressed: _handleFavoritesListChanged,
                          );
                        },
                        options: CarouselOptions(
                          height: 208,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.55,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            SpacingH.l,
            const Text(
              'Saisonale Rezepte',
              style: GrootlyTextStyle.headlineB3,
            ),
            SpacingH.l,
            const Center(
                child: Text(
              'Noch in Bearbeitung ...',
              style: GrootlyTextStyle.body2,
            ))
          ],
        ),
      ),
    );
  }
}
