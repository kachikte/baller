import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * .7,
      height: height * .07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo, width: width * .2, height: height * .07),
          Text(Constants.title, style: TextStyle(color: AppColors.appBlack, fontWeight: FontWeight.bold, fontSize: 20),)
        ],
      ),
    );
  }
}
