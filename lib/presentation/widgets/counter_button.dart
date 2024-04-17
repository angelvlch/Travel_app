import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 200, 175, 173),
              child: Text('-'),
            ),
          ),
          Text('$count'),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 225, 197, 195),
              child: Text('-'),
            ),
          ),
        ],
      ),
    );
  }
}
