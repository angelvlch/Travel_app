import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';
import 'package:travel_app/presentation/widgets/category.dart';
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
      name: 'MMM',
    ),
    TourEntity(
      name: '12',
    ),
    TourEntity(
      name: 'dsds',
    ),
    TourEntity(
      name: 'asdadsadsdd',
    ),
    TourEntity(
      name: 'MMgfggffgfgM',
    ),
    TourEntity(
      name: 'gfbbbbbbbbb',
    ),
  ];
  int _selectedCategory = 0;
  int _currentTour = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Discover', style: AppFonts.s32Black),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
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
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.2,
            width: double.infinity,
            child: PageView.builder(
              itemCount: tours.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TourCard(
                  tour: tours[index],
                ),
              ),
              pageSnapping: true,
              controller: PageController(
                  initialPage: 0, viewportFraction: 0.85, keepPage: false),
              onPageChanged: (index) => setState(
                () {
                  _currentTour = index;
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _createDotsIndicator(),
        ],
      ),
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
}
