import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static lightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
      ),
      fontFamily: 'RethinkSans', // Set the default font family
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryBackgroundColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: AppColors.appBlack),
        bodyText1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: AppColors.lightText),
        bodyText2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.appWhite),
        headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: AppColors.appBlack),
        headline3: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.lightText),
        headline4: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            color: AppColors.semiDeepText),
        headline5: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.semiDeepTextOne),
        headline6: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            color: AppColors.lightText),
        // Body text

// Large title
        // Standard title
        subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor), // Subtitle
        subtitle2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor),
        caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryColor), // Smaller text
        overline: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryColor),
        button: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor), // Button text
      ),
    );
  }

  static darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColorDark,
      ),
      primaryColor: AppColors.primaryColorDark,
      backgroundColor: AppColors.primaryBackgroundColorDark,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColorDark),
        headline2: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColorDark),
        headline3: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColorDark),
        headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColorDark),
        headline5: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColorDark),
        headline6: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColorDark),
        bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryColorDark),
        bodyText2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryColorDark),
        subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColorDark),
        subtitle2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColorDark),
        caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryColorDark),
        overline: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryColorDark),
        button: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColorDark),
      ),
    );
  }

  static ThemeMode setThemeMode({required bool isLight}) {
    return isLight ? ThemeMode.light : ThemeMode.dark;
  }
}
