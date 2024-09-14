import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void signIn() async {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }

  void signUp() async {
    Navigator.pushNamed(context, AppRoutes.signUpTypeScreen);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          _buildPage(size, AppImages.exploreJpgOne, 'Explore venues',
              'Discover a variety of sports arenas in your area. Swipe through options, check out facilities, and find the perfect spot for your game.'),
          _buildPage(size, AppImages.exploreJpgTwo, 'Effortless booking',
              'Booking your favourite arena is a breeze! Select your preferred date and time, customise your reservation, and confirm – all in just a few taps.'),
          _buildPage(size, AppImages.exploreJpgThree, 'Real-time availability',
              'Stay in the loop with real-time availability updates. No more guesswork – see when your preferred arena is open and lock in your slot instantly.'),
        ],
      ),
    );
  }

  Widget _buildPage(
      Size size, String imagePath, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppHelperFunctions.dimensionWidth(size.width, 16),
        vertical: AppHelperFunctions.dimensionHeight(size.height, 16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image
          SizedBox(
            height: AppHelperFunctions.dimensionHeight(size.height, 443),
            width: AppHelperFunctions.dimensionWidth(size.width, 396),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Page Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3, // Assuming you have 3 pages
              (index) => Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        AppHelperFunctions.dimensionWidth(size.width, 4)),
                height: AppHelperFunctions.dimensionHeight(size.height, 4),
                width: AppHelperFunctions.dimensionWidth(size.width, 42.66667),
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColors.appBlack
                      : AppColors.appBlack.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppHelperFunctions.dimensionHeight(size.height, 16),
          ),

          // Logo
          ClipRRect(
              borderRadius: BorderRadius.circular(15.235),
              child: Image.asset(
                AppImages.logo,
                width: AppHelperFunctions.dimensionHeight(size.height, 49),
                height: AppHelperFunctions.dimensionWidth(size.width, 49),
              )),

          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),

          // Description
          Text(description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.lightText)),

          // Sign In Button
          AppButton(
            buttonHeight: AppHelperFunctions.dimensionHeight(size.height, 64),
            pressedFunction: signIn,
            buttonColor: AppColors.appGreen,
            buttonText: 'Sign In',
            buttonRadius: 10,
            textColor: AppColors.appWhite,
          ),

          // Sign Up Button
          AppButton(
            buttonHeight: AppHelperFunctions.dimensionHeight(size.height, 64),
            pressedFunction: signUp,
            buttonColor: AppColors.appTransparent,
            buttonText: 'Create An Account',
            buttonRadius: 10,
            borderColor: AppColors.primaryBackgroundColor.withOpacity(.3),
            suffixButtonIcon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
