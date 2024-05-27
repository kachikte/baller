import 'package:flutter/material.dart';

class AppBorder {
  static const outlineInputBorderEnabled = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid
      )
  );

  static const outlineInputBorderError = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.red,
          style: BorderStyle.solid
      )
  );
}