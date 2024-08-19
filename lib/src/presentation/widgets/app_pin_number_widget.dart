import 'package:flutter/material.dart';

class AppPinNumberWidget extends StatelessWidget {
  final String number;
  final VoidCallback func;
  final double textSize;

  const AppPinNumberWidget({required this.number, required this.func, this.textSize = 25});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Text(number, style: TextStyle(fontSize: textSize),),
    );
  }
}
