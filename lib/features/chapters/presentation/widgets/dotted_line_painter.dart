import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final List<Offset> listOfPoints;

  DottedLinePainter({required this.listOfPoints});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final positions = <Offset>[];

    for (var element in listOfPoints) {
      positions.add(element);
    }
    for (var i = 0; i < positions.length - 1; i++) {
      drawDottedLine(canvas, Offset(positions[i].dx + 50, positions[i].dy + 50),
          Offset(positions[i + 1].dx + 50, positions[i + 1].dy + 50), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawDottedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    final distance = end - start;
    const double dotsDistance = 5;
    final int numberOfDots = (distance.distance / dotsDistance).floor();

    for (int i = 0; i <= numberOfDots; i++) {
      final dotPosition =
          start + (distance / double.parse("$numberOfDots")) * i.toDouble();
      canvas.drawCircle(dotPosition, 1, paint);
    }
  }
}
