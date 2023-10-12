import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

InputDecoration kTextfieldDeco = const InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: GrootlyBorderRadius.medium,
    borderSide: BorderSide(
      color: GrootlyColor.lightgrey2,
      width: 2,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: GrootlyBorderRadius.medium,
    borderSide: BorderSide(
      color: GrootlyColor.yellow2,
      width: 2,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: GrootlyBorderRadius.medium,
    borderSide: BorderSide(
      color: GrootlyColor.lightgrey2,
      width: 2,
    ),
  ),
  labelStyle: GrootlyTextStyle.textfield,
  hintStyle: GrootlyTextStyle.textfield,
);
