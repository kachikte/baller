import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AccountTypeWidget extends StatelessWidget {

  final bool isActive;
  final VoidCallback func;
  final String title;
  final String body;
  final String imagePath;

  const AccountTypeWidget({required this.title, required this.body, required this.isActive, required this.func, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .035),
        padding:
            EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
        height: height * .17,
        // width: width * .84,
        decoration: BoxDecoration(
            border: Border.all(color: isActive ? AppColors.appGreen : AppColors.primaryBackgroundColor.withOpacity(.5), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    body,
                    style: TextStyle(fontSize: 15, color: AppColors.appBlack.withOpacity(.5)),
                  ),
                ],
              ),
            ),
            ClipRRect(
                child: Image.asset(
              imagePath,
              width: width * .3,
              fit: BoxFit.fill,
            )),
          ],
        ),
      ),
    );
  }
}
