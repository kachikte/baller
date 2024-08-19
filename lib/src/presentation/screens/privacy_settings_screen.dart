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
          style: TextStyle(color: AppColors.appBlack),
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
              // padding: EdgeInsets.symmetric(
              //     vertical: height * .02, horizontal: width * .03),
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
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
                      'Location Privacy',
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
                  Container(
                    width: width,
                    height: height * .1,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
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
                              width: width * .55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Show Nearby Arenas',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Allow the display of your location to find nearby fields.',
                                    style: TextStyle(
                                      color: AppColors.appBlack.withOpacity(.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CupertinoSwitch(
                              value: isSwitchOn,
                              onChanged: (value) {
                                ref.read(switchOnProvider.notifier).state =
                                    value;
                                // setState(() {
                                //   _switchValue = value;
                                // });
                              },
                            ),
                          ],
                        ),
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
              height: height * .02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * .03),
              // padding: EdgeInsets.symmetric(
              //     vertical: height * .02, horizontal: width * .03),
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.appBlack.withOpacity(.2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
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
                      'Data Sharing Preferences',
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
                  Container(
                    width: width,
                    height: height * .2,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
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
                              width: width * .55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Third-Party Integrations',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Data can be shared with third-party services.',
                                    style: TextStyle(
                                      color: AppColors.appBlack.withOpacity(.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CupertinoSwitch(
                              value: isSwitchOn,
                              onChanged: (value) {
                                ref.read(switchOnProvider.notifier).state =
                                    value;
                                // setState(() {
                                //   _switchValue = value;
                                // });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Marketing Communications',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Opt-in or opt-out of receiving marketing communications and promotions.',
                                    style: TextStyle(
                                      color: AppColors.appBlack.withOpacity(.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CupertinoSwitch(
                              value: isSwitchOn,
                              onChanged: (value) {
                                ref.read(switchOnProvider.notifier).state =
                                    value;
                                // setState(() {
                                //   _switchValue = value;
                                // });
                              },
                            ),
                          ],
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
              height: height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
