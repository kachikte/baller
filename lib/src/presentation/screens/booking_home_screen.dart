import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/button_provider.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingHomeScreen extends ConsumerStatefulWidget {
  const BookingHomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookingHomeScreenState();
}

class _BookingHomeScreenState extends ConsumerState<BookingHomeScreen> {
  navigateToArenaDetails() {
    Navigator.pushNamed(context, AppRoutes.arenaDetailsScreen);
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    var tabSelect = ref.watch(bookingsTabProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Bookings',
              style: TextStyle(color: AppColors.appBlack, fontSize: 25),
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
              Container(
                  width: width,
                  height: height * .05,
                  padding: const EdgeInsets.all(2),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor.withOpacity(.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => ref
                                .read(bookingsTabProvider.notifier)
                                .state = Constants.upcomingBookings,
                            child: Container(
                                height: height * .06,
                                decoration: BoxDecoration(
                                    color:
                                        tabSelect == Constants.upcomingBookings
                                            ? AppColors.appWhite
                                            : AppColors.appTransparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Center(
                                    child: Text('Upcoming',
                                        style: TextStyle(fontSize: 12)))),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => ref
                                .read(bookingsTabProvider.notifier)
                                .state = Constants.completedBookings,
                            child: Container(
                                height: height * .06,
                                decoration: BoxDecoration(
                                    color:
                                        tabSelect == Constants.completedBookings
                                            ? AppColors.appWhite
                                            : AppColors.appTransparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Center(
                                    child: Text('Completed',
                                        style: TextStyle(fontSize: 12)))),
                          ),
                        ),
                      ])),
              SizedBox(
                width: width,
                child: AppInput(
                    textEditingController: searchController,
                    icon: Image.asset(
                      AppImages.ballersSearch,
                    ),
                    hintText: "Search booking ID or arena name",
                    errorText: "",
                    width: width * .8,
                    label: "",
                    height: height),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * .03),
                height: height * .27,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                      ),
                      height: height * .13,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              AppImages.basketBallCourtPng,
                              width: width * .23,
                              height: height * .11,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Estate football Court',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                'Gwarinpa, Nigeria',
                                style: TextStyle(
                                    color: AppColors.appBlack.withOpacity(.5),
                                    fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: tabSelect ==
                                                Constants.upcomingBookings
                                            ? AppColors.appYellow
                                                .withOpacity(.1)
                                            : AppColors.appBlack,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      tabSelect == Constants.upcomingBookings
                                          ? 'Upcoming'
                                          : 'Completed',
                                      style: TextStyle(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                              : AppColors.appWhite),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBackgroundColor
                                            .withOpacity(.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      '2354673',
                                      style:
                                          TextStyle(color: AppColors.appBlack),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                    Container(
                      height: height * .12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sport',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Basketball',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '08:30 am - 10:30 am',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              SizedBox(
                                width: width * .3,
                                child: Text(
                                  'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: AppColors.appBlack),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved date',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '14 Feb ‘24',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * .03),
                height: height * .27,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                      ),
                      height: height * .13,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              AppImages.basketBallCourtPng,
                              width: width * .23,
                              height: height * .11,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Estate football Court',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                'Gwarinpa, Nigeria',
                                style: TextStyle(
                                    color: AppColors.appBlack.withOpacity(.5),
                                    fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: tabSelect ==
                                                Constants.upcomingBookings
                                            ? AppColors.appYellow
                                                .withOpacity(.1)
                                            : AppColors.appBlack,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      tabSelect == Constants.upcomingBookings
                                          ? 'Upcoming'
                                          : 'Completed',
                                      style: TextStyle(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                              : AppColors.appWhite),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBackgroundColor
                                            .withOpacity(.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      '2354673',
                                      style:
                                          TextStyle(color: AppColors.appBlack),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                    Container(
                      height: height * .12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sport',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Basketball',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '08:30 am - 10:30 am',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              SizedBox(
                                width: width * .3,
                                child: Text(
                                  'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: AppColors.appBlack),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved date',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '14 Feb ‘24',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * .03),
                height: height * .27,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                      ),
                      height: height * .13,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.asset(
                              AppImages.basketBallCourtPng,
                              width: width * .23,
                              height: height * .11,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Estate football Court',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                'Gwarinpa, Nigeria',
                                style: TextStyle(
                                    color: AppColors.appBlack.withOpacity(.5),
                                    fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: tabSelect ==
                                                Constants.upcomingBookings
                                            ? AppColors.appYellow
                                                .withOpacity(.1)
                                            : AppColors.appBlack,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      tabSelect == Constants.upcomingBookings
                                          ? 'Upcoming'
                                          : 'Completed',
                                      style: TextStyle(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                              : AppColors.appWhite),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBackgroundColor
                                            .withOpacity(.1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      '2354673',
                                      style:
                                          TextStyle(color: AppColors.appBlack),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                    Container(
                      height: height * .12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sport',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                'Basketball',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '08:30 am - 10:30 am',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              SizedBox(
                                width: width * .3,
                                child: Text(
                                  'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: AppColors.appBlack),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Reserved date',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13,
                                    color: AppColors.appBlack),
                              ),
                              Text(
                                '14 Feb ‘24',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.appBlack),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
