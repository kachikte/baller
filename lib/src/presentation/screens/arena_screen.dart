import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
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
              height: height * .9,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
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
                                'Filter options',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                'Select the filter options.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              )
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.appBlack.withOpacity(.1),
                            radius: 15,
                            child: CircleAvatar(
                              backgroundColor: AppColors.appWhite,
                              radius: 15,
                              child: Icon(
                                Icons.close,
                                color: AppColors.appBlack,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: const Text(
                        'Sports',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
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
                          horizontal: 10, vertical: 20),
                      child: const Text('Availability status'),
                    ),
                    SizedBox(
                      width: width,
                      height: height * .055,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avalaible',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text('Available slots to be booked')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: height * .055,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unavalaible',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text('No available slots to be booked')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: height * .055,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * .1,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.primaryBackgroundColor,
                              child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: AppColors.appWhite),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Closed',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text('Kinda self explanatory')
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
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Price range',
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.5)),
                        )),
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
                                borderColor: AppColors.appBlack.withOpacity(.5),
                                pressedFunction: () {},
                                textColor: AppColors.appBlack.withOpacity(.5),
                                buttonColor: AppColors.appWhite,
                                buttonText: 'Min price'),
                          ),
                          SizedBox(
                            width: width * .45,
                            child: AppButton(
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
              // "Terfa76!🎉",
              style: TextStyle(color: AppColors.appBlack, fontSize: 25),
            ),
          ],
        ),
        actions: [
          Image.asset(
            AppImages.moonBold,
            width: 30,
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // Image.asset(
          //   AppImages.ballersSearch,
          //   width: 30,
          // ),
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
                children: [
                  SizedBox(
                    width: width * .8,
                    child: AppInput(
                        textEditingController: searchController,
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            AppImages.gpsSvg,
                            fit: BoxFit.contain,
                          ),
                        ),
                        icon: Image.asset(
                          AppImages.ballersSearch,
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
                      width: width * .15,
                      height: height * .07,
                      decoration: BoxDecoration(
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.filterSvg,
                          fit: BoxFit.contain,
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: height * .04,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      // width: width * .3,
                      padding: const EdgeInsets.all(5),
                      height: height * .02,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: AppColors.appWhite,
                          border: Border.all(
                              color: AppColors.primaryBackgroundColor
                                  .withOpacity(.5),
                              width: 1)),
                      child: Row(
                        children: [
                          Image.asset(games[index]['image']),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(games[index]['name'])
                        ],
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
                height: 20,
              ),
              Container(
                height: height * .35,
                decoration: BoxDecoration(color: Colors.amber.withOpacity(.04)),
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
                      height: height * .3,
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
                height: height * .05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '8 Available Arenas',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Container(
                      // width: width * .4,
                      padding: const EdgeInsets.all(10),
                      height: height * .12,
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
                          const Text('Sort')
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
                height: height * .3,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    // return const FieldsWidget();
                    return GestureDetector(
                        onTap: navigateToArenaDetails,
                        child: const FullFeaturedFieldsWidget());
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
