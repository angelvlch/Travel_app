import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';

class CategoryDot extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool isActive;

  const CategoryDot(
      {super.key,
      required this.onTap,
      required this.isActive,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTapUp: (details) {
          onTap();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: isActive
                    ? AppFonts.s16Bold.copyWith(color: AppColors.primary)
                    : AppFonts.s16Reg.copyWith(color: AppColors.black),
              ),
            ),
            if (isActive)
              Container(
                width: 7,
                height: 7,
                decoration: const ShapeDecoration(
                  color: AppColors.primary,
                  shape: OvalBorder(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
