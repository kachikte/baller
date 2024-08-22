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
          height: height * .27,
          width: width * .8,
          decoration: BoxDecoration(
              color: AppColors.appWhite,
              border: Border.all(
                  color: AppColors.appBlack.withOpacity(.2), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Available',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.appBlue),
                    ),
                    const Text(
                      'Football +2',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
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
                  child: const Text(
                    'Cubic Pythagoras Multiservices Limited',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: width * .7,
                  child: const Text(
                    'Gwarinpa, Nigeria',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: width * .7,
                      child: const Text(
                        'From ₦1,000',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Icon(
              //           Icons.sports_baseball,
              //           size: 12,
              //           color: AppColors.appBlack.withOpacity(.5),
              //         ),
              //         const SizedBox(
              //           width: 5,
              //         ),
              //         Text(
              //           'Football',
              //           style: TextStyle(
              //               fontSize: 12,
              //               color: AppColors.appBlack.withOpacity(.5)),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       width: width * .01,
              //     ),
              //     SizedBox(
              //         width: 10,
              //         height: height * .015,
              //         child: VerticalDivider(
              //           width: 10,
              //           color: AppColors.appBlack,
              //         )),
              //     SizedBox(
              //       width: width * .01,
              //     ),
              //     Row(
              //       children: [
              //         Icon(
              //           Icons.location_on_rounded,
              //           size: 12,
              //           color: AppColors.appBlack.withOpacity(.5),
              //         ),
              //         const SizedBox(
              //           width: 5,
              //         ),
              //         Text(
              //           'Gwarinpa',
              //           style: TextStyle(
              //               fontSize: 12,
              //               color: AppColors.appBlack.withOpacity(.5)),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: SizedBox(
            width: width * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * .04,
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
    ;
  }
}
