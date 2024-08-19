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

class EditPasswordScreen extends ConsumerStatefulWidget {
  const EditPasswordScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPasswordScreenState();
}

class _EditPasswordScreenState extends ConsumerState<EditPasswordScreen> {
  String pin = "";

  TextEditingController pinController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int sec = ref.watch(secProvider);
    final inputError = ref.watch(inputErrorProvider);
    final pinObscure = ref.watch(pinInputCompleteProvider);
    final buttonActive = ref.watch(buttonProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final notification = ref.watch(notificationPopProvider);

    // Size size = MediaQuery.of(context).size;

    showModalBottom() {
      return showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (ctx) {
            return Container(
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
                          width: width * .11,
                          height: height * .055,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                      style:
                          TextStyle(color: AppColors.appBlack.withOpacity(.5)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'bashiruonuche@hotmail.com',
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
                      style:
                          TextStyle(color: AppColors.appBlack.withOpacity(.5)),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "Password Change",
          style: TextStyle(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
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
                    text: 'Incorrect Password',
                  )
                : const SizedBox(),
            SizedBox(
              height: height * .05,
            ),
            AppInput(
                textEditingController: oldPasswordController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : GestureDetector(
                        onTap: () {
                          log('trying to change the obscure = $pinObscure');
                          ref.read(pinInputCompleteProvider.notifier).state =
                              !pinObscure;
                        },
                        child: pinObscure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                isError: inputError,
                type: Constants.passwordFieldType,
                icon: Image.asset(AppImages.lockIconPng),
                hintText: "Enter your old password",
                errorText: "Please enter your old password",
                width: width,
                label: "Old Password",
                height: height),
            AppInput(
                textEditingController: passwordController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : GestureDetector(
                        onTap: () {
                          log('trying to change the obscure = $pinObscure');
                          ref.read(pinInputCompleteProvider.notifier).state =
                              !pinObscure;
                        },
                        child: pinObscure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                isError: inputError,
                type: Constants.passwordFieldType,
                icon: Image.asset(AppImages.lockIconPng),
                hintText: "Enter your new password",
                errorText: "Please enter your new password",
                width: width,
                label: "New Password",
                height: height),
            AppInput(
                textEditingController: passwordControllerB,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : GestureDetector(
                        onTap: () {
                          log('trying to change the obscure = $pinObscure');
                          ref.read(pinInputCompleteProvider.notifier).state =
                              !pinObscure;
                        },
                        child: pinObscure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                isError: inputError,
                type: Constants.passwordFieldType,
                icon: Image.asset(AppImages.lockIconPng),
                hintText: "Confirm your new password",
                errorText: "Please enter your password",
                width: width,
                label: "Confirm New Password",
                height: height),
            SizedBox(
              height: height * .3,
            ),
            Divider(
              color: AppColors.appBlack.withOpacity((.4)),
              height: 3,
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                borderColor: AppColors.appBlack.withOpacity(.3),
                pressedFunction: (passwordController.text.isNotEmpty &&
                            passwordControllerB.text.isNotEmpty) &&
                        buttonActive
                    ? () => showModalBottom()
                    : () {},
                buttonColor: (passwordControllerB.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) &&
                        buttonActive
                    ? AppColors.appGreen
                    : AppColors.appWhite.withOpacity(.3),
                buttonText: 'Save Password',
                buttonRadius: 10,
                textColor: (passwordControllerB.text.isNotEmpty &&
                        passwordController.text.isNotEmpty)
                    ? AppColors.appWhite
                    : AppColors.primaryBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
