import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';


import 'package:path_drawing/path_drawing.dart';
// class DottedLinePainter extends CustomPainter {
//   final List<Offset> listOfPoints;
//
//   DottedLinePainter({required this.listOfPoints});
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;
//
//     final positions = <Offset>[];
//
//     for (var element in listOfPoints) {
//       positions.add(element);
//     }
//     for (var i = 0; i < positions.length - 1; i++) {
//       drawDottedLine(canvas, Offset(positions[i].dx, positions[i].dy),
//           Offset(positions[i + 1].dx, positions[i + 1].dy), paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
//
//   void drawDottedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
//     final distance = end - start;
//     const double dotsDistance = 5;
//     final int numberOfDots = (distance.distance / dotsDistance).floor();
//
//     for (int i = 0; i <= numberOfDots; i++) {
//       final dotPosition =
//           start + (distance / double.parse("$numberOfDots")) * i.toDouble();
//       canvas.drawCircle(dotPosition, 1, paint);
//     }
//   }
// }


class ZigzagPainter extends CustomPainter {
  final List<Offset> listOfPoints;
  ZigzagPainter({required this.listOfPoints});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double width = size.width;
    final double height = size.height;
    final double curveHeight = listOfPoints.last.dy * 0.33;

    Path path = Path();

    // Starting point
    path.moveTo(width * 0.4, 0);

    // // First curve
    // path.quadraticBezierTo(width * 1.1, width * 0.8, width * 0.65, curveHeight);
    //
    // // Second curve
    // path.quadraticBezierTo(
    //     0, curveHeight * 1.6, width * 0.72, curveHeight * 2.47);
    //
    // // Third curve
    // path.quadraticBezierTo(
    //     width * 0.86, height / 1.4 , width / 2.6, curveHeight * 3.1 );
    //
    // // Fourth curve
    // path.quadraticBezierTo(-50 , height / 1.1, width / 2, curveHeight * 4 );


    // First curve
    path.quadraticBezierTo(
        width / 1.1, curveHeight / 1.7, width * 0.4, curveHeight);

    // Second curve
    path.quadraticBezierTo(
        -width / 4.4, curveHeight / 0.7, width * 0.4, curveHeight * 2);

    // Third curve
    path.quadraticBezierTo(
        width / 1.1, curveHeight / 0.4, width * 0.4, curveHeight * 3);

    // Fourth curve
    path.quadraticBezierTo(
        -width / 4.4, curveHeight / 0.2, width * 0.4, curveHeight * 4);


    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
      ),
      paint,
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



