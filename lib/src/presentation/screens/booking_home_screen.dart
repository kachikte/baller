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
  navigateToBookingDetails() {
    Navigator.pushNamed(context, AppRoutes.bookingDetailScreen);
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
              style: Theme.of(context).textTheme.headline1,
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
                  height: 45,
                  padding: const EdgeInsets.all(4),
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
                                height: 41,
                                decoration: BoxDecoration(
                                    color:
                                        tabSelect == Constants.upcomingBookings
                                            ? AppColors.appWhite
                                            : AppColors.appTransparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Center(
                                    child: Text('Upcoming',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                color: AppColors.lightText)))),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => ref
                                .read(bookingsTabProvider.notifier)
                                .state = Constants.completedBookings,
                            child: Container(
                                height: 41,
                                decoration: BoxDecoration(
                                    color:
                                        tabSelect == Constants.completedBookings
                                            ? AppColors.appWhite
                                            : AppColors.appTransparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Center(
                                    child: Text('Completed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                color: AppColors.lightText)))),
                          ),
                        ),
                      ])),
              SizedBox(
                width: width,
                child: AppInput(
                    textFieldHeight: 64,
                    textEditingController: searchController,
                    icon: Image.asset(
                      AppImages.ballersSearch,
                      height: 20,
                      width: 20,
                    ),
                    hintText: "Search booking ID or arena name",
                    errorText: "",
                    width: width * .8,
                    label: "",
                    height: height),
              ),
              GestureDetector(
                onTap: () => navigateToBookingDetails(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  height: 210,
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
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                        ),
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                AppImages.basketBallCourtPng,
                                width: 72,
                                height: 72,
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
                                Text(
                                  'Estate football Court',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Gwarinpa, Nigeria',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                                  .withOpacity(.1)
                                              : AppColors.appBlack,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        tabSelect == Constants.upcomingBookings
                                            ? 'Upcoming'
                                            : 'Completed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: tabSelect ==
                                                        Constants
                                                            .upcomingBookings
                                                    ? AppColors.appYellow
                                                    : AppColors.appWhite),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .primaryBackgroundColor
                                              .withOpacity(.1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        '2354673',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.more_horiz,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sport',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  'Basketball',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved time',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '08:30 am - 10:30 am',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  width: width * .3,
                                  child: Text(
                                    'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: AppColors.appBlack,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved date',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '14 Feb ‘24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => navigateToBookingDetails(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  height: 210,
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
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                        ),
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                AppImages.basketBallCourtPng,
                                width: 72,
                                height: 72,
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
                                Text(
                                  'Estate football Court',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Gwarinpa, Nigeria',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                                  .withOpacity(.1)
                                              : AppColors.appBlack,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        tabSelect == Constants.upcomingBookings
                                            ? 'Upcoming'
                                            : 'Completed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: tabSelect ==
                                                        Constants
                                                            .upcomingBookings
                                                    ? AppColors.appYellow
                                                    : AppColors.appWhite),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .primaryBackgroundColor
                                              .withOpacity(.1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        '2354673',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.more_horiz,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sport',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  'Basketball',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved time',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '08:30 am - 10:30 am',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  width: width * .3,
                                  child: Text(
                                    'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: AppColors.appBlack,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved date',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '14 Feb ‘24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => navigateToBookingDetails(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  height: 210,
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
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                        ),
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                AppImages.basketBallCourtPng,
                                width: 72,
                                height: 72,
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
                                Text(
                                  'Estate football Court',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Gwarinpa, Nigeria',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: tabSelect ==
                                                  Constants.upcomingBookings
                                              ? AppColors.appYellow
                                                  .withOpacity(.1)
                                              : AppColors.appBlack,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        tabSelect == Constants.upcomingBookings
                                            ? 'Upcoming'
                                            : 'Completed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: tabSelect ==
                                                        Constants
                                                            .upcomingBookings
                                                    ? AppColors.appYellow
                                                    : AppColors.appWhite),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 28,
                                      width: 69,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .primaryBackgroundColor
                                              .withOpacity(.1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        '2354673',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.more_horiz,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sport',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  'Basketball',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved time',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '08:30 am - 10:30 am',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  width: width * .3,
                                  child: Text(
                                    'Citec Villa, 1, C-Close, 4th Ave, Gwarinpa, Kubwa 900108',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: AppColors.appBlack,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Reserved date',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '14 Feb ‘24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: AppColors.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
