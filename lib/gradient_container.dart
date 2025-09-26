import 'package:flutter/material.dart';
import 'package:my_app/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  final startAlignment = Alignment.topLeft;
  final endAlignment = Alignment.bottomRight;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 21, 255),
            Color.fromARGB(255, 0, 3, 38),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const DiceRoller(), 
    );
  }
}
