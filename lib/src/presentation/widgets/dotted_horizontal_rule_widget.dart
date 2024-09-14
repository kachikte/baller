import 'package:flutter/material.dart';

class DottedHorizontalRuleWidget extends StatelessWidget {
  final double dotSize;
  final double spacing;
  final Color color;

  const DottedHorizontalRuleWidget({
    Key? key,
    this.dotSize = 4.0,
    this.spacing = 4.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(50, (index) {
        return Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
