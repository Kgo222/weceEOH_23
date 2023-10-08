import 'package:flutter/material.dart';

/*
 Here is where we will constants relating to the theme of our app, such as
 color scheme, font settings, and other UI objects as necessary
 */

class AppColors {
  // Flutter colors are RGB color codes prefixed with an opacity value.
  // The FF represents full opacity
  static const purple = Color(0xB4A7D6FF);
  static const tan = Color(0xFFEEDEC9);
  static const pink = Color(0xFFF7BDBE);
}

ColorScheme colorScheme = const ColorScheme.dark(
  primary: AppColors.pink,
  primaryVariant: AppColors.pink,
  secondary: AppColors.purple,
  secondaryVariant: AppColors.purple,
  surface: AppColors.tan,
  background: AppColors.tan,
);
final appTheme = ThemeData.from(
    colorScheme: colorScheme
);