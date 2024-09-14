import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> editProfile() async {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
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
          "Profile details",
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
                : const SizedBox(),
            SizedBox(
              height: height * .035,
            ),
            CircleAvatar(
              backgroundColor: AppColors.appBlack,
              radius: 20,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(AppImages.profileImagePng),
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
            SizedBox(
              width: 186,
              child: AppButton(
                  buttonHeight: 32,
                  buttonIcon: Image.asset(AppImages.ballersEdit),
                  borderColor: AppColors.primaryBackgroundColor,
                  pressedFunction: () =>
                      Navigator.pushNamed(context, AppRoutes.editProfileScreen),
                  buttonColor: AppColors.appWhite,
                  buttonText: 'Change Image'),
            ),
            SizedBox(
              height: height * .025,
            ),
            AppInput(
                textFieldHeight: 64,
                textEditingController: firstNameController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : const SizedBox(),
                isError: inputError,
                icon: const Icon(Icons.person_outline),
                hintText: "Bashiru",
                errorText: "Please enter your first name",
                width: width,
                label: "First Name",
                height: height),
            AppInput(
                textFieldHeight: 64,
                textEditingController: lastNameController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : const SizedBox(),
                isError: inputError,
                icon: const Icon(Icons.person_outline),
                hintText: "Okala",
                errorText: "Please enter your last name",
                width: width,
                label: "Last Name",
                height: height),
            AppInput(
                textFieldHeight: 64,
                textEditingController: emailController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : const SizedBox(),
                isError: inputError,
                icon: Image.asset(AppImages.mailIconPng),
                hintText: "bashiruonuche@hotmail.com",
                errorText: "Please enter your username",
                width: width,
                label: "Email Address",
                height: height),
            AppInput(
                textFieldHeight: 64,
                textInputType: TextInputType.number,
                textEditingController: phoneController,
                suffixIcon: inputError
                    ? Icon(
                        Icons.info_outline,
                        color: AppColors.appRed,
                      )
                    : const SizedBox(),
                isError: inputError,
                icon: const Icon(Icons.phone),
                hintText: "Enter your phone number",
                errorText: "Please enter your phone number",
                width: width,
                label: "Phone Number",
                height: height),
            SizedBox(
              height: height * .03,
            ),
            Divider(
              color: AppColors.appBlack.withOpacity((.4)),
              height: 3,
            ),
            SizedBox(
              height: height * .03,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                buttonHeight: 53,
                borderColor: AppColors.appBlack.withOpacity(.3),
                pressedFunction: emailController.text.isNotEmpty && buttonActive
                    ? () => editProfile()
                    : () {},
                buttonColor: emailController.text.isNotEmpty && buttonActive
                    ? AppColors.appGreen
                    : AppColors.appWhite.withOpacity(.3),
                buttonText: 'Save changes',
                buttonRadius: 10,
                textColor: emailController.text.isNotEmpty
                    ? AppColors.appWhite
                    : AppColors.primaryBackgroundColor,
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
