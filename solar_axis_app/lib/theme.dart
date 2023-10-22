import 'package:flutter/material.dart';

/*
 Here is where we will constants relating to the theme of our app, such as
 color scheme, font settings, and other UI objects as necessary
 */

class AppColors {
  // Flutter colors are RGB color codes prefixed with an opacity value.
  // The FF represents full opacity
  static const orange = Color(0xB4FF5321);
  static const tan = Color(0xFFEEDEC9);
  static const pink = Color(0xFFF7BDBE);
}

ColorScheme colorScheme = const ColorScheme.dark(
  primary: AppColors.pink,
  primaryVariant: AppColors.pink,
  secondary: AppColors.orange,
  secondaryVariant: AppColors.orange,
  surface: AppColors.tan,
  background: AppColors.tan,
);
final appTheme = ThemeData.from(
    colorScheme: colorScheme
);