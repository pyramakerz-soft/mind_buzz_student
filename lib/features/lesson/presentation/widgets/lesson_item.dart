import 'package:flutter/material.dart';

class LessonItemPainter extends CustomPainter {
  final Color currentColor;

  LessonItemPainter({required this.currentColor});

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7953445,size.height*0.9215686);
    path_0.lineTo(size.width*0.01028278,size.height*0.9215686);
    path_0.lineTo(size.width*0.01028278,0);
    path_0.lineTo(size.width*0.9368380,0);
    path_0.cubicTo(size.width*0.9459229,size.height*0.000004000216,size.width*0.9548535,size.height*0.005705569,size.width*0.9627686,size.height*0.01655510);
    path_0.cubicTo(size.width*0.9706838,size.height*0.02740471,size.width*0.9773188,size.height*0.04303667,size.width*0.9820334,size.height*0.06194471);
    path_0.cubicTo(size.width*0.9867481,size.height*0.08085284,size.width*0.9893856,size.height*0.1024000,size.width*0.9896889,size.height*0.1245088);
    path_0.cubicTo(size.width*0.9899897,size.height*0.1466186,size.width*0.9879512,size.height*0.1685451,size.width*0.9837635,size.height*0.1881765);
    path_0.lineTo(size.width*0.8421388,size.height*0.8521392);
    path_0.cubicTo(size.width*0.8376812,size.height*0.8730039,size.width*0.8309640,size.height*0.8905020,size.width*0.8227147,size.height*0.9027392);
    path_0.cubicTo(size.width*0.8144679,size.height*0.9149775,size.width*0.8050026,size.height*0.9214882,size.width*0.7953445,size.height*0.9215686);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = currentColor.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}