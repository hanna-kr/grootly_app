import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/category_list.dart';
import 'package:grootly_app/src/features/recipes/presentation/widgets/recipe_image_picker.dart';

class RecipeCreatorPage extends StatefulWidget {
  const RecipeCreatorPage({super.key});

  @override
  State<RecipeCreatorPage> createState() => _RecipeCreatorPageState();
}

class _RecipeCreatorPageState extends State<RecipeCreatorPage> {
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _utensilController = TextEditingController();

  String recipeImagePath = '';

  String? selectedDifficulty;
  List<String> selectedCategories = [];

  void setRecipeImagePath(String? imagePath) {
    setState(() {
      recipeImagePath = imagePath ?? '';
    });
  }

  @override
  void dispose() {
    _recipeController.dispose();
    _descriptionController.dispose();
    _utensilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      appBar: CustomAppBar(
        title: 'Rezept hinzufügen',
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: PaddingAll.l,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Titel',
              style: GrootlyTextStyle.headlineB4,
            ),
            SpacingH.s,
            TextField(
              controller: _recipeController,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Titel',
                hintText: 'Titel',
              ),
            ),
            SpacingH.m,
            const Text(
              'Bild',
              style: GrootlyTextStyle.headlineB4,
            ),
            SpacingH.s,
            Center(
              child: CustomImagePickerRecipe(setImage: setRecipeImagePath),
            ),
            SpacingH.m,
            const Text(
              'Schwierigkeitsgrad',
              style: GrootlyTextStyle.headlineB4,
            ),
            SpacingH.s,
            Column(
              children: [
                RadioListTile(
                  value: 'leicht',
                  groupValue: selectedDifficulty,
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value.toString();
                    });
                  },
                  title: const Text('leicht'),
                ),
                RadioListTile(
                  value: 'mittel',
                  groupValue: selectedDifficulty,
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value.toString();
                    });
                  },
                  title: const Text('mittel'),
                ),
                RadioListTile(
                  value: 'schwer',
                  groupValue: selectedDifficulty,
                  onChanged: (value) {
                    setState(() {
                      selectedDifficulty = value.toString();
                    });
                  },
                  title: const Text('schwer'),
                ),
              ],
            ),
            SpacingH.m,
            CategoryList(selectedCategories: selectedCategories),
            SpacingH.m,
            const Text(
              'Beschreibung',
              style: GrootlyTextStyle.headlineB4,
            ),
            SpacingH.s,
            TextField(
              controller: _descriptionController,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Beschreibung',
                hintText: 'Beschreibung',
              ),
            ),
            SpacingH.m,
            const Text(
              'Utensilien',
              style: GrootlyTextStyle.headlineB4,
            ),
            SpacingH.s,
            TextField(
              controller: _utensilController,
              decoration: kTextFieldDecoration.copyWith(
                labelText: 'Utensilien',
                hintText: 'Utensilien',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
