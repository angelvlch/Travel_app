import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_network/image_network.dart';

import 'package:travel_app/core/constants/app_colors.dart';

import 'package:travel_app/domain/entity/tour_entity.dart';
import 'package:travel_app/presentation/place_screen.dart';

class TourCard extends StatelessWidget {
  final TourEntity tour;
  final TextStyle font;
  final double radius;

  const TourCard({
    super.key,
    required this.tour,
    required this.font,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageNetwork(
          borderRadius: BorderRadius.circular(radius),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaceScreen(tour: tour),
            ),
          ),
          image:
              'https://s3-alpha-sig.figma.com/img/d9f0/f9a4/0b9907df480b626dd3a8dd032c8292df?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hn~SY2KsXdCVLa4ZnMt0Gey6ddMJPjLLbHP4w47zbQJK2AY~vRad6y8aS2uKP9lbF4z9RiuFRj24z4fo2TvL9jSx7XWgMn2qFFykghxHQPOTUditH0r5KRCIqC8VGTFsGsuIjdO6IIpzKP7nPGK7w9nBT0ZIZHyw5UwQLroBhx1HqOwcDLb2YfkFYDrOCHP~hlkgp1O3G7D3S4nCnkavcwOMouv8TFCnNg9hKvkKiYNTL13nnlLy3yxcRltpKcq2jzTyisW4nr-SxAkbak30XB~4MDaIHKswOuX-5D4Cv1XW6kdilYF-mTZBOPBIwxVkwg2jRswl0FWQRbeOj9WGZw__',
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
        /*Container(
          alignment: Alignment.centerLeft,
          height: 60,
          padding: const EdgeInsets.only(left: 16),
          child: Text('Northern Mountain',
              style: font.copyWith(color: AppColors.white)),
        ), */
      ],
    );
  }
}
