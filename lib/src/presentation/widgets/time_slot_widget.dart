import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSlotWidget extends StatelessWidget {
  const TimeSlotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          height: height * .09,
          width: width * .5,
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.appBlack.withOpacity(.2), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.clockPng,
                color: AppColors.appBlack,
                fit: BoxFit.fill,
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '4:00 AM - 6:00 AM',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.appBlack),
                  ),
                  Text(
                    '₦500',
                    style: TextStyle(
                      color: AppColors.appGreen,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
