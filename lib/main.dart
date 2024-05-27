import 'package:baller/src/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/config/app_theme.dart';
import 'package:baller/src/utils/constants.dart';

import 'navigator_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: AppTheme.setThemeMode(isLight: true),
      home: const HomeScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
