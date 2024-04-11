import 'package:flutter/material.dart';
import 'package:travel_app/config/route/routes.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/presentation/enter_screen.dart';
import 'package:travel_app/presentation/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get _routes {
    return {
      Routes.screenSaver: (context) => const EnterScreen(),
      Routes.mainScreen: (context) => const MainScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
      ),
    );
  }
}
