import 'dart:developer';

import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/presentation/widgets/app_input.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController usernameController = TextEditingController();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }


  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      log('$error');
    }
  }

  Future<void> signIn() async {
    Navigator.pushNamed(
        context, AppRoutes.matchDetailScreen);
  }

  Future<void> forgotPassword() async {
    Navigator.pushNamed(
        context, AppRoutes.forgotPasswordScreen);
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.disconnect();
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
            AppButton(pressedFunction: _handleSignIn, buttonIcon: SvgPicture.asset(AppImages.google), buttonColor: AppColors.appWhite, buttonText: 'Sign in with Google'),
            SizedBox(height: height * .02,),
            AppButton(pressedFunction: _handleSignIn, buttonIcon: SvgPicture.asset(AppImages.facebook), buttonColor: AppColors.primaryColorDark, buttonText: 'Sign in with Facebook'),
            SizedBox(height: height * .02,),
            AppButton(pressedFunction: _handleSignIn, buttonIcon: SvgPicture.asset(AppImages.apple), buttonColor: AppColors.appBlack, textColor: AppColors.appWhite, buttonText: 'Sign in with iCloud'),
            SizedBox(height: height * .02,),
            Row(
              children: [
                SizedBox(width: 135, child: Divider(color: AppColors.appBlack, height: 2, thickness: .2,)),
                SizedBox(width: width * .02,),
                const Text('or sign in with'),
                SizedBox(width: width * .02,),
                SizedBox(width: 135, child: Divider(color: AppColors.appBlack, height: 2, thickness: .2,)),
              ],
            ),
            SizedBox(height: height * .02,),
            RichText(text: TextSpan(
                text: "Username ",
                style: TextStyle(color: AppColors.appBlack),
                children: [
                  TextSpan(
                      text: "*",
                      style: TextStyle(
                          color: AppColors.appRed
                      )
                  ),
                ]
            )),
            SizedBox(height: height * .01,),
            AppInput(
              icon: Icon(Icons.person_outline, color: AppColors.appBlack.withOpacity(.5),),
                textEditingController: usernameController,
                hintText: "Username",
                errorText: "Please enter your username"),
            SizedBox(height: height * .02,),
            RichText(text: TextSpan(
                text: "Password ",
                style: TextStyle(color: AppColors.appBlack),
                children: [
                  TextSpan(
                      text: "*",
                      style: TextStyle(
                          color: AppColors.appRed
                      )
                  ),
                ]
            )),
            SizedBox(height: height * .01,),
            AppInput(
              type: Constants.passwordFieldType,
                icon: Icon(Icons.lock_open, color: AppColors.appBlack.withOpacity(.5),),
                textEditingController: usernameController,
                hintText: "Password",
                errorText: "Please enter your password"),
            SizedBox(height: height * .03,),
            GestureDetector(onTap: forgotPassword, child: Text('Forgot password?', style: TextStyle(color: AppColors.appGreen),)),
            SizedBox(height: height * .06,),
            AppButton(pressedFunction: signIn, buttonColor: AppColors.appGreen, buttonText: 'Sign in', textColor: AppColors.appWhite,),
          ],
        ),
      ),
    );
  }
}
