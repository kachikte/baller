import 'package:flutter/material.dart';
import 'package:baller/src/utils/app_colors.dart';

class AppTheme {

  static lightTheme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
            color: AppColors.primaryColor
        ),
        fontFamily: 'Foldit',
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.primaryBackgroundColor,
      textTheme: TextTheme(
        bodySmall: TextStyle(color: AppColors.primaryColor)
      )
    );
  }

  static darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColorDark
      ),
      primaryColor: AppColors.primaryColorDark,
      backgroundColor: AppColors.primaryBackgroundColorDark,
    );
  }

  static ThemeMode setThemeMode({required bool isLight}) {
    return isLight ? ThemeMode.light : ThemeMode.dark;
  }
}