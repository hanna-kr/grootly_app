import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final Function setImage;

  const CustomImagePicker({super.key, required this.setImage});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  String? imagePath;

  void selectImage() async {
    try {
      XFile? tempFilePath =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      String? tempImagePath = tempFilePath?.path;
      setState(() {
        imagePath = tempImagePath;
      });
      widget.setImage(imagePath);
    } catch (error) {
      debugPrint('Error selecting image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.width - 200,
        decoration:
            const BoxDecoration(borderRadius: GrootlyBorderRadius.medium),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: GrootlyColor.lightgrey,
          borderRadius: GrootlyBorderRadius.medium,
          child: InkWell(
            borderRadius: GrootlyBorderRadius.medium,
            onTap: selectImage,
            child: imagePath != null
                ? Image.file(
                    File(imagePath ?? ""),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: FaIcon(
                    FontAwesomeIcons.image,
                    color: GrootlyColor.white,
                    size: 60,
                  )),
          ),
        ));
  }
}
