import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/config/route/routes.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/core/constants/app_icon.dart';
import 'package:travel_app/core/constants/app_images.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  _onTap() {
    Navigator.pushNamed(context, Routes.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Winter\nVacation Trips',
                    style: AppFonts.s36Black.copyWith(height: 0)),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('''Enjoy your winter vacations with warmth
and amazing sightseeing on the mountains.
Enjoy the best experience with us!''', style: AppFonts.s16Reg),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: _onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primary),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Let’s Go!',
                        style: AppFonts.s16Reg.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      SvgPicture.asset(AppIcon.rightArrow),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(37),
        bottomRight: Radius.circular(37),
      ),
      child: Image.asset(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        AppImages.enter,
        fit: BoxFit.cover,
      ),
    );
  }
}
