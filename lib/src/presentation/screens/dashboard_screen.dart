import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
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
    Navigator.pushNamed(context, AppRoutes.homeScreen);
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
              height: height * .55,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What sports do you want to play?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Text(
                              'Select the sports you would like to play.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            )
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.appBlack.withOpacity(.1),
                          radius: 23,
                          child: CircleAvatar(
                            backgroundColor: AppColors.appWhite,
                            radius: 22,
                            child: Icon(
                              Icons.close,
                              color: AppColors.appBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.appBlack.withOpacity((.4)),
                    height: 3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      spacing: 20.0, // Space between widgets horizontally
                      runSpacing: 10.0, // Space between rows
                      children: List.generate(games.length, (index) {
                        // bool containsProficiency =
                        // skillProficienciesProv.contains(skillProficiencies[index]);

                        return IntrinsicWidth(
                          child: GestureDetector(
                            // onTap: () {
                            //   ref
                            //       .read(skillProficienciesProvider.notifier)
                            //       .update((state) {
                            //     // Check if the item exists in the list
                            //     if (containsProficiency) {
                            //       // If it exists, remove it
                            //       return state
                            //           .where(
                            //               (item) => item != skillProficiencies[index])
                            //           .toList();
                            //     } else {
                            //       // If it doesn't exist, add it
                            //       return [...state, skillProficiencies[index]];
                            //     }
                            //   });
                            // },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  color: AppColors.appWhite,
                                  // color: containsProficiency
                                  //     ? AppColors.primaryDark
                                  //     : AppColors.appGrey.withOpacity(.5),
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
                                      width: 10,
                                    ),
                                    Text(
                                      games[index]['name'],
                                      style: TextStyle(
                                          color: AppColors.appBlack,
                                          // color: containsProficiency
                                          //     ? AppColors.appWhite
                                          //     : AppColors.appBlack.withOpacity(.5),
                                          fontSize: 13),
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
                              buttonRadius: 10,
                              borderColor: AppColors.primaryBackgroundColor,
                              pressedFunction: () {},
                              buttonColor: AppColors.appWhite,
                              buttonText: 'Close'),
                        ),
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
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
                  style: TextStyle(
                      color: AppColors.appBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                ),
                Text(
                  "Bashiru Okala",
                  // "Terfa76!🎉",
                  style: TextStyle(color: AppColors.appBlack),
                )
              ],
            ),
          ],
        ),
        actions: [
          Image.asset(
            AppImages.moonBold,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            AppImages.ballersSearch,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(AppRoutes.notificationSettingScreen),
            child: Image.asset(
              AppImages.notificationsPng,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          // CircleAvatar(
          //   backgroundColor: AppColors.appBlack.withOpacity(.1),
          //   radius: 23,
          //   child: CircleAvatar(
          //     backgroundColor: AppColors.appWhite,
          //     radius: 22,
          //     child: Icon(
          //       Icons.notifications,
          //       color: AppColors.appBlack,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
          // CircleAvatar(
          //   backgroundColor: AppColors.appOrange.withOpacity(.3),
          //   radius: 23,
          //   child: Icon(
          //     Icons.person_outline,
          //     color: AppColors.appOrange,
          //   ),
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
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
                height: height * .3,
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
                height: height * .3,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return const FieldsWidget();
                      // return const FeaturedFieldsWidget();
                    },
                    itemCount: 2,
                    scrollDirection: Axis.horizontal),
              ),
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: (ctx, index) {
              //       return const FieldsWidget();
              //     },
              //     itemCount: 1,
              //     separatorBuilder: (context, index) {
              //       return const SizedBox(
              //         height: 15,
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
