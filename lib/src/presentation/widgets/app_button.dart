import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final Color? textColor;
  VoidCallback pressedFunction;
  final Widget buttonIcon;
  final Widget suffixButtonIcon;
  final String buttonText;
  final double buttonRadius;

  AppButton(
      {super.key,
      required this.pressedFunction,
      this.buttonIcon = const SizedBox(),
      this.suffixButtonIcon = const SizedBox(),
      required this.buttonColor,
      required this.buttonText,
      this.textColor = Colors.black,
      this.borderColor = Colors.transparent,
      this.buttonRadius = 30});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 1, style: BorderStyle.solid),
            borderRadius:
                BorderRadius.circular(buttonRadius), // Adjust the radius here
          )),
          backgroundColor: MaterialStateProperty.all(buttonColor)),
      onPressed: pressedFunction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
            if (buttonText != '') const SizedBox(
              width: 10,
            ),
            if (buttonText != '') Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
            if (buttonText != '') const SizedBox(
              width: 10,
            ),
            suffixButtonIcon
          ],
        ),
      ),
    );
  }
}
