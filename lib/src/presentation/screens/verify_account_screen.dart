import 'dart:async';
import 'dart:developer';

import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class VerifyAccountScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> val;

  const VerifyAccountScreen({required this.val});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends ConsumerState<VerifyAccountScreen> {
  String pin = "";

  TextEditingController pinController = TextEditingController();

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
            Navigator.pushNamed(context, AppRoutes.newPasswordScreen);
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

  @override
  Widget build(BuildContext context) {
    int sec = ref.watch(secProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final notification = ref.watch(notificationPopProvider);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          widget.val['type'] == Constants.forgotScreen
              ? "Forgot Password"
              : 'Verify Account',
          style: TextStyle(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: Container(
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
                    width: size.width * .11,
                    height: size.height * .055,
                    color: AppColors.appYellow,
                    widget: Image.asset(AppImages.ballersVerify)),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Verify Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                style: TextStyle(color: AppColors.appBlack.withOpacity(.5)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.val['email'],
                textAlign: TextAlign.center,
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
                style: TextStyle(color: AppColors.appBlack.withOpacity(.5)),
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
      ),
    );
  }
}
