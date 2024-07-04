import 'package:flutter/material.dart';

import 'dart:ui' as ui;

// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//     final Color currentColor;

//   RPSCustomPainter({required this.currentColor});
//     @override
//     void paint(Canvas canvas, Size size) {

// Path path_0 = Path();
//     path_0.moveTo(169.473,57.1338);
//     path_0.cubicTo(167.569,60.742,163.824,63,159.744,63);
//     path_0.lineTo(11,63);
//     path_0.cubicTo(4.92486,63,0,58.0751,0,52);
//     path_0.lineTo(0,11);
//     path_0.cubicTo(0,4.92487,4.92487,0,11,0);
//     path_0.lineTo(159.744,0);
//     path_0.cubicTo(163.824,0,167.569,2.25802,169.473,5.86623);
//     path_0.lineTo(180.291,26.3662);
//     path_0.cubicTo(181.986,29.5788,181.986,33.4212,180.291,36.6338);
//     path_0.lineTo(169.473,57.1338);
//     path_0.close();

// Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
// paint_0_fill.color = currentColor.withOpacity(1.0);
// canvas.drawPath(path_0,paint_0_fill);

// }

// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
// }
// }

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final Color currentColor;
  RPSCustomPainter({required this.currentColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9311703, size.height * 0.9068857);
    path_0.cubicTo(
        size.width * 0.9207088,
        size.height * 0.9641587,
        size.width * 0.9001319,
        size.height,
        size.width * 0.8777143,
        size.height);
    path_0.lineTo(size.width * 0.06043956, size.height);
    path_0.cubicTo(size.width * 0.02705967, size.height, 0,
        size.height * 0.9218270, 0, size.height * 0.8253968);
    path_0.lineTo(0, size.height * 0.1746032);
    path_0.cubicTo(0, size.height * 0.07817254, size.width * 0.02705973, 0,
        size.width * 0.06043956, 0);
    path_0.lineTo(size.width * 0.8777143, 0);
    path_0.cubicTo(
        size.width * 0.9001319,
        0,
        size.width * 0.9207088,
        size.height * 0.03584159,
        size.width * 0.9311703,
        size.height * 0.09311476);
    path_0.lineTo(size.width * 0.9906099, size.height * 0.4185111);
    path_0.cubicTo(
        size.width * 0.9999231,
        size.height * 0.4695048,
        size.width * 0.9999231,
        size.height * 0.5304952,
        size.width * 0.9906099,
        size.height * 0.5814889);
    path_0.lineTo(size.width * 0.9311703, size.height * 0.9068857);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = currentColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//
// import 'package:flutter/material.dart';
//
// class RPSCustomPainter extends CustomPainter {
//   final Color currentColor;
//
//   RPSCustomPainter({required this.currentColor});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//
//     // Define the coordinates as per the SVG path
//     double width = size.width;
//     double height = size.height;
//     double radius = height / 3;
//
//     path.moveTo(width * 0.068, height * 0.907); // move to start of the unique side
//     path.cubicTo(width * 0.079, height * 0.964, width * 0.1, height, width * 0.122, height); // left-bottom curve
//     path.lineTo(width - radius, height); // bottom line
//     path.arcToPoint(Offset(width, height - radius), radius: Radius.circular(radius), clockwise: false); // right-bottom curve
//     path.lineTo(width, radius); // right line
//     path.arcToPoint(Offset(width - radius, 0), radius: Radius.circular(radius), clockwise: false); // right-top curve
//     path.lineTo(width * 0.122, 0); // top line
//     path.cubicTo(width * 0.1, 0, width * 0.079, height * 0.036, width * 0.068, height * 0.093); // left-top curve
//     path.lineTo(0, height * 0.419); // unique side top
//     path.lineTo(width * 0.068, height * 0.907); // unique side bottom
//     path.close();
//
//     Paint paint = Paint()..style = PaintingStyle.fill;
//     paint.color = currentColor.withOpacity(1.0);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }