import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final length;
  final currentTour;
  final activeColor, unActiveColor;

  const DotsIndicator(
      {super.key,
      this.length,
      this.currentTour,
      this.activeColor,
      this.unActiveColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: currentTour == index
                ? Container(
                    width: 23,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: activeColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  )
                : Container(
                    width: 6,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: unActiveColor,
                      shape: const OvalBorder(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
