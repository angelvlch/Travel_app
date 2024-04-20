import 'package:flutter/material.dart';
import 'package:travel_app/config/route/app_router.dart';
import 'package:travel_app/core/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRouter appRouter = AppRouter();
  /* get _routes {
    return {
      Routes.boardScreen: (context) => const EnterScreen(),
      Routes.mainScreen: (context) => const MainScreen(),
    };
  } */

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      // routes: _routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
      ),
    );
  }
}
