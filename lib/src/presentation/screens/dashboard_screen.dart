import 'package:baller/src/config/app_routes.dart';
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
    Navigator.pushNamed(
        context, AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Ballers",
              style: TextStyle(
                  color: AppColors.appBlack,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
            Text(
              "Terfa76!🎉",
              style: TextStyle(color: AppColors.appBlack),
            )
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.appBlack.withOpacity(.1),
            radius: 23,
            child: CircleAvatar(
              backgroundColor: AppColors.appWhite,
              radius: 22,
              child: Icon(Icons.notifications, color: AppColors.appBlack,),
            ),
          ),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: AppColors.appOrange.withOpacity(.3),
            radius: 23,
            child: Icon(Icons.person_outline, color: AppColors.appOrange,),
          ),
          const SizedBox(width: 10,),
        ],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreWidget(),
              GestureDetector(onTap: navigateToMatchList, child: const TitleRowWidget(leadingText: 'Featured fields', trailingText: 'View more >')),
              SizedBox(
                height: height * .17,
                child: ListView.builder(itemBuilder: (ctx, index) {
                  return const FeaturedFieldsWidget();
                }, itemCount: 2, scrollDirection: Axis.horizontal),
              ),
              GestureDetector(onTap: navigateToMatchList, child: const TitleRowWidget(leadingText: 'Fields near you', trailingText: 'View more >')),
              Expanded(
                child: ListView.separated(itemBuilder: (ctx, index) {
                  return const FieldsWidget();
                }, itemCount: 1, separatorBuilder: (context, index) {
                  return const SizedBox(height: 15,);
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
