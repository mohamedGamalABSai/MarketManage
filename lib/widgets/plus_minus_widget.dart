import 'package:flutter/material.dart';

class PlusMinusCart extends StatelessWidget {
  const PlusMinusCart(
      {required this.count,
      required this.oldPrice,
      required this.newPrice,
      required this.onTapMinus,
      required this.onTapPlus,
      super.key});

  final int count;
  final double oldPrice;
  final double newPrice;
  final void Function() onTapPlus;
  final void Function() onTapMinus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTapMinus,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            child: const Icon(
              Icons.remove,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('$count'),
        ),
        GestureDetector(
          onTap: onTapPlus,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            child: const Icon(Icons.add, size: 20),
          ),
        )
      ],
    );
  }
}