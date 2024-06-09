import 'package:flutter/material.dart';

import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/features/boarding/presentation/view/boarding_screen.dart';
import 'package:travel_app/features/main/presentation/view/main_screen.dart';
import 'package:travel_app/features/place/presentation/view/place_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Widget Function(BuildContext)> get _getRoute {
    return {
      '/': (context) => const BoardingScreen(),
      '/home': (context) => const MainScreen(),
      'detail': (context) => const PlaceScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _getRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
      ),
    );
  }
}
