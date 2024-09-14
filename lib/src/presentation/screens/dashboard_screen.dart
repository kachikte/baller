import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  navigateToMatchList() {
    // Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    List games = [
      {'name': 'Football', 'image': AppImages.footBallPng},
      {'name': 'BasketBall', 'image': AppImages.basketBallPng},
      {'name': 'Track', 'image': AppImages.runPng},
      {'name': 'Volleyball', 'image': AppImages.volleyBallPng},
      {'name': 'Handball', 'image': AppImages.handballPng},
      {'name': 'Wrestling', 'image': AppImages.wrestlingPng},
      {'name': 'E-Sports', 'image': AppImages.gamePadPng},
      {'name': 'Table Tennis', 'image': AppImages.tableTenisPng},
      {'name': 'Boxing', 'image': AppImages.boxingPng},
      {'name': 'Gymnastics', 'image': AppImages.gymnasticsPng},
      {'name': 'Polo', 'image': AppImages.poloPng},
      {'name': 'Badminton', 'image': AppImages.badmintonPng},
      {'name': 'Taekwondo', 'image': AppImages.taekwondoPng},
    ];

    showModalBottom() {
      return showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          enableDrag: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (ctx) {
            return Container(
              height: 400,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What sports do you want to play?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            Text(
                              'Select the sports you would like to play.',
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.appBlack.withOpacity(.1),
                          radius: 15,
                          child: CircleAvatar(
                            backgroundColor: AppColors.appWhite,
                            radius: 14,
                            child: Icon(
                              Icons.close,
                              color: AppColors.appBlack,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Wrap(
                      spacing: 10.0, // Space between widgets horizontally
                      runSpacing: 10.0, // Space between rows
                      children: List.generate(games.length, (index) {
                        return IntrinsicWidth(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 3,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                  color: AppColors.appWhite,
                                  border: Border.all(
                                      color: AppColors.primaryBackgroundColor
                                          .withOpacity(.2),
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(games[index]['image']),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      games[index]['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.lightText),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 3,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
                              buttonHeight: AppHelperFunctions.dimensionHeight(
                                  height, 63),
                              buttonRadius: 10,
                              borderColor: AppColors.primaryBackgroundColor,
                              pressedFunction: () {},
                              buttonColor: AppColors.appWhite,
                              buttonText: 'Close'),
                        ),
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
                              buttonHeight: AppHelperFunctions.dimensionHeight(
                                  height, 63),
                              buttonRadius: 10,
                              pressedFunction: () {},
                              buttonColor: AppColors.appBlack,
                              textColor: AppColors.appWhite,
                              buttonText: 'Save'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.profileScreen),
              child: CircleAvatar(
                backgroundColor: AppColors.appBlack,
                radius: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(AppImages.profileImagePng),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning ☀",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Bashiru Okala",
                  // "Terfa76!🎉",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: AppColors.appBlack),
                )
              ],
            ),
          ],
        ),
        actions: [
          Image.asset(
            AppImages.moonBold,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            AppImages.ballersSearch,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(AppRoutes.notificationSettingScreen),
            child: Image.asset(
              AppImages.notificationsPng,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: AppColors.appWhite,
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreWidget(),
              GestureDetector(
                  onTap: navigateToMatchList,
                  child: const TitleRowWidget(
                      leadingText: 'Based on your location',
                      trailingText: 'See all >')),
              SizedBox(
                height: 222,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                          onTap: showModalBottom, child: const FieldsWidget());
                      // return const FeaturedFieldsWidget();
                    },
                    itemCount: 2,
                    scrollDirection: Axis.horizontal),
              ),
              GestureDetector(
                  onTap: navigateToMatchList,
                  child: const TitleRowWidget(
                      leadingText: 'Based on sports you like',
                      trailingText: 'View more >')),
              SizedBox(
                height: 222,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return const FieldsWidget();
                      // return const FeaturedFieldsWidget();
                    },
                    itemCount: 2,
                    scrollDirection: Axis.horizontal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
