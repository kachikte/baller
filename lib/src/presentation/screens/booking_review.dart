import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingReviewScreen extends ConsumerStatefulWidget {
  const BookingReviewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingReviewScreenState();
}

class _BookingReviewScreenState extends ConsumerState<BookingReviewScreen> {
  navigateToPayment() {
    Navigator.pushNamed(context, AppRoutes.paymentScreen);
  }

  List services = [
    'Jersey( 12 )',
    'Shin Guards( 12 )',
    'Soccer Boot( 5 )',
    'Goalkeeper glove ( 1 )',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.close,
                color: AppColors.appBlack,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Booking - ",
                  style: TextStyle(
                      color: AppColors.appBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 17)),
              TextSpan(
                  text: "Estate Basketball Court",
                  style: TextStyle(color: AppColors.appBlack)),
            ])),
          ],
        ),
        elevation: 1,
      ),
      backgroundColor: AppColors.appWhite,
      body: SizedBox(
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * .72,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Review booking details",
                              style: TextStyle(
                                  color: AppColors.appBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Text(
                              "Confirm your booking details.",
                              style: TextStyle(
                                  color: AppColors.appBlack.withOpacity(.5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .03),
                      height: height * .3,
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
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
                          ),
                          Container(
                            height: height * .15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.appBlack.withOpacity(.2),
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Arena',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 13,
                                          color: AppColors.appBlack),
                                    ),
                                    Text(
                                      'Estate football Court',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColors.appBlack),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      'Reserved date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 13,
                                          color: AppColors.appBlack),
                                    ),
                                    Text(
                                      '14 February 2024',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColors.appBlack),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      'Reserved time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 13,
                                          color: AppColors.appBlack),
                                    ),
                                    Text(
                                      '08:30 am - 10:30 am',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColors.appBlack),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height * .25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking details',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Sport',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Basketball',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Ground',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '5-a-side football',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Gwarinpa',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Expected players',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "5 ",
                                    style: TextStyle(
                                        color: AppColors.appBlack,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                TextSpan(
                                    text: " View details",
                                    style: TextStyle(
                                        color: AppColors.appBlue,
                                        decoration: TextDecoration.underline)),
                              ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height * .2,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Requested services',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.appBlack),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: width,
                            child: Wrap(
                              spacing:
                                  5.0, // Space between widgets horizontally
                              runSpacing: 10.0, // Space between rows
                              children: List.generate(services.length, (index) {
                                return IntrinsicWidth(
                                  child: GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                          color: AppColors.appBlue
                                              .withOpacity(.08),
                                          border: Border.all(
                                              color: AppColors.appTransparent,
                                              width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Center(
                                        child: Text(
                                          services[index],
                                          style: TextStyle(
                                              color: AppColors.appBlack,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.primaryBackgroundColor, width: .5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .45,
                    child: AppButton(
                        buttonRadius: 10,
                        borderColor:
                            AppColors.primaryBackgroundColor.withOpacity(.3),
                        pressedFunction: () {},
                        buttonColor: AppColors.appWhite,
                        buttonText: 'Back'),
                  ),
                  SizedBox(
                    width: width * .45,
                    child: AppButton(
                        buttonRadius: 10,
                        pressedFunction: () => navigateToPayment(),
                        buttonColor: AppColors.appGreen,
                        textColor: AppColors.appWhite,
                        buttonText: 'Confirm booking'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
