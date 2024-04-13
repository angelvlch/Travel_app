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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
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
                        _selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            categories[index],
                            style: _selectedIndex == index
                                ? AppFonts.s16Bold
                                    .copyWith(color: AppColors.primary)
                                : AppFonts.s16Reg
                                    .copyWith(color: AppColors.black),
                          ),
                        ),
                        if (_selectedIndex == index)
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
          TourCard(tour: tours.first),
        ],
      ),
    );
  }
}
