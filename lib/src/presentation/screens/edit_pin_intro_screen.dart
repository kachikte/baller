import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPinIntroScreen extends ConsumerStatefulWidget {
  const EditPinIntroScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditPinIntroScreenState();
}

class _EditPinIntroScreenState extends ConsumerState<EditPinIntroScreen> {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "PIN",
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
            GestureDetector(
                onTap: () {
                  ref.read(isPinEditProvider.notifier).state = true;
                  Navigator.of(context).pushNamed(AppRoutes.newPinScreen);
                },
                child: Container(
                  width: width,
                  height: 68,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor.withOpacity(.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Set up PIN',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'Create a PIN to secure your account',
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
                )),
          ],
        ),
      ),
    );
  }
}
