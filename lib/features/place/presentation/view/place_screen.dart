import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/core/constants/app_icon.dart';
import 'package:travel_app/features/main/domain/entity/tour_entity.dart';
import 'package:travel_app/features/place/presentation/view/button_sheet.dart';
import 'package:travel_app/features/widgets/custom_elevated_button.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({
    super.key,
  });

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
  String selectedValue = AppIcon.flagKg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/d9f0/f9a4/0b9907df480b626dd3a8dd032c8292df?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hpJI74VaRQD6zS~l7IAlvCtw7wzB9Hz4jWWhxML2QsM3T1N7raEn7YCaLwHgwaNn-pfO728RNXTWCjksyNqT9xKhQsO1zGAT0RtN-~HfrmS6sGpTY3XkG-IcnNAS8sYMacAF9Syuiv~reTQ57~OsR0q-YBN6Yj4PjUMPfxwmzr7j0A0TPdIMyMqjKkmef62jMsKa0guUCxISRXdvy~cWifP7kvEkw8GEdS2J0IaRRb3DLXmaMpz1k2flNH1eS~n6XH2VibPzZfePBNYo34PthMWonLRWslfjXW~J~~uxDXUsg0snH3POgjMeCHq~VLdtDsj4~aS75KSxMJ9sQcWncg__'),
                fit: BoxFit.cover,
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
              height: MediaQuery.of(context).size.height / 1.55,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(36)),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
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
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(color: AppColors.white),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: CustomElevatedButton(
                color: AppColors.primary,
                content: _createContent,
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _createContent() {
    return Text(
      'Book Now',
      style: AppFonts.s18Med.copyWith(color: AppColors.white),
    );
  }

  Future<dynamic> _createBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const ContentSheetBottom();
      },
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

  void onTap() {
    _createBottomSheet(context);
  }
}
