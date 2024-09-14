import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FullFeaturedFieldsWidget extends StatelessWidget {
  final bool bookmark;

  const FullFeaturedFieldsWidget({required this.bookmark});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .03),
      height: 127,
      width: width * .84,
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryBackgroundColor.withOpacity(.5),
              width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  child: Image.asset(AppImages.basketBallCourtPng,
                      width: 116, height: 127, fit: BoxFit.fill)),
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.appBlue),
                    ),
                    SizedBox(
                      width: width * .3,
                      child: Text(
                        'Cubic Pythagoras Multiservices Limited',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.appBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gwarinpa',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "From ",
                            style: Theme.of(context).textTheme.bodyText1,
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
                      style: Theme.of(context).textTheme.bodyText1,
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.lightText),
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
          bookmark
              ? Positioned(
                  top: 5,
                  left: 80,
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.appWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      child: Image.asset(
                        AppImages.bookmarkIconPng,
                        color: AppColors.appGreen,
                      )))
              : const SizedBox()
        ],
      ),
    );
  }
}
