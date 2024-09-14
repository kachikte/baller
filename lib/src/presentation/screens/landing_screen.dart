import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/presentation/providers/home_provider.dart';
import 'package:baller/src/presentation/screens/arena_screen.dart';
import 'package:baller/src/presentation/screens/booking_home_screen.dart';
import 'package:baller/src/presentation/screens/dashboard_screen.dart';
import 'package:baller/src/presentation/screens/favorite_screen.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    BookingHomeScreen(),
    ArenaScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeIndex = ref.watch(homeProvider);

    return Scaffold(
      body: screens[homeIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(
                homeIndex == 0
                    ? AppImages.homeActivePng
                    : AppImages.dashboardPng,
                homeIndex == 0),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                homeIndex == 1
                    ? AppImages.bookingActivePng
                    : AppImages.bookingsPng,
                homeIndex == 1),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                homeIndex == 2 ? AppImages.arenaActivePng : AppImages.arenaPng,
                homeIndex == 2),
            label: 'Arenas',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                homeIndex == 3
                    ? AppImages.favoriteActivePng
                    : AppImages.favoriteTabPng,
                homeIndex == 3),
            label: 'Favorites',
          ),
        ],
        currentIndex: homeIndex,
        onTap: setIndex,
        selectedItemColor: AppColors.appGreen,
        unselectedItemColor: AppColors.primaryBackgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildIcon(String asset, bool isSelected) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.appGreen : AppColors.primaryBackgroundColor,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        asset,
        width: 24,
        height: 24,
      ),
    );
  }
}
