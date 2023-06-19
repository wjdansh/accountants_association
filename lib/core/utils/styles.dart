import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: ColorsManager.primaryColor,
      textTheme: const TextTheme(
        titleSmall: TextStyle(
          color: Colors.black87,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
        labelSmall: TextStyle(
          wordSpacing: 0,
          letterSpacing: 0,
          color: ColorsManager.lightGrey,
          fontSize: 12,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
