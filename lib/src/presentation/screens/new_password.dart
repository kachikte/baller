import 'dart:developer';

import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPasswordScreen extends ConsumerStatefulWidget {
  const NewPasswordScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewPasswordScreenState();
}

class _NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
  String pin = "";

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerB = TextEditingController();

  Future<void> changePassword(data) async {
    ref.read(notificationPopProvider.notifier).state = false;
    ref.read(inputErrorProvider.notifier).state = false;
    ref.read(buttonProvider.notifier).state = false;

    if (passwordControllerB.text != passwordController.text) {
      ref.read(notificationPopProvider.notifier).state = true;
      ref.read(inputErrorProvider.notifier).state = true;
      ref.read(buttonProvider.notifier).state = true;
      return;
    }

    ref.read(newPasswordProvider(data).future).then((value) {
      if (value.isError) {
        ref.read(notificationPopProvider.notifier).state = true;
        ref.read(inputErrorProvider.notifier).state = true;
        log('This is the change password in data error - $value}');
        ref.read(buttonProvider.notifier).state = true;
      } else {
        log('This is the change password in data - $value}');
        ref.read(buttonProvider.notifier).state = true;
        ref.read(passwordCreatedProvider.notifier).state = true;
        Navigator.pushNamed(context, AppRoutes.signInScreen);
      }
    }).catchError((err) {
      log('This is the error of the sign in - $err');
      ref.read(notificationPopProvider.notifier).state = true;
      ref.read(inputErrorProvider.notifier).state = true;
      ref.read(buttonProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputError = ref.watch(inputErrorProvider);
    final pinObscure = ref.watch(pinInputCompleteProvider);
    final buttonActive = ref.watch(buttonProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final notification = ref.watch(notificationPopProvider);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "Forgot Password",
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
              height: height * .02,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: AppKeyContainer(
                    width: size.width * .11,
                    height: size.height * .055,
                    color: AppColors.appBlue,
                    widget: Image.asset(AppImages.ballersLock)),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Create New Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Enter your new password below',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.appBlack.withOpacity(.5)),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
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
                hintText: "Enter your password",
                errorText: "Please enter your password",
                width: width,
                label: "Password",
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
                hintText: "Confirm password",
                errorText: "Please enter your password",
                width: width,
                label: "Confirm Password",
                height: height),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                pressedFunction: (passwordController.text.isNotEmpty &&
                            passwordControllerB.text.isNotEmpty) &&
                        buttonActive
                    ? () => changePassword(passwordController.text)
                    : () {},
                buttonColor: (passwordControllerB.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) &&
                        buttonActive
                    ? AppColors.appGreen
                    : AppColors.primaryBackgroundColor.withOpacity(.3),
                buttonText: 'Submit',
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
