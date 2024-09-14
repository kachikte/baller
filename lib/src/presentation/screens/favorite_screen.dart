import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Favorites',
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
              const SizedBox(
                height: 10,
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
                height: 20,
              ),
              SizedBox(
                height: height,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    // return const FieldsWidget();
                    return GestureDetector(
                        onTap: navigateToArenaDetails,
                        child: const FullFeaturedFieldsWidget(
                          bookmark: true,
                        ));
                  },
                  itemCount: 4,
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
