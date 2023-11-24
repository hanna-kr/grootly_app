import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';

class GrootlyTextStyle {
  // Header regular
  static const TextStyle headlineR1 = TextStyle(
      height: 1.125,
      fontSize: 32,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle headlineR2 = TextStyle(
      height: 1.1667,
      fontSize: 24,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle headlineR3 = TextStyle(
      height: 1.2,
      fontSize: 20,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle headlineR4 = TextStyle(
      height: 1.25,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle headlineR5 = TextStyle(
      height: 1.2857,
      fontSize: 14,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');

  // Header bold
  static const TextStyle headlineB1 = TextStyle(
      height: 1.125,
      fontSize: 32,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle headlineB2 = TextStyle(
      height: 1.1667,
      fontSize: 24,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle headlineB3 = TextStyle(
      height: 1.2,
      fontSize: 18,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle headlineB4 = TextStyle(
      height: 1.25,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle headlineB5 = TextStyle(
      height: 1.2857,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  // Body regular
  static const TextStyle body1 = TextStyle(
      height: 1.375,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle body2 = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');
  static const TextStyle body3 = TextStyle(
      height: 1.6667,
      fontSize: 12,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins');

  // Body bold
  static const TextStyle bodyB1 = TextStyle(
      height: 1.375,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle bodyB2 = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);
  static const TextStyle bodyB2l = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.mediumgreen2,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  // Button Text
  static const TextStyle buttonPrime = TextStyle(
      height: 1.375,
      fontSize: 16,
      color: GrootlyColor.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);

  static const TextStyle buttonSecond = TextStyle(
      height: 1.375,
      fontSize: 16,
      color: GrootlyColor.darkgreenText,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);

  static const TextStyle buttonTert = TextStyle(
      height: 1.375,
      fontSize: 14,
      color: GrootlyColor.limegreen,
      decoration: TextDecoration.underline,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500);

  // Textfield Text
  static const TextStyle textfield = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.mediumgrey,
      fontFamily: 'Poppins');

  // Underline Textbutton / Login / Sign Up
  static const TextStyle underline = TextStyle(
      decoration: TextDecoration.underline,
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.limegreen,
      fontFamily: 'Poppins');

// SnackBar Text
  static const TextStyle snackbar = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.white,
      fontFamily: 'Poppins');

// Label Recipe Card
  static const TextStyle label = TextStyle(
      height: 1.375,
      fontSize: 14,
      color: GrootlyColor.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

// Delete Function

  static const TextStyle delete = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.red,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

// Error Show Dialog Display

  static const TextStyle errorMessage = TextStyle(
      height: 1.6667,
      fontSize: 12,
      color: GrootlyColor.red,
      fontFamily: 'Poppins');

// Reauthenticate Function

  static const TextStyle reauthenticate = TextStyle(
      height: 1.4286,
      fontSize: 14,
      color: GrootlyColor.limegreen,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

// Searchbar

  static const TextStyle search = TextStyle(
      height: 1.375,
      fontSize: 16,
      color: GrootlyColor.mediumgrey,
      fontFamily: 'Poppins');
}
