import 'dart:developer';

import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/presentation/widgets/app_input.dart';
import 'package:baller/src/presentation/widgets/app_notification_pop.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> resetPasswordMail(data) async {
    ref.read(notificationPopProvider.notifier).state = false;
    ref.read(inputErrorProvider.notifier).state = false;
    ref.read(buttonProvider.notifier).state = false;
    ref.read(resetPasswordMailProvider(data).future).then((value) {
      if (value.isError) {
        ref.read(notificationPopProvider.notifier).state = true;
        ref.read(inputErrorProvider.notifier).state = true;
        log('This is the reset password mail in data error - $value}');
        ref.read(buttonProvider.notifier).state = true;
      } else {
        log('This is the reset password mail data - $value}');
        ref.read(buttonProvider.notifier).state = true;
        Navigator.pushNamed(context, AppRoutes.verifyAccountScreen, arguments: {'email': emailController.text, 'type': Constants.forgotScreen});
      }
    }).catchError((err) {
      log('This is the error of the reset password mail - $err');
      ref.read(notificationPopProvider.notifier).state = true;
      ref.read(inputErrorProvider.notifier).state = true;
      ref.read(buttonProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final buttonActive = ref.watch(buttonProvider);
    final inputError = ref.watch(inputErrorProvider);
    final notification = ref.watch(notificationPopProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            inputError && notification
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
              text: 'Wrong email',
            )
                : const SizedBox(),
            SizedBox(
              height: height * .035,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(AppImages.logo)),
            SizedBox(
              height: height * .015,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Reset Password",
                style: TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Enter details below',
                  style: TextStyle(color: AppColors.appBlack.withOpacity(.4)),
                )),
            SizedBox(
              height: height * .035,
            ),
            AppInput(
                textEditingController: emailController,
                suffixIcon: inputError
                    ? Icon(
                  Icons.info_outline,
                  color: AppColors.appRed,
                )
                    : const SizedBox(),
                isError: inputError,
                icon: Image.asset(AppImages.mailIconPng),
                hintText: "Enter your email address",
                errorText: "Please enter your username",
                width: width,
                label: "Email Address",
                height: height),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                pressedFunction: emailController.text.isNotEmpty && buttonActive
                    ? () => resetPasswordMail(emailController.text)
                    : () {},
                buttonColor: emailController.text.isNotEmpty && buttonActive
                    ? AppColors.appGreen
                    : AppColors.primaryBackgroundColor.withOpacity(.3),
                buttonText: 'Submit',
                buttonRadius: 10,
                textColor: emailController.text.isNotEmpty
                    ? AppColors.appWhite
                    : AppColors.primaryBackgroundColor,
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                  text: TextSpan(
                      text: "Remember your details? ",
                      style: TextStyle(color: AppColors.appBlack),
                      children: [
                    TextSpan(
                        text: "Sign In!",
                        style: TextStyle(color: AppColors.appGreen)),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
