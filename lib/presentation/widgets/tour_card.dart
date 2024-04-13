import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';

class TourCard extends StatelessWidget {
  final TourEntity tour;

  const TourCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        image: const DecorationImage(
          image: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/d9f0/f9a4/0b9907df480b626dd3a8dd032c8292df?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hn~SY2KsXdCVLa4ZnMt0Gey6ddMJPjLLbHP4w47zbQJK2AY~vRad6y8aS2uKP9lbF4z9RiuFRj24z4fo2TvL9jSx7XWgMn2qFFykghxHQPOTUditH0r5KRCIqC8VGTFsGsuIjdO6IIpzKP7nPGK7w9nBT0ZIZHyw5UwQLroBhx1HqOwcDLb2YfkFYDrOCHP~hlkgp1O3G7D3S4nCnkavcwOMouv8TFCnNg9hKvkKiYNTL13nnlLy3yxcRltpKcq2jzTyisW4nr-SxAkbak30XB~4MDaIHKswOuX-5D4Cv1XW6kdilYF-mTZBOPBIwxVkwg2jRswl0FWQRbeOj9WGZw__'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(19),
              bottomRight: Radius.circular(19),
            ),
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.black
                        .withOpacity(0.4), // Замените на нужный вам цвет
                    BlendMode.multiply,
                  ),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(19),
                        bottomRight: Radius.circular(19),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Northern Mountain',
                      style: AppFonts.s20Sem.copyWith(color: AppColors.white)),
                ),
              ],
            ),
          )),
    );
  }
}
