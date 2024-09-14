import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivacySettingsScreen extends ConsumerStatefulWidget {
  const PrivacySettingsScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends ConsumerState<PrivacySettingsScreen> {
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
          "Privacy settings",
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
              height: height * .02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: width,
              height: 146,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location Privacy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.appBlack),
                  ),
                  Container(
                    width: width,
                    height: 85,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor.withOpacity(.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .68,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Show Nearby Arenas',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: AppColors.appBlack),
                              ),
                              Text(
                                'Allow the display of your location to find nearby fields.',
                                style: Theme.of(context).textTheme.bodyText1,
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
                              ref.read(switchOnProvider.notifier).state = value;
                              // setState(() {
                              //   _switchValue = value;
                              // });
                            },
                          ),
                        ),
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
                    'Data Sharing Preferences',
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
                                    'Third-Party Integrations',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'GData can be shared with third-party services.',
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
                                    'Marketing Communications',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  Text(
                                    'Opt-in or opt-out of receiving marketing communications and promotions.',
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
