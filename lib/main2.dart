import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Draw S Shape')),
        body: DrawInsideShape(),
      ),
    );
  }
}

class DrawInsideShape extends StatefulWidget {
  @override
  _DrawInsideShapeState createState() => _DrawInsideShapeState();
}

class _DrawInsideShapeState extends State<DrawInsideShape> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          points.add(renderBox.globalToLocal(details.globalPosition));
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(Offset.zero); // To indicate the end of drawing.
        });
      },
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: RPSCustomPainter(points),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final List<Offset> points;
  RPSCustomPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Path sShape = Path();
    sShape.moveTo(118.52, 310);
    sShape.cubicTo(80.2562, 310, 44.4246, 299.461, 10.7008, 278.222);
    sShape.cubicTo(3.56691, 273.682, 0, 267.035, 0, 258.441);
    sShape.cubicTo(0, 247.416, 7.13387, 232.014, 21.5638, 211.909);
    sShape.cubicTo(25.7793, 205.424, 32.1025, 202.343, 40.8577, 202.343);
    sShape.cubicTo(50.7479, 202.343, 62.2594, 206.234, 75.3923, 214.179);
    sShape.cubicTo(93.8755, 224.718, 109.602, 230.068, 122.573, 230.068);
    sShape.cubicTo(145.596, 230.068, 157.108, 225.528, 157.108, 216.449);
    sShape.cubicTo(157.108, 212.72, 153.541, 209.477, 146.245, 206.721);
    sShape.cubicTo(139.111, 204.127, 130.031, 202.019, 119.006, 200.397);
    sShape.cubicTo(107.981, 198.938, 96.1454, 195.696, 83.4989, 190.994);
    sShape.cubicTo(70.8525, 186.292, 59.0167, 180.455, 47.9916, 173.645);
    sShape.cubicTo(36.9665, 166.836, 27.887, 156.135, 20.7531, 141.543);
    sShape.cubicTo(13.6192, 126.951, 9.89013, 109.602, 9.89013, 89.66);
    sShape.cubicTo(9.89013, 29.8326, 50.91, -1.52588, 118.52, -1.52588);
    sShape.cubicTo(160.026, -1.52588, 187.589, 6.48533, 215.962, 19.2939);
    sShape.cubicTo(229.257, 25.2929, 235.743, 33.7238, 235.743, 44.2625);
    sShape.cubicTo(235.743, 51.8828, 231.689, 62.0973, 223.907, 74.9058);
    sShape.cubicTo(215.152, 88.5251, 206.559, 95.3347, 197.803, 95.3347);
    sShape.cubicTo(193.264, 95.3347, 186.778, 93.3891, 178.509, 89.66);
    sShape.cubicTo(162.296, 82.0397, 146.893, 78.3106, 132.463, 78.3106);
    sShape.cubicTo(110.089, 78.3106, 99.0638, 82.5261, 99.0638, 90.795);
    sShape.cubicTo(99.0638, 96.7939, 102.793, 101.658, 110.089, 105.225);
    sShape.cubicTo(117.547, 108.792, 126.789, 111.224, 137.976, 112.683);
    sShape.cubicTo(149.163, 113.98, 161.161, 116.574, 173.97, 120.303);
    sShape.cubicTo(186.778, 124.032, 198.776, 128.734, 209.963, 134.247);
    sShape.cubicTo(221.151, 139.759, 230.392, 149.001, 237.85, 161.972);
    sShape.cubicTo(245.309, 175.105, 248.876, 190.994, 248.876, 209.963);
    sShape.cubicTo(248.876, 230.392, 245.146, 247.578, 237.85, 261.36);
    sShape.cubicTo(230.554, 275.141, 220.016, 285.356, 206.721, 292.003);
    sShape.cubicTo(193.264, 298.651, 179.644, 303.19, 165.863, 305.947);
    sShape.cubicTo(152.244, 308.703, 136.355, 310, 118.52, 310);
    sShape.close();

    Paint sShapeFilledPaint = Paint()..style = PaintingStyle.fill;
    sShapeFilledPaint.color = const Color(0xff4D7F97).withOpacity(1.0);
    canvas.drawPath(sShape, sShapeFilledPaint);

    Paint userPainting = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.lightBlue;
    Rect bounds = sShape.getBounds();
    double width = bounds.width / 2.5;
    double height = bounds.height / 2.5;

    for (int i = 0; i < points.length; i++) {
      Offset point = points[i];
      if (point != Offset.zero) {
        if (sShape.contains(point)) {
          canvas.save();
          canvas.clipPath(sShape);
          if (bounds.contains(point)) {
            canvas.drawOval(
              Rect.fromCenter(center: point, width: width, height: height),
              userPainting,
            );
          }
          canvas.restore();
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}