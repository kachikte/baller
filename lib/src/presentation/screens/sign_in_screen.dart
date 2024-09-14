import 'dart:developer';

import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/domain/dto/dto.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/presentation/widgets/app_input.dart';
import 'package:baller/src/presentation/widgets/app_notification_pop.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
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

  Future<void> signIn(data) async {
    ref.read(notificationPopProvider.notifier).state = false;
    ref.read(inputErrorProvider.notifier).state = false;
    ref.read(buttonProvider.notifier).state = false;
    // Navigator.pushNamed(context, AppRoutes.landingScreen);
    ref.read(loginProvider(data).future).then((value) {
      if (value.isError) {
        ref.read(notificationPopProvider.notifier).state = true;
        ref.read(inputErrorProvider.notifier).state = true;
        log('This is the signed in data error - $value}');
        ref.read(buttonProvider.notifier).state = true;
      } else {
        log('This is the signed in data - $value}');
        LoginModel loginModel = value.data;
        UserModel userModel = UserModel(
            firstName: loginModel.firstName,
            lastName: loginModel.lastName,
            email: loginModel.email);
        ref.read(userProvider.notifier).setUser(userModel);
        ref.read(buttonProvider.notifier).state = true;
        Navigator.pushNamed(context, AppRoutes.pinSigninScreen);
      }
    }).catchError((err) {
      log('This is the error of the sign in - $err');
      ref.read(notificationPopProvider.notifier).state = true;
      ref.read(inputErrorProvider.notifier).state = true;
      ref.read(buttonProvider.notifier).state = true;
    });
  }

  signUp() async {
    Navigator.pushNamed(context, AppRoutes.signUpTypeScreen);
  }

  Future<void> forgotPassword() async {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final pinObscure = ref.watch(pinInputCompleteProvider);
    final buttonActive = ref.watch(buttonProvider);
    final inputError = ref.watch(inputErrorProvider);
    final notification = ref.watch(notificationPopProvider);
    final passwordCreated = ref.watch(passwordCreatedProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: BackButton(
          color: AppColors.appBlack,
        ),
        title: Text(
          "Sign In",
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
            inputError && notification
                ? AppNotificationPop(
                    width: width,
                    height: height * .06,
                    backgroundColor: AppColors.appRed,
                    prefixIcon: Icon(
                      Icons.info_outline,
                      color: AppColors.appWhite,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        ref.read(notificationPopProvider.notifier).state =
                            false;
                      },
                      icon: const Icon(Icons.close),
                      color: AppColors.appWhite,
                    ),
                    text: 'Wrong email or password',
                  )
                : (passwordCreated
                    ? AppNotificationPop(
                        width: width,
                        height: height * .06,
                        backgroundColor: AppColors.appGreen,
                        prefixIcon: Image.asset(AppImages.checkCircle),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(passwordCreatedProvider.notifier).state =
                                false;
                          },
                          icon: const Icon(Icons.close),
                          color: AppColors.appWhite,
                        ),
                        text: 'Password changed successfully! Wasn’t you?',
                      )
                    : const SizedBox()),
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
                "Welcome back",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Enter details below',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.lightText),
                )),
            SizedBox(
              height: height * .025,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * .05,
                    width: width * .3,
                    child: AppButton(
                        pressedFunction: _handleSignIn,
                        buttonIcon: SvgPicture.asset(
                          AppImages.google,
                          height: height * .025,
                          width: width * .5,
                        ),
                        buttonColor: AppColors.appWhite,
                        borderColor: AppColors.appBlack,
                        buttonText: ''),
                  ),
                  SizedBox(
                    height: height * .05,
                    width: width * .3,
                    child: AppButton(
                        pressedFunction: _handleSignIn,
                        buttonIcon: SvgPicture.asset(
                          AppImages.facebook,
                          height: height * .025,
                          width: width * .5,
                        ),
                        buttonColor: AppColors.primaryColorDark,
                        buttonText: ''),
                  ),
                  SizedBox(
                    height: height * .05,
                    width: width * .3,
                    child: AppButton(
                        pressedFunction: _handleSignIn,
                        buttonIcon: SvgPicture.asset(
                          AppImages.apple,
                          height: height * .025,
                          width: width * .5,
                        ),
                        buttonColor: AppColors.appBlack,
                        textColor: AppColors.appWhite,
                        buttonText: ''),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .025,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: width * .3,
                      child: Divider(
                        color: AppColors.appBlack,
                        height: 2,
                        thickness: .2,
                      )),
                  SizedBox(
                    width: width * .02,
                  ),
                  Text('or sign in with',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightText)),
                  SizedBox(
                    width: width * .02,
                  ),
                  SizedBox(
                      width: width * .3,
                      child: Divider(
                        color: AppColors.appBlack,
                        height: 2,
                        thickness: .2,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * .025,
            ),
            AppInput(
                textFieldHeight: 50,
                textEditingController: emailController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : const SizedBox(),
                isError: inputError,
                icon: Image.asset(AppImages.mailIconPng),
                hintText: "Enter your email address",
                errorText: "Please enter your username",
                width: width,
                label: "Email Address",
                height: height),
            AppInput(
                textFieldHeight: 50,
                textEditingController: passwordController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : GestureDetector(
                        onTap: () {
                          log('trying to change the obscure = $pinObscure');
                          ref.read(pinInputCompleteProvider.notifier).state =
                              !pinObscure;
                        },
                        child: pinObscure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                isError: inputError,
                type: Constants.passwordFieldType,
                icon: Image.asset(AppImages.lockIconPng),
                hintText: "Enter your password",
                errorText: "Please enter your password",
                width: width,
                label: "Password",
                height: height),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: forgotPassword,
                      child: Text(
                        'Forgot Your Password?',
                        style: Theme.of(context).textTheme.headline5,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * .04,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                buttonHeight: 50,
                pressedFunction: (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) &&
                        buttonActive
                    ? () => signIn(
                        LoginDto(emailController.text, passwordController.text))
                    : () {},
                buttonColor: (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) &&
                        buttonActive
                    ? AppColors.appGreen
                    : AppColors.primaryBackgroundColor.withOpacity(.3),
                buttonText: 'Sign in',
                buttonRadius: 10,
                textColor: (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty)
                    ? AppColors.appWhite
                    : AppColors.primaryBackgroundColor,
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
            GestureDetector(
              onTap: () => signUp(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                    text: TextSpan(
                        text: "Don’t have an account? ",
                        style: Theme.of(context).textTheme.headline3,
                        children: [
                      TextSpan(
                          text: "Create an account!",
                          style: TextStyle(color: AppColors.appGreen)),
                    ])),
              ),
            ),
            SizedBox(
              height: height * .07,
            ),
          ],
        ),
      ),
    );
  }
}
