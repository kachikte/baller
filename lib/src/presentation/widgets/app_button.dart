import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final Color buttonColor;
  final Color? textColor;
  VoidCallback pressedFunction;
  final Widget buttonIcon;
  final String buttonText;

  AppButton({super.key, required this.pressedFunction, this.buttonIcon = const SizedBox(), required this.buttonColor, required this.buttonText, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Adjust the radius here
              )
          ),
          backgroundColor: MaterialStateProperty.all(
             buttonColor
          )
      ),
      onPressed: pressedFunction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
            const SizedBox(width: 10,),
            Text(buttonText, style: TextStyle(color: textColor),),
          ],
        ),
      ),
    );
  }
}
