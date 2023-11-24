import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/core/presentation/widgets/search_bar.dart';
import 'package:grootly_app/src/features/recipes/application/recipe_service.dart';
import 'package:grootly_app/src/features/recipes/domain/recipe_model.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/recipe_card_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  final RecipeService recipeService = RecipeService();
  List<RecipeModel> recipes = [];
  List<String> userFavorites = [];

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
      setState(() {});
    } catch (e) {
      debugPrint('Error updating favorites: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserFavorites();
  }

  Stream<List<RecipeModel>> getFilteredRecipesStream(String searchQuery) {
    String searchLower = searchQuery.toLowerCase();
    return FirebaseFirestore.instance
        .collection('recipes')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecipeModel.fromJson(doc.data(), doc.id);
      }).where((recipe) {
        return recipe.title.toLowerCase().contains(searchLower) ||
            recipe.ingredients.keys
                .any((k) => k.toLowerCase().contains(searchLower)) ||
            recipe.subCategory.toLowerCase().contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: const CustomAppBar(title: 'Suche'),
      body: SingleChildScrollView(
        padding: PaddingAll.m,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(onSearchChanged: (String value) {
              setState(() {
                searchQuery = value;
              });
            }),
            Padding(
              padding: PaddingVer.m,
              child: StreamBuilder<List<RecipeModel>>(
                stream: getFilteredRecipesStream(searchQuery),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: GrootlyColor.primary,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Kein Rezept gefunden',
                          style: GrootlyTextStyle.body2),
                    );
                  }
                  final recipes = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      RecipeModel recipe = recipes[index];
                      return RecipeSearchCard(
                        recipe: recipe,
                        isFavorite: userFavorites.contains(recipe.recipeId),
                        onFavoritePressed: _handleFavoritesListChanged,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
