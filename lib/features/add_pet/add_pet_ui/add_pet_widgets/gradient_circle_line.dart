import 'package:flutter/material.dart';

class GradientCircleLine extends StatelessWidget {
  const GradientCircleLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.white, Color(0xffC4C4C4), Colors.white])),
    );
  }
}
