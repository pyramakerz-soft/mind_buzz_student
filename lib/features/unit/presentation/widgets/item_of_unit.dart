import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color currentColor;

  RPSCustomPainter({required this.currentColor});
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9091667,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,0);
    path_0.lineTo(size.width*0.9091667,0);
    path_0.lineTo(size.width,size.height*0.5000000);
    path_0.lineTo(size.width*0.9091667,size.height);
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