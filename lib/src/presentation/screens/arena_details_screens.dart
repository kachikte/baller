import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/providers/arena_provider.dart';
import 'package:baller/src/presentation/providers/providers.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    final buttonActive = ref.watch(buttonProvider);
    final inputError = ref.watch(inputErrorProvider);
    final notification = ref.watch(notificationPopProvider);
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
              height: height * .5,
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
                                'Review',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Text(
                                'Submit your review.',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.appYellow,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1.0')
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    // borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.footballField),
                      fit: BoxFit
                          .cover, // You can change this to BoxFit.contain, BoxFit.fill, etc.
                    ),
                  ),
                ),
                ListTile(
                    leading: Image.asset(AppImages.matchDetailProfile),
                    title: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color:
                              AppColors.primaryBackgroundColor.withOpacity(.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          'Cubic Pythagoras Multiservices Limited',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Estate Basketball Court',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.appBlack),
                    ),
                    trailing: const Text('3.5')),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: height * .05,
                  child: Row(
                    children: [
                      const Text('0.5 mi away'),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            AppColors.primaryBackgroundColor.withOpacity(.5),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Gwarinpa, Nigeria')
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: height * .05,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.footballSvg),
                      const Text(' Football'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(','),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(AppImages.footballSvg),
                      const Text(' Basketball')
                    ],
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
                              color: Colors.amber.withOpacity(.08),
                              // color: containsProficiency
                              //     ? AppColors.primaryDark
                              //     : AppColors.appGrey.withOpacity(.5),
                              border: Border.all(
                                  color: AppColors.appTransparent, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: Center(
                            child: Text(
                              games[index],
                              style: TextStyle(
                                  color: AppColors.appBlack,
                                  // color: containsProficiency
                                  //     ? AppColors.appWhite
                                  //     : AppColors.appBlack.withOpacity(.5),
                                  fontSize: 13),
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Et placerat rhoncus vehicula tellus ipsum. Enim nisl dictumst ac convallis facilisi mi. Tincidunt lorem amet morbi cras neque. Sagittis pellentesque nisl tellus nisi vel sit. Read more',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10),
                        height: height * .22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.appYellow,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Based on 200 ratings',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
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
                    pressedFunction: () =>
                        Navigator.of(context).pushNamed(AppRoutes.signInScreen),
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
              top: 100,
              left: 10,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios_rounded)),
            )
          ],
        ),
      ),
    );
  }
}
