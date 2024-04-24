import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_network/image_network.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';

class TourCard extends StatelessWidget {
  final TourEntity tour;
  final TextStyle font;
  final double radius;
  final Function onTap;

  const TourCard({
    super.key,
    required this.tour,
    required this.font,
    required this.radius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => onTap(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(
                tour.photo!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColors.black.withOpacity(0.7),
                BlendMode.multiply,
              ),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.03),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 60,
            padding: const EdgeInsets.only(left: 16),
            child:
                Text(tour.name!, style: font.copyWith(color: AppColors.white)),
          ),
        ),
      ],
    );
  }
}
