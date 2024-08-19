import 'package:flutter/material.dart';

class AppKeyContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double radius;
  final Widget widget;

  const AppKeyContainer(
      {required this.width,
      required this.height,
      required this.color,
      this.radius = 10,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(color: color.withOpacity(.5))),
      child: Center(
        child: widget,
      ),
    );
  }
}
