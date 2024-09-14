import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  navigateToSuccessful() {
    Navigator.pushNamed(context, AppRoutes.transactionSuccessfulScreen);
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
              height: 282,
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
                                'Make Transfer',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: AppColors.appBlack),
                              ),
                              Text(
                                'SMake transfer to details below',
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
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: width * .45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bank name',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  'Access Bank',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColors.appBlack),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: width * .45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account name',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  'Ballers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColors.appBlack),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: width * .45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account number',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  '5467546897',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColors.appBlack),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            AppImages.copyPng,
                            height: 24,
                            width: 24,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.appBlack.withOpacity((.4)),
                      height: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AppButton(
                          buttonHeight: 53,
                          buttonRadius: 10,
                          pressedFunction: () => navigateToSuccessful(),
                          buttonColor: AppColors.appBlack,
                          textColor: AppColors.appWhite,
                          buttonText: 'I’ve paid'),
                    )
                  ],
                ),
              ),
            );
          });
    }

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
                Icons.arrow_back_ios_rounded,
                color: AppColors.appBlack,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Payment",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColors.appBlack),
            ),
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
              height: height * .75,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 270,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          Container(
                            height: 133,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.appYellow.withOpacity(.03),
                                border: Border.all(
                                    color: AppColors.appYellow.withOpacity(.3),
                                    width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      'Ground',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      'Services',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      'Fee',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₦1,000',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    Text(
                                      '₦1,000',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      '₦2,000',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      '₦100',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            // height: height * .1,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '% Discount code',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColors.appBlack),
                                ),
                                SizedBox(
                                  // width: 92,
                                  child: AppButton(
                                      buttonRadius: 16,
                                      buttonHeight: 37,
                                      pressedFunction: () {},
                                      buttonColor: AppColors.appBlack,
                                      textColor: AppColors.appWhite,
                                      buttonText: 'Apply'),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Container(
                            // height: height * .1,
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColors.appBlack),
                                ),
                                Text(
                                  '₦1,000',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      height: height * .04,
                      child: Text(
                        'Payment options',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .03),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      height: 68,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.debitPng,
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Debit Card',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'Make payment with debit card',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .03),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      height: 68,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.transferPng,
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make Transfer',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'Transfer to an account provided',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.arrow_forward_ios)
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.primaryBackgroundColor, width: .5))),
              child: AppButton(
                  buttonHeight: 53,
                  buttonRadius: 10,
                  borderColor: AppColors.primaryBackgroundColor.withOpacity(.3),
                  pressedFunction: () => showModalBottom(),
                  buttonColor: AppColors.appWhite,
                  buttonText: 'Cancel payment'),
            )
          ],
        ),
      ),
    );
  }
}
