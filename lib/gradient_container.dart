import 'package:my_app/myTextWidget.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key});
  var startAlignment = Alignment.topLeft;
  var endAlignment = Alignment.bottomRight;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 59, 15, 160),
            Color.fromARGB(255, 33, 5, 89),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
        child: MyTextWidget()
      );
  }
}
