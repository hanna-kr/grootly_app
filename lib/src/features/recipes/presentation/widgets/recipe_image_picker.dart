import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerRecipe extends StatefulWidget {
  final Function setImage;

  const CustomImagePickerRecipe({super.key, required this.setImage});

  @override
  State<CustomImagePickerRecipe> createState() =>
      _CustomImagePickerRecipeState();
}

class _CustomImagePickerRecipeState extends State<CustomImagePickerRecipe> {
  String? imagePath;

  Future<void> selectImage(ImageSource source) async {
    try {
      final XFile? tempFilePath = await ImagePicker().pickImage(source: source);
      final String? tempImagePath = tempFilePath?.path;
      if (tempImagePath != null) {
        setState(() {
          imagePath = tempImagePath;
        });
        widget.setImage(imagePath);
      }
    } catch (error) {
      debugPrint('Error selecting image: $error');
    }
  }

  Future<void> selectFromCamera() async {
    await selectImage(ImageSource.camera);
  }

  Future<void> selectFromGallery() async {
    await selectImage(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.width - 200,
      decoration: const BoxDecoration(borderRadius: GrootlyBorderRadius.medium),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: GrootlyColor.lightgrey,
        borderRadius: GrootlyBorderRadius.medium,
        child: InkWell(
          borderRadius: GrootlyBorderRadius.medium,
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Bildquelle auswählen',
                    style: GrootlyTextStyle.headlineB4,
                  ),
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: PaddingAll.m,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: selectFromCamera,
                            child: const FaIcon(
                              FontAwesomeIcons.camera,
                              size: 60,
                              color: GrootlyColor.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: selectFromGallery,
                            child: const FaIcon(
                              FontAwesomeIcons.images,
                              size: 60,
                              color: GrootlyColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'zurück',
                        style: GrootlyTextStyle.bodyB1,
                      ),
                    )
                  ],
                );
              },
            );
          },
          child: imagePath != null
              ? Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: FaIcon(
                    FontAwesomeIcons.image,
                    color: GrootlyColor.white,
                    size: 60,
                  ),
                ),
        ),
      ),
    );
  }
}
