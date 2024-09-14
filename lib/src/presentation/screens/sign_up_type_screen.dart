import 'dart:developer';

import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpTypeScreen extends ConsumerWidget {
  const SignUpTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String isIndividualAccount = ref.watch(isIndividualAccountTypeProvider);
    final buttonActive = ref.watch(buttonProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    signUp() async {
      Navigator.pushNamed(context, AppRoutes.signUpScreen);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "Create An Account",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                "Choose your account type",
                style: TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'The type of account you want to operate.',
                  style: TextStyle(color: AppColors.appBlack.withOpacity(.4)),
                )),
            SizedBox(
              height: height * .05,
            ),
            AccountTypeWidget(
                imagePath: AppImages.exploreJpgOne,
                isActive: isIndividualAccount == Constants.personalAccount,
                func: () {
                  log('this is the personal');
                  ref.read(isIndividualAccountTypeProvider.notifier).state =
                      Constants.personalAccount;
                },
                title: Constants.personalAccount,
                body:
                    'You love to play with friends and colleagues 😃 or by yourself😢 '),
            const SizedBox(
              height: 25,
            ),
            AccountTypeWidget(
                imagePath: AppImages.ballersStadium,
                isActive: isIndividualAccount == Constants.businessAccount,
                func: () {
                  log('this is the business');
                  ref.read(isIndividualAccountTypeProvider.notifier).state =
                      Constants.businessAccount;
                },
                title: Constants.businessAccount,
                body:
                    'You own an arena and you love making money hassle free 😃'),
            SizedBox(
              height: height * .05,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                pressedFunction: isIndividualAccount != '' && buttonActive
                    ? () => signUp()
                    : () {},
                buttonColor: isIndividualAccount != '' && buttonActive
                    ? AppColors.appGreen
                    : AppColors.primaryBackgroundColor.withOpacity(.3),
                buttonText: 'Proceed',
                buttonRadius: 10,
                textColor: isIndividualAccount != ''
                    ? AppColors.appWhite
                    : AppColors.primaryBackgroundColor,
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
          ],
        ),
      ),
    );
  }
}
