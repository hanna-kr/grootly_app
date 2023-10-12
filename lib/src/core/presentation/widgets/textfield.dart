import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;

  const CustomTextField(
      {super.key, this.labelText, this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: GrootlyBorderRadius.medium,
          borderSide: BorderSide(
            color: GrootlyColor.lightgrey2,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: GrootlyBorderRadius.medium,
          borderSide: BorderSide(
            color: GrootlyColor.yellow2,
            width: 2,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: GrootlyBorderRadius.medium,
          borderSide: BorderSide(
            color: GrootlyColor.lightgrey2,
            width: 2,
          ),
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: GrootlyColor.darkgrey2,
        ),
        labelText: labelText,
        labelStyle: GrootlyTextStyle.textfield,
        hintText: hintText,
        hintStyle: GrootlyTextStyle.textfield,
      ),
    );
  }
}
