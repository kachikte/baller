import 'dart:developer';

import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {

  TextEditingController pinController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  Future<void> setUpPin() async {
    Navigator.pushNamed(
        context, AppRoutes.pinSetupScreen);
  }

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(color: AppColors.appBlack,),
        title: Text(
          "Sign In", style: TextStyle(color: AppColors.appBlack),
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
              "Welcome back", style: TextStyle(color: AppColors.appBlack, fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(height: 5,),
            RichText(text: TextSpan(
                text: "Don’t have an account? ",
                style: TextStyle(color: AppColors.appBlack),
                children: [
                  TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                          color: AppColors.appGreen
                      )
                  ),
                ]
            )),
            SizedBox(height: height * .02,),
            Center(
              child: Pinput(
                controller: pinController,
                onCompleted: (pin) => log(pin),
              ),
            ),
            SizedBox(height: height * .02,),

            GestureDetector(
              onTap: setUpPin,
              child: RichText(text: TextSpan(
                  text: "Can’t remember PIN? ",
                  style: TextStyle(color: AppColors.appBlack),
                  children: [
                    TextSpan(
                        text: "Use your Password",
                        style: TextStyle(
                            color: AppColors.appGreen
                        )
                    ),
                  ]
              )),
            ),
            SizedBox(height: height * .06,),
          ],
        ),
      ),
    );
  }
}
