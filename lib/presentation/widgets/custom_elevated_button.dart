import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final Function content;
  final Function onTap;

  const CustomElevatedButton({
    super.key,
    required this.color,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 17, horizontal: 30),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: content(),
    );
  }
}
