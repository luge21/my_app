import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello World!",
      style: TextStyle
      (fontSize: 18,
       fontStyle: FontStyle.normal,
       )),
    );
  }
}
