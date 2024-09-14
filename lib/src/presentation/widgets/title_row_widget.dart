import 'package:baller/src/utils/app_colors.dart';
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
      margin:
          EdgeInsets.symmetric(vertical: height * .03, horizontal: width * .03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: AppColors.appBlack),
          ),
          Text(
            trailingText,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColors.appGreen),
          )
        ],
      ),
    );
  }
}
