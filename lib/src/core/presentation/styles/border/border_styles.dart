import 'package:flutter/material.dart';

class GrootlyBorderRadius {
  static const BorderRadius medium = BorderRadius.all(Radius.circular(10.0));

  static const BorderRadius imageCard = BorderRadius.only(
      topLeft: Radius.circular(10), topRight: Radius.circular(10));

  static const BorderRadius recipeSearch = BorderRadius.only(
      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
}
