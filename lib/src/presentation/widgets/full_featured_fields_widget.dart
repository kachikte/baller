import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FullFeaturedFieldsWidget extends StatelessWidget {
  const FullFeaturedFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .03),
      height: height * .15,
      width: width * .84,
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryBackgroundColor.withOpacity(.5),
              width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          ClipRRect(
              child: Image.asset(AppImages.basketBallCourtPng,
                  width: width * .25, height: height * .15, fit: BoxFit.fill)),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.appBlue,
                      fontSize: 12),
                ),
                SizedBox(
                  width: width * .4,
                  child: const Text(
                    'Cubic Pythagoras Multiservices Limited',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Gwarinpa',
                  style: TextStyle(
                      fontSize: 14, color: AppColors.appBlack.withOpacity(.4)),
                ),
                RichText(
                    text: TextSpan(
                        text: "From ",
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.appBlack.withOpacity(.4)),
                        children: [
                      TextSpan(
                          text: "₦1,000.00",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.appBlack.withOpacity(.4))),
                    ])),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Football +2',
                  style: TextStyle(
                      fontSize: 13, color: AppColors.appBlack.withOpacity(.4)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.appYellow,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3.5',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.appBlack.withOpacity(.4)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
    ;
  }
}
