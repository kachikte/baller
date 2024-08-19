import 'package:flutter/material.dart';

class AppNotificationPop extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String text;

  const AppNotificationPop({
    required this.width,
    required this.height,
    required this.backgroundColor,
    this.foregroundColor = Colors.white,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: backgroundColor),
      child: Row(
        children: [
          prefixIcon,
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: foregroundColor),
          ),
          const Expanded(child: SizedBox()),
          suffixIcon
        ],
      ),
    );
    ;
  }
}
