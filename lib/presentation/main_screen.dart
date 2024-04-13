import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';
import 'package:travel_app/domain/entity/tour_entity.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('Discover', style: AppFonts.s32Black),
        ),
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
                return Container(
                  //вынести в виджет
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTapUp: (details) {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            categories[index],
                            style: _selectedCategory == index
                                ? AppFonts.s16Bold
                                    .copyWith(color: AppColors.primary)
                                : AppFonts.s16Reg
                                    .copyWith(color: AppColors.black),
                          ),
                        ),
                        if (_selectedCategory == index)
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
              },
            ),
          ),
          const SizedBox(height: 24),
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
                  initialPage: 0, viewportFraction: 0.88, keepPage: false),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(tours.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            width: 6,
            height: 6,
            decoration: ShapeDecoration(
              color: index == _currentTour
                  ? AppColors.dotColor
                  : AppColors.unActDotColor,
              shape: const OvalBorder(),
            ),
          ),
        );
      }),
    );
  }
}
