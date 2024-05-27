import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  VoidCallback pressedFunction;
  final Icon buttonIcon;

  AppButton({super.key, required this.pressedFunction, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressedFunction,
      icon: buttonIcon,
    );
  }
}
