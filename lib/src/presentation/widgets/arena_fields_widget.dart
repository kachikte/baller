import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ArenaFieldsWidget extends StatelessWidget {
  const ArenaFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          height: 202,
          width: width * .8,
          decoration: BoxDecoration(
              color: AppColors.appWhite,
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
                  height: 99,
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
                      'Available',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.appBlue),
                    ),
                    Text(
                      'Football +2',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width * .47,
                  child: Text(
                    'Cubic Pythagoras Multiservices Limited',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.appBlack),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width * .7,
                  child: Text(
                    'Gwarinpa, Nigeria',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: width * .8,
                child: Row(
                  children: [
                    Text(
                      'From ₦1,000',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Expanded(child: SizedBox()),
                    Icon(
                      Icons.star,
                      color: AppColors.appYellow,
                      size: 16,
                    ),
                    Text(
                      '3.5',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppColors.lightText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 7,
          left: 20,
          child: SizedBox(
            width: width * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 28,
                  width: width * .08,
                  decoration: BoxDecoration(
                      color: AppColors.appWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.all(2),
                  child: Center(
                    child: Image.asset(AppImages.bookmarkIconPng),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
