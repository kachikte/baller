import 'package:flutter/material.dart';

class AppUtilWidgets {

  static spacing({required double height, double heightFactor = .05}) {
    return SizedBox(height: height * heightFactor);
  }
}