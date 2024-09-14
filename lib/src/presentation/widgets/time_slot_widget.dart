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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          height: 66,
          width: 167,
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
                width: 16,
                height: 16,
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
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '₦500',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.appGreen),
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
