import 'dart:developer';

import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: AppHelperFunctions.dimensionHeight(height, 254),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    image: const DecorationImage(
                      image: AssetImage(AppImages.darkBackgroundJpg),
                      fit: BoxFit
                          .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppHelperFunctions.dimensionWidth(width, 16)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  height: 164,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your metrics',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            // width: AppHelperFunctions.dimensionWidth(width, 85),
                            child: Text(
                              'Most played sport',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Text(
                            'Football',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height:
                                AppHelperFunctions.dimensionHeight(height, 16),
                          ),
                          SizedBox(
                            width: 167.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Games played',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  'Minutes played',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 167.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '20',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    '14,520',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.appBlue),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          // width: AppHelperFunctions.dimensionWidth(width, 126),
                          height:
                              AppHelperFunctions.dimensionHeight(height, 126),
                          child: Image.asset(
                            AppImages.ballersProfJpg,
                            width: 126,
                            height: 126,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  height: 129,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Transactions',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColors.lightText),
                      ),
                      Container(
                        width: width,
                        height: 68,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.ballersWallet,
                              width: 24,
                              height: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment history',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  'View all transactions linked to bookings.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 32,
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
                //===========
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  width: width,
                  height: 205,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Security',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColors.lightText),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.editPasswordScreen),
                          child: Container(
                            width: width,
                            height: 68,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackgroundColor
                                    .withOpacity(.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppImages.lockIconPng,
                                  width: 24,
                                  height: 24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Password change',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      'Change your password to secure account.',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 32,
                                  color: AppColors.appBlack.withOpacity(.4),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRoutes.editPinIntroScreen),
                          child: Container(
                            width: width,
                            height: 68,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackgroundColor
                                    .withOpacity(.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppImages.ballersPin,
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(
                                  width: width * .6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'PIN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Text(
                                        'Setup or Change PIN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 32,
                                  color: AppColors.appBlack.withOpacity(.4),
                                )
                              ],
                            ),
                          )),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    height: 129,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Notifications & Alerts',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.lightText),
                        ),
                        Container(
                          width: width,
                          height: 68,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppImages.notificationsPng,
                                width: 24,
                                height: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Notification settings',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'Make changes to notification settings.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 32,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    height: 129,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Privacy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.lightText),
                        ),
                        Container(
                          width: width,
                          height: 68,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppImages.ballersPrivacy,
                                width: 24,
                                height: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Privacy settings',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'View and make changes to privacy settings',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 32,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  width: width,
                  height: 205,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.appBlack.withOpacity(.2), width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Help & App',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColors.lightText),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.editPasswordScreen),
                          child: Container(
                            width: width,
                            height: 68,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackgroundColor
                                    .withOpacity(.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppImages.ballersSupport,
                                  width: 24,
                                  height: 24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Help & support',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Text(
                                      'Get help from our support team.',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 32,
                                  color: AppColors.appBlack.withOpacity(.4),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRoutes.editPinIntroScreen),
                          child: Container(
                            width: width,
                            height: 68,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackgroundColor
                                    .withOpacity(.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppImages.ballersMore,
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(
                                  width: width * .6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'About app',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Text(
                                        'More about the ballers app',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 32,
                                  color: AppColors.appBlack.withOpacity(.4),
                                )
                              ],
                            ),
                          )),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    height: 129,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Legal',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: AppColors.lightText),
                        ),
                        Container(
                          width: width,
                          height: 68,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppImages.ballersLegal,
                                width: 24,
                                height: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Legal & terms',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'Up-to-date legal terms and agreements',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 32,
                                color: AppColors.appBlack.withOpacity(.4),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    buttonHeight: 48,
                    pressedFunction: () =>
                        Navigator.of(context).pushNamed(AppRoutes.signInScreen),
                    buttonColor: AppColors.appRed.withOpacity(.1),
                    textColor: AppColors.appRed,
                    buttonText: 'Log out',
                    buttonRadius: 10,
                    buttonIcon: Image.asset(AppImages.ballersLogout),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    buttonHeight: 48,
                    pressedFunction: () {},
                    buttonColor: AppColors.appTransparent,
                    textColor: AppColors.appBlack,
                    buttonText: '©2024 V1.0',
                    buttonRadius: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              top: AppHelperFunctions.dimensionHeight(height, 158),
              left: AppHelperFunctions.dimensionWidth(width, 16),
              right: AppHelperFunctions.dimensionWidth(width, 16),
              child: Container(
                height: 192,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: AppHelperFunctions.dimensionWidth(width, 396),
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
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'bashiruonuche@hotmail.com',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      width: width * .45,
                      child: AppButton(
                          buttonHeight: 32,
                          buttonIcon: Image.asset(AppImages.ballersEdit),
                          borderColor: AppColors.primaryBackgroundColor,
                          pressedFunction: () => Navigator.pushNamed(
                              context, AppRoutes.editProfileScreen),
                          buttonColor: AppColors.appWhite,
                          buttonRadius: 16,
                          buttonText: 'Edit'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.appWhite,
                        size: 16,
                      )),
                  Text(
                    'My profile',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
