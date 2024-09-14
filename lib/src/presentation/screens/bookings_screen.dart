import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/time_slot_widget.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/app_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingsScreen extends ConsumerStatefulWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends ConsumerState<BookingsScreen> {
  navigateToReview() {
    Navigator.pushNamed(context, AppRoutes.bookingReviewScreen);
  }

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController playerController = TextEditingController();

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    Future<void> showCustomDatePicker(BuildContext context) async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black, // Header background color
                onPrimary: Colors.white, // Header text color
                onSurface: Colors.black, // Body text color
                surface: Colors.white, // Dialog background color
              ),
              dialogBackgroundColor:
                  Colors.white, // Background color of the dialog
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black, // Button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (selectedDate != null) {
        // Handle the selected date
        print('Selected date: $selectedDate');
        dateController.text = selectedDate.toString();
      }
    }

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
              height: AppHelperFunctions.dimensionHeight(height, 600),
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: SingleChildScrollView(
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
                                'Equipment Rental',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: AppColors.appBlack),
                              ),
                              Text(
                                'Select the options below.',
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
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: Theme.of(context).textTheme.headline3),
                          Text('₦0.00',
                              style: Theme.of(context).textTheme.headline2)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.appBlack.withOpacity((.4)),
                      height: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jersey Rental',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.appBlack)),
                              Text('NGN 200',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          SizedBox(
                            // width: width * .25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildCounterButton(
                                        Icons.remove, _decrementCounter),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '$_counter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: AppColors.appBlack),
                                      ),
                                    ),
                                    _buildCounterButton(
                                        Icons.add, _incrementCounter),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Goalkeeper Gloves Rental',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.appBlack)),
                              Text('Free',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          SizedBox(
                            // width: width * .25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildCounterButton(
                                        Icons.remove, _decrementCounter),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '$_counter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: AppColors.appBlack),
                                      ),
                                    ),
                                    _buildCounterButton(
                                        Icons.add, _incrementCounter),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shin Guards Rental',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.appBlack)),
                              Text('NGN 200',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          SizedBox(
                            // width: width * .25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildCounterButton(
                                        Icons.remove, _decrementCounter),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '$_counter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: AppColors.appBlack),
                                      ),
                                    ),
                                    _buildCounterButton(
                                        Icons.add, _incrementCounter),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Soccer Boot Rental',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.appBlack)),
                              Text('NGN 200',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          SizedBox(
                            // width: width * .25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildCounterButton(
                                        Icons.remove, _decrementCounter),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '$_counter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: AppColors.appBlack),
                                      ),
                                    ),
                                    _buildCounterButton(
                                        Icons.add, _incrementCounter),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Divider(
                      color: AppColors.appBlack.withOpacity((.4)),
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
                                buttonHeight: 53,
                                buttonRadius: 10,
                                borderColor: AppColors.primaryBackgroundColor,
                                pressedFunction: () {},
                                buttonColor: AppColors.appWhite,
                                buttonText: 'Reset'),
                          ),
                          SizedBox(
                            width: width * .45,
                            child: AppButton(
                                buttonHeight: 53,
                                buttonRadius: 10,
                                pressedFunction: () {},
                                buttonColor: AppColors.appBlack,
                                textColor: AppColors.appWhite,
                                buttonText: 'Apply'),
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
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.close,
                color: AppColors.appBlack,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Booking - ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColors.appBlack),
              ),
              TextSpan(
                text: "Estate Basketball Court",
                style: Theme.of(context).textTheme.headline3,
              ),
            ])),
          ],
        ),
        elevation: 1,
      ),
      backgroundColor: AppColors.appWhite,
      body: SizedBox(
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height - 240,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              AppImages.tilesPng,
                              width: 41,
                              height: 41,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Which Ground?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  "You can select just one ground.",
                                  // "Terfa76!🎉",
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            color: AppColors.appYellow,
                            fit: BoxFit.fill,
                            AppImages.cautionPng,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 162,
                      child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                                onTap: showModalBottom,
                                child: const BookingsWidget());
                          },
                          itemCount: 2,
                          scrollDirection: Axis.horizontal),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: .5,
                      color: AppColors.appBlack.withOpacity(.4),
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              AppImages.calendarPng,
                              width: 41,
                              height: 41,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "What date?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  "You can select just one date..",
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            color: AppColors.appYellow,
                            fit: BoxFit.fill,
                            AppImages.cautionPng,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showCustomDatePicker(context),
                      child: AppInput(
                          textFieldHeight: 64,
                          enabled: false,
                          textEditingController: dateController,
                          icon: const Icon(Icons.date_range),
                          hintText: "DD/MM/YY",
                          errorText: "",
                          width: width,
                          label: "",
                          height: height),
                    ),
                    Divider(
                      thickness: .5,
                      color: AppColors.appBlack.withOpacity(.4),
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              AppImages.clockPng,
                              width: 41,
                              height: 41,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "What Time?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  "You can select more than one timeframe.",
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            color: AppColors.appYellow,
                            fit: BoxFit.fill,
                            AppImages.cautionPng,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: height * .12,
                      child: ListView.separated(
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                                onTap: showModalBottom,
                                child: const TimeSlotWidget());
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 16,
                            );
                          },
                          itemCount: 2,
                          scrollDirection: Axis.horizontal),
                    ),
                    Divider(
                      thickness: .5,
                      color: AppColors.appBlack.withOpacity(.4),
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              AppImages.multiplePersonPng,
                              width: 41,
                              height: 41,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Who are the players?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Provide player names to specify the number.",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            color: AppColors.appYellow,
                            fit: BoxFit.fill,
                            AppImages.cautionPng,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    AppInput(
                        textFieldHeight: 64,
                        textEditingController: playerController,
                        icon: const Icon(Icons.person),
                        hintText: "Enter player name",
                        errorText: "",
                        width: width,
                        label: "",
                        height: height),
                    Divider(
                      thickness: .5,
                      color: AppColors.appBlack.withOpacity(.4),
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              AppImages.stackPng,
                              width: 41,
                              height: 41,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Need other services?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: AppColors.appBlack),
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Text(
                                  "You can select multiple services.",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            color: AppColors.appYellow,
                            fit: BoxFit.fill,
                            AppImages.cautionPng,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottom(),
                      child: Container(
                        width: width,
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Equipment Rental ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColors.appBlack),
                                  ),
                                  TextSpan(
                                    text: "NGN 200.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: AppColors.appGreen),
                                  ),
                                ])),
                                Text(
                                  'Goalkeeper gloves ( 3 )',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottom(),
                      child: Container(
                        width: width,
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Professional Coaching',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottom(),
                      child: Container(
                        width: width,
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Refreshments/Catering',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottom(),
                      child: Container(
                        width: width,
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Photography Services',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottom(),
                      child: Container(
                        width: width,
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryBackgroundColor
                                .withOpacity(.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Locker Rental',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: 180,
              decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.primaryBackgroundColor, width: .5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .03),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    height: 63,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.appBlack.withOpacity(.2),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '₦1,100',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppColors.appBlack),
                            ),
                            Text(
                              'View breakdown',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: AppColors.appGreen,
                                      decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
                              buttonHeight: 53,
                              buttonRadius: 10,
                              borderColor: AppColors.primaryBackgroundColor
                                  .withOpacity(.3),
                              pressedFunction: () {},
                              buttonColor: AppColors.appWhite,
                              buttonText: 'Cancel'),
                        ),
                        SizedBox(
                          width: width * .45,
                          child: AppButton(
                              buttonHeight: 53,
                              buttonRadius: 10,
                              pressedFunction: () => navigateToReview(),
                              buttonColor: AppColors.appGreen,
                              textColor: AppColors.appWhite,
                              buttonText: 'Proceed'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: AppColors.primaryBackgroundColor.withOpacity(.4),
              width: 2),
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 15,
        ),
      ),
    );
  }
}
