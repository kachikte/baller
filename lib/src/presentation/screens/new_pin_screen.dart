import 'dart:async';
import 'dart:developer';

import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class NewPinScreen extends ConsumerStatefulWidget {
  const NewPinScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPinScreenState();
}

class _NewPinScreenState extends ConsumerState<NewPinScreen> {
  String pin = "";

  @override
  Widget build(BuildContext context) {
    int sec = ref.watch(secProvider);

    TextEditingController pinController = TextEditingController();

    final pinLength = ref.watch(pinLengthProvider);
    final pinState = ref.watch(pinStateProvider);
    final pinNum = ref.watch(pinProvider);
    final isProfileEdit = ref.watch(isPinEditProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final notification = ref.watch(notificationPopProvider);

    double pinSpace = 7;
    Size size = MediaQuery.of(context).size;

    void removeDigitPin() {
      if (pin.isEmpty) {
        return;
      }
      pin = pin.substring(0, pin.length - 1);
      ref.read(pinLengthProvider.notifier).state = pin.length;
      log('Removed pin - $pin');
    }

    showModalBottom() {
      return showModalBottomSheet(
          showDragHandle: true,
          isDismissible: true,
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
              height: AppHelperFunctions.dimensionHeight(height, 567),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  notification
                      ? AppNotificationPop(
                          width: width,
                          height: height * .06,
                          backgroundColor: AppColors.appRed,
                          prefixIcon: Icon(
                            Icons.info_outline,
                            color: AppColors.appWhite,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(notificationPopProvider.notifier).state =
                                  false;
                            },
                            icon: const Icon(Icons.close),
                            color: AppColors.appWhite,
                          ),
                          text: 'Incorrect OTP',
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: AppKeyContainer(
                          radius: 15.24,
                          width: 48,
                          height: 48,
                          color: AppColors.appYellow,
                          widget: Image.asset(AppImages.ballersVerify)),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Verify Account',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Provide the code sent your email',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'bashiruonuche@hotmail.com',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Center(
                    child: Pinput(
                      length: 6,
                      controller: pinController,
                      onCompleted: (pin) => log(pin),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Resend in ${sec}sec',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          });
    }

    setup() async {
      ref.read(notificationPopProvider.notifier).state = false;

      if (pinState == 0) {
        ref.read(pinStateProvider.notifier).state += 1;
        ref.read(pinProvider.notifier).state = pin;
        pin = '';
        ref.read(pinLengthProvider.notifier).state = 0;
        return;
      }

      if (pinNum == pin) {
        ref.read(resetPinProvider(pin).future).then((value) {
          if (value.isError) {
            ref.read(notificationPopProvider.notifier).state = true;
            pin = '';
            ref.read(pinLengthProvider.notifier).state = 0;
            ref.read(pinProvider.notifier).state = '';
            log('This is the pin reset data error - $value}');
          } else {
            log('This is the pin reset signed data - ${value.data}}');
            ref.read(pinLengthProvider.notifier).state = 0;
            ref.read(pinStateProvider.notifier).state = 0;
            ref.read(pinProvider.notifier).state = "";
            if (isProfileEdit) {
              showModalBottom();
            } else {
              Navigator.pushNamed(context, AppRoutes.signInScreen);
            }
          }
        }).catchError((err) {
          log('This is the error of the pin reset in - $err');
          ref.read(notificationPopProvider.notifier).state = true;
          pin = '';
          ref.read(pinLengthProvider.notifier).state = 0;
          ref.read(pinProvider.notifier).state = '';
        });
      } else {
        pin = '';
        ref.read(notificationPopProvider.notifier).state = true;
        ref.read(pinStateProvider.notifier).state = 0;
        ref.read(pinLengthProvider.notifier).state = 0;
        ref.read(pinProvider.notifier).state = '';
      }
    }

    logout() async {
      ref.read(pinLengthProvider.notifier).state = 0;
      Navigator.pushNamed(context, AppRoutes.signInScreen);
    }

    insertPin(String number) {
      if (pin.length >= 4) {
        return;
      }
      log('This is the pin $pin');
      log('This is the number $number');

      pin += number;
      ref.read(pinLengthProvider.notifier).state = pin.length;
      log('Number showing = $pin');
    }

    Timer? timer;

    void startTimer() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        int sec = ref.read(secProvider);
        if (sec > 0) {
          ref.read(secProvider.notifier).state = sec - 1;

          if (pinController.text.length >= 6) {
            timer.cancel();
            ref.read(secProvider.notifier).state = 30;
            ref.read(resetOtpProvider(pinController.text).future).then((value) {
              log('The successful otp  ${value.data}');
              if (isProfileEdit) {
                ref.read(isPinEditProvider.notifier).state = false;
                Navigator.pushNamed(context, AppRoutes.editPinIntroScreen);
              } else {
                Navigator.pushNamed(context, AppRoutes.newPasswordScreen);
              }
            }).catchError((err) {
              log('The error otp  $err');
              pinController.clear();
              startTimer();
            });
          }
        } else {
          ref.read(secProvider.notifier).state = 30;
          log('Pin completed');
          timer.cancel();
          if (pinController.text.isEmpty) {
            log('Empty pin');
            startTimer();
          } else {
            ref.read(resetOtpProvider(pinController.text).future).then((value) {
              log('The successful otp  ${value.data}');
              Navigator.pushNamed(context, AppRoutes.newPasswordScreen);
            }).catchError((err) {
              log('The error otp  $err');
              pinController.clear();
              startTimer();
            });
          }
        }
      });
    }

    @override
    void initState() {
      startTimer();
      // TODO: implement initState
      super.initState();
    }

    @override
    void dispose() {
      timer?.cancel();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          isProfileEdit ? "PIN" : "Forgot PIN",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          notification
              ? AppNotificationPop(
                  width: width,
                  height: height * .06,
                  backgroundColor: AppColors.appRed,
                  prefixIcon: Icon(
                    Icons.info_outline,
                    color: AppColors.appWhite,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(notificationPopProvider.notifier).state = false;
                    },
                    icon: const Icon(Icons.close),
                    color: AppColors.appWhite,
                  ),
                  text: 'Incorrect PIN',
                )
              : const SizedBox(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: AppKeyContainer(
                width: 48,
                height: 48,
                radius: 15.24,
                color: AppColors.appGreen,
                widget: Image.asset(AppImages.keyPng)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              pinState == 0 ? 'Reset PIN' : 'Confirm New PIN',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Reset PIN to secure your account!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: pinSpace,
                  backgroundColor: pinLength >= 1
                      ? AppColors.appRed
                      : AppColors.primaryBackgroundColor,
                ),
                SizedBox(
                  width: pinSpace,
                ),
                CircleAvatar(
                  radius: pinSpace,
                  backgroundColor: pinLength >= 2
                      ? AppColors.appRed
                      : AppColors.primaryBackgroundColor,
                ),
                SizedBox(
                  width: pinSpace,
                ),
                CircleAvatar(
                  radius: pinSpace,
                  backgroundColor: pinLength >= 3
                      ? AppColors.appRed
                      : AppColors.primaryBackgroundColor,
                ),
                SizedBox(
                  width: pinSpace,
                ),
                CircleAvatar(
                  radius: pinSpace,
                  backgroundColor: pinLength >= 4
                      ? AppColors.appRed
                      : AppColors.primaryBackgroundColor,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppPinNumberWidget(
                  func: () => insertPin("1"),
                  number: "1",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("2"),
                  number: "2",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("3"),
                  number: "3",
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppPinNumberWidget(
                  func: () => insertPin("4"),
                  number: "4",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("5"),
                  number: "5",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("6"),
                  number: "6",
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppPinNumberWidget(
                  func: () => insertPin("7"),
                  number: "7",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("8"),
                  number: "8",
                ),
                AppPinNumberWidget(
                  func: () => insertPin("9"),
                  number: "9",
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppPinNumberWidget(func: () {}, number: "", textSize: 12),
                AppPinNumberWidget(
                  func: () => insertPin("0"),
                  number: "0",
                ),
                GestureDetector(
                    onTap: removeDigitPin,
                    child: const Icon(Icons.backspace_outlined))
              ],
            ),
          ),
          const Divider(
            height: 3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: AppButton(
              buttonHeight: 53,
              borderColor: AppColors.appBlack.withOpacity(.1),
              pressedFunction: (pin.length >= 4) ? setup : () {},
              buttonColor: AppColors.appTransparent,
              buttonText: pinState == 0 ? 'Proceed' : 'Set-up PIN',
              buttonRadius: 10,
              textColor: AppColors.appBlack,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
