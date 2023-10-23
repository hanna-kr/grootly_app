import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/textfield_deco/textfield_deco.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:grootly_app/src/features/profile/presentation/widgets/custom_image_picker.dart';

class RecipeCreatorPage extends StatefulWidget {
  const RecipeCreatorPage({super.key});

  @override
  State<RecipeCreatorPage> createState() => _RecipeCreatorPageState();
}

class _RecipeCreatorPageState extends State<RecipeCreatorPage> {
  final TextEditingController _recipeController = TextEditingController();

  String recipeImagePath = '';

  void setRecipeImagePath(String? imagePath) {
    setState(() {
      recipeImagePath = imagePath ?? '';
    });
  }

  bool isclicked = false;

  @override
  void dispose() {
    _recipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rezept hinzufügen',
        leadingIcon: Icons.chevron_left,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
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
                  )),
              SpacingH.m,
              const Text(
                'Kategorie',
                style: GrootlyTextStyle.headlineB4,
              ),
              SpacingH.s,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isclicked, onChanged: (value) {}),
                  SpacingW.m,
                  const Text('leicht'),
                  SpacingW.m,
                  Checkbox(value: isclicked, onChanged: (value) {}),
                  SpacingW.m,
                  const Text('mittel'),
                  SpacingW.m,
                  Checkbox(value: isclicked, onChanged: (value) {}),
                  SpacingW.m,
                  const Text('schwer'),
                ],
              ),
              SpacingH.m,
              const Text(
                'Bild',
                style: GrootlyTextStyle.headlineB4,
              ),
              SpacingH.s,
              Center(child: CustomImagePicker(setImage: setRecipeImagePath))
            ],
          ),
        ),
      ),
    );
  }
}
