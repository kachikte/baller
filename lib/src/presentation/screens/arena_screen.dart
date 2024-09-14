import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArenaScreen extends ConsumerStatefulWidget {
  const ArenaScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArenaScreenState();
}

class _ArenaScreenState extends ConsumerState<ArenaScreen> {
  navigateToArenaDetails() {
    Navigator.pushNamed(context, AppRoutes.arenaDetailsScreen);
  }

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

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    showModalBottom() {
      return showModalBottomSheet(
          enableDrag: true,
          showDragHandle: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (ctx) {
            return Container(
              height: AppHelperFunctions.dimensionHeight(height, 720),
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Filter options',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: AppColors.appBlack),
                              ),
                              Text(
                                'Select the filter options.',
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
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'Sports',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                                            .copyWith(
                                                color: AppColors.lightText),
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
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: AppColors.appBlack.withOpacity((.2)),
                      height: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        'Availability status',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: 34,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avalaible',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'Available slots to be booked',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: width,
                      height: 34,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unavalaible',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'No available slots to be booked',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: width,
                      height: 34,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Closed',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'Kinda self explanatory',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: AppColors.appBlack.withOpacity((.2)),
                      height: 3,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          'Price range',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .45,
                            child: AppButton(
                                buttonHeight:
                                    AppHelperFunctions.dimensionHeight(
                                        height, 64),
                                buttonRadius: 10,
                                borderColor: AppColors.appBlack.withOpacity(.5),
                                pressedFunction: () {},
                                textColor: AppColors.appBlack.withOpacity(.5),
                                buttonColor: AppColors.appWhite,
                                buttonText: 'Min price'),
                          ),
                          SizedBox(
                            width: width * .45,
                            child: AppButton(
                                buttonHeight:
                                    AppHelperFunctions.dimensionHeight(
                                        height, 64),
                                buttonRadius: 10,
                                borderColor: AppColors.appBlack.withOpacity(.5),
                                pressedFunction: () {},
                                textColor: AppColors.appBlack.withOpacity(.5),
                                buttonColor: AppColors.appWhite,
                                buttonText: 'Max price'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.appBlack.withOpacity((.2)),
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
                                buttonHeight:
                                    AppHelperFunctions.dimensionHeight(
                                        height, 64),
                                buttonRadius: 10,
                                borderColor: AppColors.primaryBackgroundColor
                                    .withOpacity(.3),
                                pressedFunction: () {},
                                buttonColor: AppColors.appWhite,
                                buttonText: 'Reset'),
                          ),
                          SizedBox(
                            width: width * .45,
                            child: AppButton(
                                buttonHeight:
                                    AppHelperFunctions.dimensionHeight(
                                        height, 64),
                                buttonRadius: 10,
                                pressedFunction: () {},
                                buttonColor: AppColors.appBlack,
                                textColor: AppColors.appWhite,
                                buttonText: 'Apply filter'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
            Text(
              'Arenas',
              style: Theme.of(context).textTheme.headline1,
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
              const Divider(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * .8,
                    child: AppInput(
                        textFieldHeight: 64,
                        textEditingController: searchController,
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            AppImages.gpsSvg,
                            fit: BoxFit.contain,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        icon: Image.asset(
                          AppImages.ballersSearch,
                          height: 20,
                          width: 20,
                        ),
                        hintText:
                            "Apo Resettlement Area Sapeyi Palace Crescent",
                        errorText: "",
                        width: width * .8,
                        label: "",
                        height: height),
                  ),
                  GestureDetector(
                    onTap: showModalBottom,
                    child: Container(
                      width: 56,
                      height: 62,
                      decoration: BoxDecoration(
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.filterSvg,
                          fit: BoxFit.contain,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 37,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
                                  .copyWith(color: AppColors.appBlack),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: games.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 260,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(.1),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: height * .05,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Featured Arenas',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Icon(Icons.close)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 202,
                      child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                                onTap: navigateToArenaDetails,
                                child: const ArenaFieldsWidget());
                            // return const FeaturedFieldsWidget();
                          },
                          itemCount: 2,
                          scrollDirection: Axis.horizontal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '8 Available Arenas',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      // width: width * .4,
                      padding: const EdgeInsets.all(10),
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: AppColors.appWhite,
                          border: Border.all(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.5),
                              width: 1)),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.filterPngPng,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sort',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColors.appBlack),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * .7,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                        onTap: navigateToArenaDetails,
                        child: const FullFeaturedFieldsWidget(
                          bookmark: false,
                        ));
                  },
                  itemCount: 2,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
