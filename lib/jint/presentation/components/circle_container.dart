import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double start;
  final double y;
  final double heightRatio;
  final double widthRatio;
  final Color color;

  const CircleContainer({
    super.key,
    required this.start,
    required this.y,
    required this.heightRatio,
    required this.widthRatio,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double circleHeight = MediaQuery.of(context).size.width / heightRatio;
    final double circleWidth = MediaQuery.of(context).size.width / widthRatio;

    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: circleHeight,
        width: circleWidth,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
