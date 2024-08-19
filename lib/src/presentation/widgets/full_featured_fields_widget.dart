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
      // padding:
      //     EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
      height: height * .15,
      width: width * .84,
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryBackgroundColor.withOpacity(.5),
              width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              child: Image.asset(AppImages.footballField,
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
                  width: width * .3,
                  child: const Text(
                    'Cubic Pythagoras Multiservices Limited',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Gwarinpa',
                  style: TextStyle(fontSize: 12),
                ),
                RichText(
                    text: TextSpan(
                        text: "From ",
                        style:
                            TextStyle(color: AppColors.appBlack, fontSize: 12),
                        children: [
                      TextSpan(
                          text: "₦1,000.00",
                          style: TextStyle(
                            color: AppColors.appBlack,
                            fontSize: 12,
                          )),
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
                const Text(
                  'Football +2',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.appYellow,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '3.5',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
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
