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
          height: 162,
          width: 232,
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.appBlack.withOpacity(.2), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  AppImages.basketBallCourtPng,
                  width: 232,
                  height: 99,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5-a-side football',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "₦1,000",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      TextSpan(
                          text: "/hr",
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.7))),
                    ])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width * .7,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.footBallPng,
                        height: 12,
                        width: 12,
                      ),
                      Text(
                        ' ️Football',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
