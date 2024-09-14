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
      height: 164,
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
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColors.appWhite),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sport",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.appWhite),
                    ),
                    Text(
                      "Reserved date",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.appWhite),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Basketball",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appWhite),
                    ),
                    Text(
                      "14 Feb ‘24",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appWhite),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reserved time",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.appWhite),
                    ),
                    Text(
                      "Location",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.appWhite),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "08:30 am",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appWhite),
                    ),
                    SizedBox(
                      width: width * .25,
                      child: Text(
                        "Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.appWhite),
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
    );
  }
}
