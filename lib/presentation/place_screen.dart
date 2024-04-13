import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/core/constants/app_icon.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';

class PlaceScreen extends StatefulWidget {
  final TourEntity tour;
  const PlaceScreen({super.key, required this.tour});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/53f0/a2d9/7918d6643e5e010ee92c558f998a4488?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BXZQyQ9OVazMU2vpO3vg3qBYerpCY-DjZY2fSfTwD0sDaNhwS5zsXFofK56wZTZPQKsvTU9O3Yl5SS0avH-kE1gVKvkFqPvKCVrnKqgq5aeJEgvusYPcTEa67-hR34VI~zJcK8ZrFoml5D3m7FhCn~YXbXOE6OfjHuL7YiczpIWmHFuEwOLaghDc74PHfB-hoirGZrf6Yj6uVVFTC93698pKSIYui9m3wvfcxR0bYhl8iqAydCKU22oDxspWi3QFp0kniXn6Q2xLzovCs8cDiuVDTaVVt4q4IXq1NT397bRiapJ8Q6h6N42jWiImIS9sptA2tBThikmUFgVLRt-MFQ__'),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              label: Text(
                'Back',
                style: AppFonts.s16Reg.copyWith(color: AppColors.white),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 198, 196),
                  borderRadius: BorderRadius.circular(36)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 59, 45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
