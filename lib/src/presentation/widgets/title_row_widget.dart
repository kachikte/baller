import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {

  final String leadingText;
  final String trailingText;

  const TitleRowWidget({required this.leadingText, required this.trailingText});

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * .03, horizontal: width * .03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leadingText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          Text(trailingText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
