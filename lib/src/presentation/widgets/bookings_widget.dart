import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BookingsWidget extends StatelessWidget {
  const BookingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          height: height * .23,
          width: width * .7,
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.appBlack.withOpacity(.2), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.asset(
                  AppImages.basketBallCourtPng,
                  width: width,
                  height: height * .12,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5-a-side football',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.appBlack),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "₦1,000",
                          style: TextStyle(
                              color: AppColors.appGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                      TextSpan(
                          text: "/hr",
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.7))),
                    ])),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width * .7,
                  child: Row(
                    children: [
                      Image.asset(AppImages.footBallPng),
                      const Text(
                        ' ️Football',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
