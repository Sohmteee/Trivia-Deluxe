import 'package:flutter/material.dart';

class CircleBorderPainter extends CustomPainter {
  Color color;
  double radius, angle;

  CircleBorderPainter({
    required this.color,
    required this.radius,
    this.angle = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final circle = Paint()
      ..color = color
      ..style = PaintingStyle.stroke;
    final arcRect =
        Rect.fromCircle(center: size.bottomCenter(Offset.zero), radius: radius);
    canvas.drawArc(arcRect, 0, angle, false, circle);
  }

  @override
  bool shouldRepaint(CircleBorderPainter oldDelegate) => false;
}
