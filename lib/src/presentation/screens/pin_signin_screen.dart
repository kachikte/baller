import 'dart:developer';

import 'package:baller/src/config/config.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/providers/api/api.dart';
import 'package:baller/src/presentation/providers/data/data.dart';
import 'package:baller/src/presentation/providers/input_provider.dart';
import 'package:baller/src/presentation/providers/pin_input_provider.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinSigninScreen extends ConsumerStatefulWidget {
  const PinSigninScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PinSigninScreenState();
}

class _PinSigninScreenState extends ConsumerState<PinSigninScreen> {
  String pin = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final pinLength = ref.watch(pinLengthProvider);
    final user = ref.watch(userProvider);
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

    logout() async {
      ref.read(pinLengthProvider.notifier).state = 0;
      Navigator.pushNamed(context, AppRoutes.signInScreen);
    }

    forgotCode() async {
      ref.read(pinLengthProvider.notifier).state = 0;
      Navigator.pushNamed(context, AppRoutes.newPinScreen);
    }

    insertPin(String number) {
      ref.read(notificationPopProvider.notifier).state = false;

      pin += number;
      ref.read(pinLengthProvider.notifier).state = pin.length;
      log('Number showing = $pin');

      log('Pin length -${pin.length}');
      log('Pin after length -$pin');

      if (pin.length == 4) {
        log('Pin entering -$pin');
        ref.read(pinSignInProvider(pin).future).then((value) {
          if (value.isError) {
            ref.read(notificationPopProvider.notifier).state = true;
            pin = '';
            ref.read(pinLengthProvider.notifier).state = 0;
            ref.read(pinProvider.notifier).state = '';
            log('This is the pin signed in data error - $value}');
          } else {
            log('This is the pin signed in data - $value}');
            LoginModel loginModel = value.data;
            UserModel userModel = UserModel(
                firstName: loginModel.firstName,
                lastName: loginModel.lastName,
                email: loginModel.email);
            ref.read(userProvider.notifier).setUser(userModel);
            ref.read(pinLengthProvider.notifier).state = 0;
            ref.read(pinStateProvider.notifier).state = 0;
            ref.read(pinProvider.notifier).state = "";
            Navigator.pushNamed(context, AppRoutes.landingScreen);
          }
        }).catchError((err) {
          log('This is the error of the pin sign in - $err');
          ref.read(notificationPopProvider.notifier).state = true;
          pin = '';
          ref.read(pinLengthProvider.notifier).state = 0;
          ref.read(pinProvider.notifier).state = '';
        });
      }
      if (pin.length > 4) {
        return;
      }
      log('This is the pin $pin');
      log('This is the number $number');
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              child: Image.asset(AppImages.logo)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.appBlack,
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(AppImages.profileImagePng),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${user?.lastName} ${user?.firstName}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'Enter PIN below',
              textAlign: TextAlign.center,
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
                AppPinNumberWidget(
                    func: forgotCode, number: "Forgot\nCode?", textSize: 12),
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
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child:
                  GestureDetector(onTap: logout, child: const Text('Sign Out')))
        ],
      ),
    );
  }
}
