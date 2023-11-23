import 'package:flutter/material.dart';

class PaddingAll {
  static const EdgeInsets xs = EdgeInsets.all(8.0);
  static const EdgeInsets s = EdgeInsets.all(10.0);
  static const EdgeInsets m = EdgeInsets.all(16.0);
  static const EdgeInsets l = EdgeInsets.all(20.0);
}

class PaddingHor {
  static const EdgeInsets s = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets m = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets l = EdgeInsets.symmetric(horizontal: 20.0);
}

class PaddingVer {
  static const EdgeInsets s = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets m = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets l = EdgeInsets.symmetric(vertical: 20.0);
}

class PaddingCard {
  static const EdgeInsets tips =
      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12);
}
