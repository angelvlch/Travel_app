import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/config/route/app_router.gr.dart';
import 'package:travel_app/config/route/routes.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/core/constants/app_icon.dart';
import 'package:travel_app/core/constants/app_images.dart';
import 'package:travel_app/presentation/widgets/custom_elevated_button.dart';

@RoutePage()
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  void _onTap() {
    AutoRouter.of(context).push(const MainRoute());
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
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Winter\nVacation Trips',
                        style: AppFonts.s36Black.copyWith(height: 0)),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '''Enjoy your winter vacations with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!''',
                    style: AppFonts.s16Reg,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 35),
                  CustomElevatedButton(
                    color: AppColors.primary,
                    content: _createContent,
                    onTap: _onTap,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _createContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Let’s Go!',
          style: AppFonts.s16Reg
              .copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 19),
        SvgPicture.asset(AppIcon.rightArrow),
      ],
    );
  }

  ClipRRect _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(37),
        bottomRight: Radius.circular(37),
      ),
      child: Image.asset(
        height: MediaQuery.of(context).size.height / 2.1,
        width: MediaQuery.of(context).size.width,
        AppImages.enter,
        fit: BoxFit.cover,
      ),
    );
  }
}
