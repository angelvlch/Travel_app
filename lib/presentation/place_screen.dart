import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';

import 'package:travel_app/domain/entity/tour_entity.dart';

class PlaceScreen extends StatefulWidget {
  final TourEntity tour;
  const PlaceScreen({super.key, required this.tour});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  List<Map> reviews = [
    {
      'foto': 'assets/icons/ava.svg',
      'name': 'name',
      'text':
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    },
    {
      'foto': 'assets/icons/avatar.svg',
      'name': 'name',
      'text':
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    },
    {
      'foto': 'assets/icons/avatar.svg',
      'name': 'name',
      'text':
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    },
  ];

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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(36)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 24),
                        child: Text('Mount Fuji', style: AppFonts.s32Black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(Icons.location_on_outlined, weight: 14),
                          const SizedBox(width: 8),
                          Text(
                            'Honshu, Japan',
                            style: AppFonts.s12Med
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text('Description', style: AppFonts.s20Sem),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
                            style: AppFonts.s16Reg),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16, top: 22),
                          child: Text('Reviews', style: AppFonts.s20Sem)),
                      Column(
                          children: List<Widget>.generate(reviews.length,
                              (index) => _createReview(reviews[index]))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color:AppColors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
             

              child: Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.primary)),
                  onPressed: () {},
                  child: Text(
                    'Book Now',
                    style: AppFonts.s18Med.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _createReview(Map review) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.face_5),
              const SizedBox(
                width: 8,
              ),
              Text(review['name'], style: AppFonts.s16Med),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(review['text'], style: AppFonts.s16Med),
        ],
      ),
    );
  }
}
