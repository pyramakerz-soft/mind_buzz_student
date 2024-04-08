import 'package:flutter/material.dart';

class BoxCustomPainter extends CustomPainter {
  final Color color;
  final Color boarderColor;
  Path path0(Size size){
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1447368, size.height * 0.9418605);
    path_0.lineTo(size.width * 0.1447368, size.height * 0.3720930);
    path_0.lineTo(size.width * 0.01473276, size.height * 0.07099372);
    path_0.lineTo(size.width * 0.01473197, size.height * 0.7558140);
    path_0.lineTo(size.width * 0.1447368, size.height * 0.9418605);
    path_0.close();
    return path_0;
  }
  Path path1(Size size){
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1578947, size.height * 0.3720930);
    path_1.lineTo(size.width * 0.9736842, size.height * 0.3720930);
    path_1.lineTo(size.width * 0.8618421, size.height * 0.03488372);
    path_1.lineTo(size.width * 0.02328974, size.height * 0.03488372);
    path_1.lineTo(size.width * 0.1578947, size.height * 0.3720930);
    path_1.close();
    return path_1;
  }
  Path path2(Size size){
    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9815526, size.height * 0.9604651);
    path_2.lineTo(size.width * 0.9815526, size.height * 0.4050233);
    path_2.lineTo(size.width * 0.1631566, size.height * 0.4050233);
    path_2.lineTo(size.width * 0.1631566, size.height * 0.9604651);
    path_2.lineTo(size.width * 0.9815526, size.height * 0.9604651);
    path_2.close();
    return path_2;
  }

  BoxCustomPainter({required this.boarderColor, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = path0(size);
    Path path_1 = path1(size);
    Path path_2 = path2(size);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01973684;
    paint0Stroke.color = boarderColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01973684;
    paint1Stroke.color = boarderColor.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01973684;
    paint2Stroke.color = boarderColor.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
