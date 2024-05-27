import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/screens/home_screen.dart';
import 'package:baller/src/presentation/screens/match_detail_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const homeScreen = "/home-screen";
  static const matchDetailScreen = "/match-detail-screen";

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    late MaterialPageRoute materialPageRoute;

    switch(routeSettings.name) {
      case homeScreen:
        materialPageRoute =  MaterialPageRoute(builder: (_) => const HomeScreen());
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