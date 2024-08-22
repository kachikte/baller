import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/arena_provider.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArenaDetailsScreen extends ConsumerStatefulWidget {
  const ArenaDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ArenaDetailsScreenState();
}

class _ArenaDetailsScreenState extends ConsumerState<ArenaDetailsScreen> {
  TextEditingController emailController = TextEditingController();

  List games = [
    'Changing rooms',
    'Photographer',
    'Free Wifi',
    'Showers',
    'Drone shots',
    'Cafeteria'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final reviewDetail = ref.watch(detailsReviewsProvider);

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
              height: height * .42,
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
                              const Text(
                                'Review',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                              Text(
                                'Submit your review.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    color: AppColors.appBlack.withOpacity(.5)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.5),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.5),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.5),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.5),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '1.0',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.appBlack.withOpacity(.5)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: AppDecorations.borderOutline,
                            enabledBorder: AppDecorations.borderOutline,
                            disabledBorder: AppDecorations.borderOutline,
                            hintText: 'Enter your review',
                            hintStyle: TextStyle(
                                color: AppColors.appBlack.withOpacity(.4),
                                fontSize: 14),
                            focusedBorder: AppDecorations.borderOutline,
                            errorBorder: AppDecorations.borderError,
                            errorStyle: TextStyle(color: AppColors.appRed)),
                        minLines: 5,
                        maxLines: 7,
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
                      child: AppButton(
                          buttonRadius: 10,
                          pressedFunction: () {},
                          buttonColor: AppColors.appBlack,
                          textColor: AppColors.appWhite,
                          buttonText: 'Submit'),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    image: const DecorationImage(
                      image: AssetImage(AppImages.basketBallCourtPng),
                      fit: BoxFit
                          .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.matchDetailProfile,
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: AppColors.primaryBackgroundColor
                                    .withOpacity(.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Center(
                              child: Text(
                                'Cubic Pythagoras Multiservices Limited',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Text(
                            'Estate Basketball Court',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColors.appBlack),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.star,
                        color: AppColors.appYellow,
                        size: 14,
                      ),
                      const Text(
                        '3.5',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: height * .05,
                  child: Row(
                    children: [
                      Text(
                        '0.5 mi away',
                        style: TextStyle(
                            color: AppColors.appBlack.withOpacity(.4)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor:
                            AppColors.primaryBackgroundColor.withOpacity(.5),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Gwarinpa, Nigeria',
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.4)))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: height * .05,
                  child: Row(
                    children: [
                      Image.asset(AppImages.footBallPng),
                      Text(' Football',
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.4))),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(',',
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.4))),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(AppImages.basketBallPng),
                      Text(' Basketball',
                          style: TextStyle(
                              color: AppColors.appBlack.withOpacity(.4)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 5.0, // Space between widgets horizontally
                  runSpacing: 10.0, // Space between rows
                  children: List.generate(games.length, (index) {
                    return IntrinsicWidth(
                      child: GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(.08),
                              border: Border.all(
                                  color: AppColors.appTransparent, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: Center(
                            child: Text(
                              games[index],
                              style: TextStyle(
                                  color: AppColors.appBlack, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * .07,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => ref
                              .read(detailsReviewsProvider.notifier)
                              .state = Constants.revDets,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: reviewDetail == Constants.revDets
                                            ? AppColors.appBlack
                                            : AppColors.appBlack
                                                .withOpacity(.5),
                                        width: reviewDetail == Constants.revDets
                                            ? 1.5
                                            : .5))),
                            child: Center(
                                child: Text(
                              Constants.revDets,
                              style: TextStyle(
                                  fontWeight: reviewDetail == Constants.revDets
                                      ? FontWeight.w700
                                      : FontWeight.normal),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => ref
                              .read(detailsReviewsProvider.notifier)
                              .state = Constants.reviews,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: reviewDetail == Constants.reviews
                                            ? AppColors.appBlack
                                            : AppColors.appBlack
                                                .withOpacity(.5),
                                        width: reviewDetail == Constants.reviews
                                            ? 1.5
                                            : .5))),
                            child: Center(
                                child: Text(
                              Constants.reviews,
                              style: TextStyle(
                                  fontWeight: reviewDetail == Constants.reviews
                                      ? FontWeight.w700
                                      : FontWeight.normal),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                reviewDetail == Constants.revDets
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        height: height * .2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Overview',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Et placerat rhoncus vehicula tellus ipsum. Enim nisl dictumst ac convallis facilisi mi. Tincidunt lorem amet morbi cras neque. Sagittis pellentesque nisl tellus nisi vel sit. Read more',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.appBlack.withOpacity(.6)),
                            )
                          ],
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: height * .28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 120,
                                  color: Colors
                                      .orange, // Set the color to orange/yellow
                                ),
                                Text(
                                  '5.0',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Set the text color to white
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Based on 200 ratings',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: width * .03),
                              child: AppButton(
                                pressedFunction: showModalBottom,
                                buttonColor: AppColors.appBlack,
                                textColor: AppColors.appWhite,
                                buttonText: 'Review',
                                buttonRadius: 10,
                                borderColor: AppColors.appBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                const Divider(
                  height: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * .03),
                  child: AppButton(
                    pressedFunction: () => Navigator.of(context)
                        .pushNamed(AppRoutes.bookingScreen),
                    buttonColor: AppColors.appGreen,
                    textColor: AppColors.appWhite,
                    buttonText:
                        'Book now                                           from ₦1,000',
                    buttonRadius: 10,
                    borderColor: AppColors.appRed.withOpacity(.1),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              top: 75,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: width * .95,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.appWhite,
                        )),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppImages.moonWhitePng,
                          color: AppColors.appWhite,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppImages.notificationsPng,
                          color: AppColors.appWhite,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppImages.bookmarkIconPng,
                          color: AppColors.appWhite,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppImages.cautionPng,
                          color: AppColors.appWhite,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppImages.sharePng,
                          color: AppColors.appWhite,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
