import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyArc extends StatelessWidget {
  final double diameter;

  MyArc({
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, 0),
        height: size.height,
        width: size.width,
      ),
      0,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}