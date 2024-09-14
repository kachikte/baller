import 'package:flutter/material.dart';

class AppPinNumberWidget extends StatelessWidget {
  final bool isNumber;
  final String number;
  final VoidCallback func;
  final double textSize;

  const AppPinNumberWidget(
      {required this.number,
      required this.func,
      this.textSize = 25,
      this.isNumber = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Text(
        number,
        style: isNumber
            ? Theme.of(context).textTheme.headline4
            : Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
