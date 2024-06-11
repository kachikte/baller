import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/providers/pin_input_provider.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class PinSetupScreen extends ConsumerStatefulWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends ConsumerState<PinSetupScreen> {

  TextEditingController pinController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  Future<void> signIn() async {
    ref.read(pinInputCompleteProvider.notifier).state = false;
    Navigator.pushNamed(
        context, AppRoutes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {

    final pinProvider = ref.watch(pinInputCompleteProvider);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(color: AppColors.appBlack,),
        title: Text(
          "Setup PIN", style: TextStyle(color: AppColors.appBlack),
        ),
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * .02,),
            Text(
              "Would you like to setup a PIN?", style: TextStyle(color: AppColors.appBlack, fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(height: 5,),
            Text(
                "Setup a PIN for ease sign in and secure operations",
                style: TextStyle(color: AppColors.appBlack),
            ),
            SizedBox(height: height * .02,),
            Center(
              child: Pinput(
                controller: pinController,
                onCompleted: (pin) {
                  ref.read(pinInputCompleteProvider.notifier).state = true;
                },
              ),
            ),
            SizedBox(height: height * .02,),

            AppButton(pressedFunction: pinProvider == true ? signIn : (){}, buttonColor: pinProvider == true ? AppColors.appGreen : AppColors.appGreen.withOpacity(.3), buttonText: 'Setup PIN', textColor: AppColors.appWhite,),
            SizedBox(height: height * .02,),
            AppButton(pressedFunction: signIn, buttonColor: AppColors.appWhite, buttonText: 'Skip',),

          ],
        ),
      ),
    );
  }
}
