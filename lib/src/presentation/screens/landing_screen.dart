import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/presentation/providers/home_provider.dart';
import 'package:baller/src/presentation/screens/arena_screen.dart';
import 'package:baller/src/presentation/screens/dashboard_screen.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  setIndex(int index) {
    ref.read(homeProvider.notifier).state = index;
  }

  static const List screens = [
    DashboardScreen(),
    DashboardScreen(),
    ArenaScreen(),
    DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeIndex = ref.watch(homeProvider);

    return Scaffold(
      body: screens[homeIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: AppColors.appBlack,
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.explore), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.favorites), label: 'Arenas'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.bookings), label: 'Favorites'),
        ],
        currentIndex: homeIndex,
        onTap: setIndex,
        selectedItemColor: AppColors.primaryColor,
      ),
    );
  }
}
