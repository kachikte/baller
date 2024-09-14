import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingDetailScreen extends ConsumerStatefulWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    List services = [
      'Jersey( 12 )',
      'Shin Guards( 12 )',
      'Soccer Boot( 5 )',
      'Goalkeeper glove ( 1 )',
    ];

    showModalBottom() {
      return showModalBottomSheet(
          enableDrag: true,
          showDragHandle: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (ctx) {
            return Container(
              height: 423,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expected players details',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: AppColors.appBlack),
                              ),
                              Text(
                                'List of all players you provided.',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.appBlack.withOpacity(.1),
                            radius: 15,
                            child: CircleAvatar(
                              backgroundColor: AppColors.appWhite,
                              radius: 14,
                              child: Icon(
                                Icons.close,
                                color: AppColors.appBlack,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: AppButton(
                          buttonHeight: 37,
                          buttonRadius: 10,
                          pressedFunction: () {},
                          buttonColor: AppColors.appGreen.withOpacity(.1),
                          textColor: AppColors.appBlack,
                          buttonText: '6 Players'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '1.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Theresa Webb',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '2.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Kathryn Murphy',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '3.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Annette Black',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '4.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Brooklyn Simmons',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '5.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Leslie Alexander',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            '6.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            ' Floyd Miles',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 162,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    image: const DecorationImage(
                      // image: AssetImage(AppImages.basketBallCourtJpg),
                      image: AssetImage(AppImages.darkBackgroundJpg),
                      fit: BoxFit
                          .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .15,
                ),
                Container(
                    width: width,
                    height: 171,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.appBlack,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: width * .55,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              height: 139,
                              decoration: BoxDecoration(
                                  color: AppColors.appWhite,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Booking ID',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '2354673',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                color: AppColors.appBlack,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      Image.asset(
                                        AppImages.copyPng,
                                        width: 16,
                                        height: 16,
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          Expanded(
                            child: Container(
                                height: 139,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                    color: AppColors.appWhite,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Center(
                                    child: Image.asset(
                                  width: width * .25,
                                  height: 139,
                                  AppImages.ballersScan,
                                  fit: BoxFit.fill,
                                ))),
                          ),
                        ])),
                SizedBox(
                  height: height * .018,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 171,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking details',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.lightText),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Sport',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'Basketball',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: AppColors.appBlack,
                                    fontWeight: FontWeight.w700),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Ground',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '5-a-side football',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: AppColors.appBlack,
                                    fontWeight: FontWeight.w700),
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
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'Gwarinpa',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: AppColors.appBlack,
                                    fontWeight: FontWeight.w700),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Expected players',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          GestureDetector(
                            onTap: () => showModalBottom(),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "5 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: " View details",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: AppColors.appBlue,
                                          decoration:
                                              TextDecoration.underline)),
                            ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .012,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 143,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Requested services',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: AppColors.lightText,
                            fontWeight: FontWeight.w500),
                      ),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        width: width,
                        child: Wrap(
                          spacing: 5.0, // Space between widgets horizontally
                          runSpacing: 10.0, // Space between rows
                          children: List.generate(services.length, (index) {
                            return IntrinsicWidth(
                              child: GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.appBlue.withOpacity(.08),
                                      border: Border.all(
                                          color: AppColors.appTransparent,
                                          width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40))),
                                  child: Center(
                                    child: Text(
                                      services[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: AppColors.appBlack),
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
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 320,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Location',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: AppColors.lightText,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      Image.asset(
                        AppImages.mapPng,
                        height: 137,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  color: AppColors.appBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Get directions',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.appGreen),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.appGreen,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 183,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '₦1,000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ground',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '₦1,000',
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Services',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '₦2,000',
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fee',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '₦1,00',
                            style: Theme.of(context).textTheme.headline3,
                          )
                        ],
                      ),
                      DottedHorizontalRuleWidget(
                        color: AppColors.appBlack.withOpacity(.3),
                        dotSize: 2,
                        spacing: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appBlack),
                          ),
                          Text(
                            '₦1,000',
                            style: Theme.of(context).textTheme.headline1,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    buttonHeight: 53,
                    pressedFunction: () =>
                        Navigator.of(context).pushNamed(AppRoutes.signInScreen),
                    buttonColor: AppColors.appGreen,
                    textColor: AppColors.appWhite,
                    buttonText: 'Download ticket',
                    buttonRadius: 10,
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    buttonHeight: 37,
                    pressedFunction: () {},
                    buttonColor: AppColors.appYellow.withOpacity(.07),
                    textColor: AppColors.appBlack,
                    buttonText: 'Show these details at the arena',
                    buttonRadius: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              top: 100,
              left: width * .02,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                height: 142,
                // width: width,
                width: width * .96,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.primaryBackgroundColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: AppColors.appWhite),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arena',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Estate football Court',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appBlack),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          'Reserved date',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '14 February 2024',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appBlack),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 88,
                          height: 33,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.appYellow.withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'Upcoming',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColors.appYellow),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          'Reserved time',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '08:30 am - 10:30 am',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appBlack),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.appWhite,
                        size: 16,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Booking details',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
