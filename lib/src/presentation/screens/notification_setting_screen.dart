import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettingScreen extends ConsumerStatefulWidget {
  const NotificationSettingScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState
    extends ConsumerState<NotificationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final isSwitchOn = ref.watch(switchOnProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "Notification settings",
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: width,
              height: 209,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.appBlack),
                  ),
                  Container(
                    width: width,
                    height: 145,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor.withOpacity(.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Booking confirmations',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Receive notifications when a booking is successfully confirmed.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Booking reminders',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Get reminders about upcoming bookings.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: width,
              height: 209,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events and special offers',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.appBlack),
                  ),
                  Container(
                    width: width,
                    height: 145,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor.withOpacity(.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Event updates',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Stay informed about any changes or updates to upcoming events.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Special offers & promotions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Receive notifications about exclusive deals, discounts, and promotions.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: width,
              height: 209,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Arena',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.appBlack),
                  ),
                  Container(
                    width: width,
                    height: 145,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor.withOpacity(.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'New arenas',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Get notified when new arenas.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Arena availability',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Get notified when fields you have in favourites become available.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: width,
              height: 209,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.appBlack),
                  ),
                  Container(
                    width: width,
                    height: 145,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor.withOpacity(.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Security alerts',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Get notified when new arenas.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .68,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Arena availability',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Get notified when fields you have in favourites become available.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              height: 20,
                              child: CupertinoSwitch(
                                value: isSwitchOn,
                                onChanged: (value) {
                                  ref.read(switchOnProvider.notifier).state =
                                      value;
                                  // setState(() {
                                  //   _switchValue = value;
                                  // });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
