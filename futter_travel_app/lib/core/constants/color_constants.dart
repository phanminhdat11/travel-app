import 'package:flutter/material.dart';

class ColorsPalette {
  static const Color primaryColor = Color(0xff329D9C);
  static const Color secondColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);

  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color textColor = Color(0xFF323B4B);
  static const Color subTitleColor = Color(0xFF838383);
  static const Color backgroundScaffoldColor = Color(0xFFF2F2F2);
}

class Gradients {
  static const defaultGradientBackground = LinearGradient(
      begin: Alignment.topLeft,
       end: Alignment.bottomLeft, 
       colors: [
        ColorsPalette.secondColor,
        ColorsPalette.primaryColor,
       ]);
}
