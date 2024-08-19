import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .24,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        image: const DecorationImage(
          image: AssetImage(AppImages.basketBallCourtJpg),
          fit: BoxFit
              .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
        ),
      ),
      margin:
          EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
      padding:
          EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .04),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .6,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Upcoming",
                    style: TextStyle(
                      color: AppColors.appWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sport",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Text(
                        "Reserved date",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Basketball",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Text(
                        "14 Feb ‘24",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reserved time",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Text(
                        "Location",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "08:30 am",
                        style: TextStyle(
                            color: AppColors.appWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: width * .23,
                        child: Text(
                          "Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108",
                          softWrap: true,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.appWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(AppImages.ballersScan)
          ],
        ),
      ),
    );
  }
}
