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
              height: height * .42,
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make Transfer',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                              Text(
                                'Make transfer to details below',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              )
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.primaryBackgroundColor
                                .withOpacity(.1),
                            radius: 14,
                            child: Icon(
                              size: 14,
                              Icons.close,
                              color: AppColors.appBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                                  style: TextStyle(
                                      color:
                                          AppColors.appBlack.withOpacity(.4)),
                                ),
                                const Text(
                                  'Access Bank',
                                  style: TextStyle(fontSize: 17),
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
                                  style: TextStyle(
                                      color:
                                          AppColors.appBlack.withOpacity(.4)),
                                ),
                                const Text(
                                  'Ballers',
                                  style: TextStyle(fontSize: 17),
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
                                  style: TextStyle(
                                      color:
                                          AppColors.appBlack.withOpacity(.4)),
                                ),
                                const Text(
                                  '5467546897',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(AppImages.copyPng)
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
                          horizontal: 10, vertical: 20),
                      child: AppButton(
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
            Text("Payment",
                style: TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 17)),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height * .35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          Container(
                            height: height * .15,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.appYellow.withOpacity(.03),
                                border: Border.all(
                                    color: AppColors.appYellow.withOpacity(.3),
                                    width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Subtotal'),
                                    Text('Ground'),
                                    Text('Services'),
                                    Text('Fee')
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('₦1,000'),
                                    Text('₦1,000'),
                                    Text('₦2,000'),
                                    Text('₦100')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            // height: height * .1,
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('% Discount code'),
                                SizedBox(
                                  width: width * .3,
                                  child: AppButton(
                                      buttonRadius: 30,
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total'),
                                const Text('₦1,000'),
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
                      child: const Text(
                        'Payment options',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .03),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      height: height * .1,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppImages.debitPng),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Debit Card',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Make payment with debit card',
                                style: TextStyle(
                                  color: AppColors.appBlack.withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
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
                          horizontal: 15, vertical: 20),
                      height: height * .1,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appBlack.withOpacity(.2),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppImages.transferPng),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make Transfer',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Transfer to an account provided',
                                style: TextStyle(
                                  color: AppColors.appBlack.withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
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
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.primaryBackgroundColor, width: .5))),
              child: AppButton(
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
