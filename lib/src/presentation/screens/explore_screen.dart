import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    signIn() async {
      Navigator.pushNamed(
          context, AppRoutes.signInScreen);
    }

    signUp() async {
      Navigator.pushNamed(
          context, AppRoutes.signUpTypeScreen);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * .4,
              width: size.width,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    AppImages.explorePng,
                    fit: BoxFit.cover,
                  )),
            ),
            Image.asset(AppImages.logo),
            const Text('Explore venues', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            const Text(
              'Discover a variety of sports arenas in your area. Swipe through options, check out facilities, and find the perfect spot for your game.',
              textAlign: TextAlign.center,
            ),
            AppButton(
              pressedFunction: signIn,
              buttonColor: AppColors.appGreen,
              buttonText: 'Sign In',
              buttonRadius: 10,
              textColor: AppColors.appWhite,
            ),
            AppButton(
              pressedFunction: signUp,
              buttonColor: AppColors.appTransparent,
              buttonText: 'Create An Account',
              buttonRadius: 10,
              borderColor: AppColors.primaryBackgroundColor.withOpacity(.3),
              suffixButtonIcon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
