import 'package:flutter/material.dart';
import 'homepage.dart';
import 'globals.dart';
/*
 Here is where we will constants relating to the theme of our app, such as
 color scheme, font settings, and other UI objects as necessary
 */
class AppColors {
  // Flutter colors are RGB color codes prefixed with an opacity value.
  // The FF represents full opacity
  //LOGO colors
  static const orange = Color(0xFFEB8a2D);
  static const blue = Color(0xFFD6F4FF);
  static const yellow1 = Color(0xFFFDE74C);
  static const brown = Color(0xFF6C492B);
  static const yellow2 = Color(0xFFEEBF29);
  //Background Colors

  //extras
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const blue2 = Color(0xFF99dbf2);

  static const hour0 = Color(0xFFFF9E80);
  static const hour1 = Color(0xFFFF9E80);
  static const hour2 = Color(0xFFFFAB91);
  static const hour3 = Color(0xFFFFCCBC);
  static const hour4 = Color(0xFFFFAB40);
  static const hour5 = Color(0xFFFFA726);
  static const hour6 = Color(0xFFFFB74D);
  static const hour7 = Color(0xFFFFD180);
  static const hour8 = Color(0xFFFFCC80);
  static const hour9 = Color(0xFFFFD54F);
  static const hour10 = Color(0xFFFFE082);
  static const hour11 = Color(0xFFFFF176);
  static const hour12 = Color(0xFFC8E6C9);
  static const hour13 = Color(0xFFB2DFDB);
  static const hour14 = Color(0xFF80CBC4);
  static const hour15 = Color(0xFF80DEEA);
  static const hour16 = Color(0xFF4DD0E1);
  static const hour17 = Color(0xFF26C6DA);
  static const hour18 = Color(0xFF00ACC1);
  static const hour19 = Color(0xFF0097A7);
  static const hour20 = Color(0xFF00B8D4);
  static const hour21 = Color(0xFF0288D1);
  static const hour22 = Color(0xFF0277BD);
  static const hour23 = Color(0xFF1976D2);





}


ColorScheme colorScheme =  ColorScheme.dark(
  primary: AppColors.orange,
  onPrimary: AppColors.black,
  secondary: AppColors.yellow1,
  onSecondary: AppColors.black,
  surface: AppColors.blue,
  //background: AppColors.blue,

);
final appTheme = ThemeData.from(
    colorScheme: colorScheme
);