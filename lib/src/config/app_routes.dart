import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/screens/forgot_password_screen.dart';
import 'package:baller/src/presentation/screens/new_password.dart';
import 'package:baller/src/presentation/screens/screens.dart';
import 'package:baller/src/presentation/screens/verify_account_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const exploreScreen = "/explore-screen";
  static const signInScreen = "/sign-in-screen";
  static const signUpScreen = "/sign-up-screen";
  static const signUpTypeScreen = "/sign-up-type-screen";
  static const newPasswordScreen = "/new-password-screen";
  static const verifyAccountScreen = "/verify-account-screen";
  static const homeScreen = "/home-screen";
  static const matchDetailScreen = "/match-detail-screen";
  static const forgotPasswordScreen = "/forgot-password-screen";
  static const pinSetupScreen = "/pin-setup-screen";
  static const newPinScreen = "/new-pin-screen";
  static const pinSigninScreen = "/pin-signin-screen";
  static const dashboardScreen = "/dashboard-screen";
  static const landingScreen = "/landing-screen";
  static const profileScreen = "/profile-screen";
  static const editProfileScreen = "/edit-profile-screen";
  static const editPasswordScreen = "/edit-password-screen";
  static const editPinIntroScreen = "/edit-pin-intro-screen";
  static const notificationSettingScreen = "/notification-setting-screen";
  static const privacySettingsScreen = "/privacy-settings-screen";
  static const arenaScreen = '/arena-screen';
  static const arenaDetailsScreen = '/arena-details-screen';
  static const bookingScreen = '/booking-screen';
  static const bookingHomeScreen = '/booking-home-screen';
  static const bookingReviewScreen = '/booking-review-screen';
  static const paymentScreen = '/payment-screen';
  static const favoriteScreen = '/favorite-screen';
  static const bookingDetailScreen = '/booking-detail-screen';
  static const transactionSuccessfulScreen = '/transaction-successful-screen';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    late MaterialPageRoute materialPageRoute;

    switch (routeSettings.name) {
      case exploreScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const ExploreScreen());
      case signInScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUpScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const SignUpScreen());
      case signUpTypeScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const SignUpTypeScreen());
      case newPasswordScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      case verifyAccountScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        materialPageRoute = MaterialPageRoute(
            builder: (_) => VerifyAccountScreen(
                  val: args,
                ));
      case homeScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const HomeScreen());
        break;
      case forgotPasswordScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
        break;
      case pinSetupScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const PinSetupScreen());
        break;
      case newPinScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const NewPinScreen());
        break;
      case pinSigninScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const PinSigninScreen());
        break;
      case dashboardScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const DashboardScreen());
        break;
      case landingScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const LandingScreen());
        break;
      case profileScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const ProfileScreen());
        break;
      case editProfileScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const EditProfileScreen());
        break;
      case editPasswordScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const EditPasswordScreen());
        break;
      case editPinIntroScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const EditPinIntroScreen());
        break;
      case notificationSettingScreen:
        materialPageRoute = MaterialPageRoute(
            builder: (_) => const NotificationSettingScreen());
        break;
      case privacySettingsScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const PrivacySettingsScreen());
        break;
      case arenaScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const ArenaScreen());
        break;
      case arenaDetailsScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const ArenaDetailsScreen());
        break;
      case bookingScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const BookingsScreen());
        break;
      case bookingHomeScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const BookingHomeScreen());
        break;
      case bookingReviewScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const BookingReviewScreen());
        break;
      case paymentScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const PaymentScreen());
        break;
      case transactionSuccessfulScreen:
        materialPageRoute = MaterialPageRoute(
            builder: (_) => const TransactionSuccessfulScreen());
        break;
      case favoriteScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const FavoriteScreen());
        break;
      case bookingDetailScreen:
        materialPageRoute =
            MaterialPageRoute(builder: (_) => const BookingDetailScreen());
        break;
      case matchDetailScreen:
        materialPageRoute = MaterialPageRoute(
          builder: (_) {
            final args = routeSettings.arguments as SingleMatchModel;
            return MatchDetailScreen(
              singleMatchModel: args,
            );
          },
        );
        break;
    }

    return materialPageRoute;
  }
}
