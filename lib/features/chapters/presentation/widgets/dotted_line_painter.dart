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


// class ZigzagPainter extends CustomPainter {
//   final List<Offset> listOfPoints;
//   ZigzagPainter({required this.listOfPoints});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     final double width = size.width;
//     final double height = size.height;
//     final double curveHeight = 1222 * 0.33;
//
//     Path path = Path();
//
//     // Starting point
//     path.moveTo(width * 0.4, 0);
//
//     // // First curve
//     // path.quadraticBezierTo(width * 1.1, width * 0.8, width * 0.65, curveHeight);
//     //
//     // // Second curve
//     // path.quadraticBezierTo(
//     //     0, curveHeight * 1.6, width * 0.72, curveHeight * 2.47);
//     //
//     // // Third curve
//     // path.quadraticBezierTo(
//     //     width * 0.86, height / 1.4 , width / 2.6, curveHeight * 3.1 );
//     //
//     // // Fourth curve
//     // path.quadraticBezierTo(-50 , height / 1.1, width / 2, curveHeight * 4 );
//
//
//     // First curve
//     path.quadraticBezierTo(
//         width / 1.1, 250 , width * 0.4, curveHeight);
//
//     // Second curve
//     path.quadraticBezierTo(
//         -width / 4.4, 600 , width * 0.4, curveHeight * 2);
//
//     // Third curve
//     path.quadraticBezierTo(
//         width / 1.1, 1000, width * 0.4, curveHeight * 3);
//
//     // Fourth curve
//     path.quadraticBezierTo(
//         -width / 4.4, 1450, width * 0.4, curveHeight * 4.2);
//
//     path.quadraticBezierTo(
//         width / 1.1, 1950, width * 0.4, curveHeight * 5);
//
//
//     canvas.drawPath(
//       dashPath(
//         path,
//         dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
//       ),
//       paint,
//     );
//   }
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

class ZigzagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4 // Width of the stroke
      ..style = PaintingStyle.stroke; // Stroke style

    double waveWidth = size.width / 3; // Width of each wave
    double halfWaveWidth = waveWidth / 2;

    Path path = Path();

    path.moveTo(0, size.height);

    // Create wider and curved top and bottom waves using cubic Bézier curves
    for (double y = size.height; y >= 0; y -= 100) {
      path.cubicTo(
        waveWidth / 8, y - 3 * halfWaveWidth, // Control point 1 for top curve
        waveWidth / 4, y - 2 * halfWaveWidth, // Control point 2 for top curve
        waveWidth / 2, y - halfWaveWidth, // End point for top curve
      );

      path.cubicTo(
        waveWidth, y - halfWaveWidth, // Control point 1 for bottom curve
        3 * waveWidth / 2, y - 2 * halfWaveWidth, // Control point 2 for bottom curve
        2 * waveWidth, y - 3 * halfWaveWidth, // End point for bottom curve
      );

      path.cubicTo(
        5 * waveWidth / 2, y - 2 * halfWaveWidth, // Control point 1 for top curve
        3 * waveWidth, y - halfWaveWidth, // Control point 2 for top curve
        7 * waveWidth / 2, y, // End point for top curve
      );

      path.cubicTo(
        4 * waveWidth, y + halfWaveWidth, // Control point 1 for bottom curve
        9 * waveWidth / 4, y + halfWaveWidth, // Control point 2 for bottom curve
        5 * waveWidth / 2, y + 2 * halfWaveWidth, // End point for bottom curve
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
