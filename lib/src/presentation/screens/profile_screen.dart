import 'dart:developer';

import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
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
        Navigator.pushNamed(context, AppRoutes.verifyAccountScreen, arguments: {
          'email': emailController.text,
          'type': Constants.forgotScreen
        });
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * .3,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    // borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.basketBallCourtJpg),
                      fit: BoxFit
                          .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  // padding: EdgeInsets.symmetric(
                  //     vertical: height * .02, horizontal: width * .03),
                  height: height * .18,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Your metrics',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: width * .7,
                                child: const Text(
                                  'Most played sport',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: width * .7,
                                child: const Text(
                                  'Football',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: width * .65,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * .27,
                                    child: const Text(
                                      'Games played',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .27,
                                    child: const Text(
                                      'Minutes played',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width * .65,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * .27,
                                    child: const Text(
                                      '20',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .27,
                                    child: Text(
                                      '14,520',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: AppColors.appBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          width: width * .3,
                          child: Image.asset(AppImages.ballersProf))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  // padding: EdgeInsets.symmetric(
                  //     vertical: height * .02, horizontal: width * .03),
                  height: height * .18,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.appBlack.withOpacity(.5),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * .1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppImages.ballersWallet),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment history',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'View all transactions linked to bookings.',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: AppColors.appBlack.withOpacity(.4),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  // padding: EdgeInsets.symmetric(
                  //     vertical: height * .02, horizontal: width * .03),
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Security',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.appBlack.withOpacity(.5),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.editPasswordScreen),
                        child: Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.lockIconPng),
                              SizedBox(
                                width: width * .55,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Password change',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Change your password to secure account.',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRoutes.editPinIntroScreen),
                        child: Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.ballersPin),
                              SizedBox(
                                width: width * .55,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PIN',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Setup or Change PIN',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.notificationSettingScreen),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .03),
                    // padding: EdgeInsets.symmetric(
                    //     vertical: height * .02, horizontal: width * .03),
                    height: height * .18,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Notifications & Alerts',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBlack.withOpacity(.5),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.notificationsPng),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Notification settings',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Make changes to notification settings.',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.privacySettingsScreen),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .03),
                    // padding: EdgeInsets.symmetric(
                    //     vertical: height * .02, horizontal: width * .03),
                    height: height * .18,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Privacy',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBlack.withOpacity(.5),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.ballersPrivacy),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Privacy settings',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'View and make changes to privacy settings',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  // padding: EdgeInsets.symmetric(
                  //     vertical: height * .02, horizontal: width * .03),
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Help & App',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.appBlack.withOpacity(.5),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.editPasswordScreen),
                        child: Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.ballersSupport),
                              SizedBox(
                                width: width * .55,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Help & support',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Get help from our support team.',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: width,
                        height: height * .1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppImages.ballersMore),
                            SizedBox(
                              width: width * .55,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'About app',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'More about the ballers app',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: AppColors.appBlack.withOpacity(.4),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.notificationSettingScreen),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .03),
                    // padding: EdgeInsets.symmetric(
                    //     vertical: height * .02, horizontal: width * .03),
                    height: height * .18,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Legal',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBlack.withOpacity(.5),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * .1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.ballersLegal),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Legal & terms',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Up-to-date legal terms and agreements',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    pressedFunction: () =>
                        Navigator.of(context).pushNamed(AppRoutes.signInScreen),
                    buttonColor: AppColors.appRed.withOpacity(.1),
                    textColor: AppColors.appRed,
                    buttonText: 'Log out',
                    buttonRadius: 10,
                    borderColor: AppColors.appRed.withOpacity(.1),
                    buttonIcon: Image.asset(AppImages.ballersLogout),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              top: height * .2,
              left: 0,
              child: Container(
                height: height * .27,
                margin: EdgeInsets.symmetric(horizontal: width * .03),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: width * .95,
                decoration: BoxDecoration(
                    color: AppColors.appWhite,
                    border: Border.all(
                        color: AppColors.appBlack.withOpacity(.2), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.appBlack,
                      radius: 20,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(AppImages.profileImagePng),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Bashiru Okala',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.appBlack,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'bashiruonuche@hotmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.appBlack.withOpacity(.5),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .45,
                      child: AppButton(
                          buttonIcon: Image.asset(AppImages.ballersEdit),
                          borderColor: AppColors.primaryBackgroundColor,
                          pressedFunction: () => Navigator.pushNamed(
                              context, AppRoutes.editProfileScreen),
                          buttonColor: AppColors.appWhite,
                          buttonText: 'Edit'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 10,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios_rounded)),
            )
          ],
        ),
      ),
    );
  }
}
