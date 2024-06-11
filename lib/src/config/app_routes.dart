import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const signInScreen = "/sign-in-screen";
  static const homeScreen = "/home-screen";
  static const matchDetailScreen = "/match-detail-screen";
  static const forgotPasswordScreen = "/forgot-password-screen";
  static const pinSetupScreen = "/pin-setup-screen";


  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    late MaterialPageRoute materialPageRoute;

    switch(routeSettings.name) {
      case signInScreen:
        materialPageRoute = MaterialPageRoute(builder: (_) => const SignInScreen());
      case homeScreen:
        materialPageRoute =  MaterialPageRoute(builder: (_) => const HomeScreen());
        break;
      case forgotPasswordScreen:
        materialPageRoute =  MaterialPageRoute(builder: (_) => const PinScreen());
        break;
      case pinSetupScreen:
        materialPageRoute =  MaterialPageRoute(builder: (_) => const PinSetupScreen());
        break;
      case matchDetailScreen:
        materialPageRoute = MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as SingleMatchModel;
          return MatchDetailScreen(singleMatchModel: args,);
        }, );
        break;
    }

    return materialPageRoute;
  }
}