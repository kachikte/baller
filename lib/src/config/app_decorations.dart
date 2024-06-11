import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {

  static Size screenSize = WidgetsBinding.instance.window.physicalSize;

  static double borderRadiusCircular = screenSize.width * 0.05;

  static OutlineInputBorder borderOutline = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
      borderSide: BorderSide(
          color: AppColors.appBlack.withOpacity(.5), width: 0.7, style: BorderStyle.solid));

  static OutlineInputBorder borderError = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
      borderSide: BorderSide(
          color: AppColors.primaryColor, width: 0.7, style: BorderStyle.solid));

  static focusedBorder({required double width}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
        borderSide: BorderSide(
            color: AppColors.appBlack,
            width: 0.7,
            style: BorderStyle.solid));
  }

}