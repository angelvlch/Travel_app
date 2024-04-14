import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/config/route/routes.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';
import 'package:travel_app/presentation/place_screen.dart';
import 'package:travel_app/presentation/widgets/category_dot.dart';

import 'package:travel_app/presentation/widgets/dots_indicator.dart';
import 'package:travel_app/presentation/widgets/tour_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final categories = [
    'Popular',
    'Featured',
    'Most Visited',
    'Europe',
    'Asia',
  ];
  List<TourEntity> tours = [
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
    TourEntity(
      name: 'noname',
    ),
  ];
  int _selectedCategory = 0;
  int _currentTour = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('Discover', style: AppFonts.s32Black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: _createListDots(),
            ),
            const SizedBox(height: 14),
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8),
              child: _createCarousel(),
            ),
            const SizedBox(height: 16),
            _createDotsIndicator(),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Recommended',
                  style: AppFonts.s20Black.copyWith(color: AppColors.black)),
            ),
            const SizedBox(height: 18),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 13, mainAxisSpacing: 13),
              itemCount: tours.length,
              itemBuilder: (context, index) => _buildGrid(tours[index]),
            ),
          ],
        ),
      ),
    );
  }

  PageView _createCarousel() {
    return PageView.builder(
      padEnds: false,
      itemCount: tours.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: TourCard(
          radius: 19.0,
          font: AppFonts.s20Sem,
          tour: tours[index],
        ),
      ),
      pageSnapping: true,
      controller: PageController(
          initialPage: 0, viewportFraction: 0.99, keepPage: false),
      onPageChanged: (index) => setState(
        () {
          _currentTour = index;
        },
      ),
    );
  }

  ListView _createListDots() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 11, right: 11),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryDot(
          title: categories[index],
          isActive: _selectedCategory == index,
          onTap: () {
            setState(() {
              _selectedCategory = index;
            });
          },
        );
      },
    );
  }

  Widget _createDotsIndicator() {
    return DotsIndicator(
      length: tours.length,
      currentTour: _currentTour,
      activeColor: AppColors.dotColor,
      unActiveColor: AppColors.unActDotColor,
    );
  }

  Widget _buildGrid(TourEntity tour) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlaceScreen(tour: tour),
        ),
      ),
      child: TourCard(
        tour: tour,
        font: AppFonts.s14Sem,
        radius: 10,
      ),
    );
  }
}
