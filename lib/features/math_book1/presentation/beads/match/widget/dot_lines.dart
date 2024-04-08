import 'package:flutter/material.dart';

class DottedLinePainterOfMatch extends CustomPainter {
  final Offset? firstPosition;
  final Offset? secondPosition;

  DottedLinePainterOfMatch(this.firstPosition, this.secondPosition);
  @override
  void paint(Canvas canvas, Size size) {
    if (firstPosition != null && secondPosition != null) {

      final paint = Paint()
        ..color = Colors.black
        ..strokeWidth = 2;

      // final positions = <Offset>[];

      // for (var element in listOfPoints) {
      //   positions.add(element);
      // }
      // for (var i = 0; i < positions.length - 1; i++) {
      drawDottedLine(canvas, Offset(firstPosition!.dx, firstPosition!.dy),
          Offset(secondPosition!.dx, secondPosition!.dy), paint);
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