import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/app_colors.dart';
import 'package:travel_app/core/constants/app_fonts.dart';

class CounterButton extends StatelessWidget {
  final int count;
  final Function setNewValue;

  const CounterButton(
      {super.key, required this.count, required this.setNewValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightGray,
      ),
      child: Row(
        children: [
          Wrap(children: [
            SizedBox(
              height: 36,
              width: 29,
              child: IconButton(
                onPressed: () {
                  if (count != 1) {
                    int newCount = count - 1;
                    setNewValue(newCount);
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  color: AppColors.white,
                  size: 15,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(count == 1
                      ? AppColors.inactive
                      : AppColors.dotColor), // изменение цвета кнопки
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '$count',
              style: AppFonts.s16Bold,
            ),
          ),
          Wrap(children: [
            SizedBox(
              height: 36,
              width: 29,
              child: IconButton(
                onPressed: () {
                  int newCount = count + 1;
                  setNewValue(newCount);
                },
                icon: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 15,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      AppColors.dotColor), // изменение цвета кнопки
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
