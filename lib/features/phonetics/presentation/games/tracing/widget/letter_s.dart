import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class FlipBookPainterLetterS extends CustomPainter {
  final List<Offset> offsets;
  FlipBookPainterLetterS(this.offsets) : super();
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColor.lightBlueColor4
      ..isAntiAlias = true
      ..strokeWidth = 60
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < offsets.length; i++) {
      if (offsets[i] != null &&
          i + 1 < offsets.length &&
          offsets[i + 1] != null) {
        canvas.drawLine(offsets[i], offsets[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RPSCustomPainterLetterS extends CustomPainter {
  static Path path0(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5224068, size.height * 0.7956818);
    path_0.cubicTo(
        size.width * 0.3974576,
        size.height * 0.7938068,
        size.width * 0.2157966,
        size.height * 0.7386080,
        size.width * 0.1363051,
        size.height * 0.6643750);
    path_0.lineTo(0, size.height * 0.8300284);
    path_0.cubicTo(
        size.width * 0.1635593,
        size.height * 0.9727557,
        size.width * 0.3407119,
        size.height * 0.9974716,
        size.width * 0.5178983,
        size.height * 0.9974716);
    path_0.cubicTo(
        size.width * 0.8381356,
        size.height * 0.9974716,
        size.width * 0.9992542,
        size.height * 0.8547443,
        size.width * 0.9992542,
        size.height * 0.6891761);
    path_0.cubicTo(
        size.width * 0.9992542,
        size.height * 0.6326705,
        size.width * 0.9856949,
        size.height * 0.5869034,
        size.width * 0.9617627,
        size.height * 0.5499716);
    path_0.cubicTo(
        size.width * 0.9021017,
        size.height * 0.6752557,
        size.width * 0.7731186,
        size.height * 0.7753409,
        size.width * 0.6106780,
        size.height * 0.7857670);
    path_0.cubicTo(
        size.width * 0.5820644,
        size.height * 0.7930625,
        size.width * 0.5522407,
        size.height * 0.7964688,
        size.width * 0.5223390,
        size.height * 0.7958523);
    path_0.lineTo(size.width * 0.5224068, size.height * 0.7956818);
    path_0.close();
    return path_0;
  }

  static Path path1(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.03864407, size.height * 0.2932670);
    path_1.cubicTo(
        size.width * 0.03864407,
        size.height * 0.5063352,
        size.width * 0.2907797,
        size.height * 0.5710795,
        size.width * 0.5019322,
        size.height * 0.5844886);
    path_1.cubicTo(
        size.width * 0.6609831,
        size.height * 0.5920170,
        size.width * 0.7245763,
        size.height * 0.6187216,
        size.width * 0.7245763,
        size.height * 0.6834375);
    path_1.cubicTo(
        size.width * 0.7245763,
        size.height * 0.7317330,
        size.width * 0.6760678,
        size.height * 0.7686648,
        size.width * 0.6107797,
        size.height * 0.7857102);
    path_1.cubicTo(
        size.width * 0.7732203,
        size.height * 0.7753409,
        size.width * 0.9023051,
        size.height * 0.6752557,
        size.width * 0.9618644,
        size.height * 0.5499148);
    path_1.cubicTo(
        size.width * 0.8809153,
        size.height * 0.4232386,
        size.width * 0.6834915,
        size.height * 0.3972727,
        size.width * 0.5201695,
        size.height * 0.3884091);
    path_1.cubicTo(
        size.width * 0.4546780,
        size.height * 0.3849148,
        size.width * 0.4053559,
        size.height * 0.3758807,
        size.width * 0.3710169,
        size.height * 0.3612500);
    path_1.cubicTo(
        size.width * 0.2574576,
        size.height * 0.3315341,
        size.width * 0.1480339,
        size.height * 0.2726719,
        size.width * 0.07677966,
        size.height * 0.1654276);
    path_1.cubicTo(
        size.width * 0.05257627,
        size.height * 0.2011662,
        size.width * 0.03850847,
        size.height * 0.2435241,
        size.width * 0.03850847,
        size.height * 0.2932670);
    path_1.lineTo(size.width * 0.03864407, size.height * 0.2932670);
    path_1.close();
    return path_1;
  }

  static Path path2(Size size) {
    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3111183, size.height * 0.2857102);
    path_2.cubicTo(
        size.width * 0.3111183,
        size.height * 0.2266761,
        size.width * 0.3838305,
        size.height * 0.1924148,
        size.width * 0.5155254,
        size.height * 0.1924148);
    path_2.cubicTo(
        size.width * 0.6223390,
        size.height * 0.1924148,
        size.width * 0.7131864,
        size.height * 0.2133807,
        size.width * 0.7926441,
        size.height * 0.2761932);
    path_2.lineTo(size.width * 0.9471186, size.height * 0.1237784);
    path_2.cubicTo(size.width * 0.8176610, size.height * 0.02857955,
        size.width * 0.6861017, 0, size.width * 0.5110508, 0);
    path_2.cubicTo(
        size.width * 0.3535932,
        0,
        size.width * 0.1582031,
        size.height * 0.04528409,
        size.width * 0.07691492,
        size.height * 0.1652841);
    path_2.cubicTo(
        size.width * 0.1481014,
        size.height * 0.2725284,
        size.width * 0.2575929,
        size.height * 0.3313920,
        size.width * 0.3711525,
        size.height * 0.3611080);
    path_2.cubicTo(
        size.width * 0.3306437,
        size.height * 0.3437500,
        size.width * 0.3111522,
        size.height * 0.3184943,
        size.width * 0.3111522,
        size.height * 0.2855398);
    path_2.lineTo(size.width * 0.3111183, size.height * 0.2857102);
    path_2.close();
    return path_2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = path0(size);
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = path1(size);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = path2(size);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  bool isPointInside(Offset point, Size size) {
    Path path_0 = path0(size);
    Path path_1 = path1(size);
    Path path_2 = path2(size);

    return path_0.contains(point) ||
        path_1.contains(point) ||
        path_2.contains(point);
  }

  static bool mostPointsInPath1 = false;
  static bool mostPointsInPath2 = false;
  static bool mostPointsInPath3 = false;
  static isCompleted({required List<Offset> points, required Size size}) {
    Path path_0 = path0(size);
    Path path_1 = path1(size);
    Path path_2 = path2(size);

    int count1 = countPointsInPath(path_0, points);
    int count2 = countPointsInPath(path_1, points);
    int count3 = countPointsInPath(path_2, points);
    if (count1 > count2 && count1 > count3) {
      log('Most points from path1 are in the list');
      mostPointsInPath1 = true;
    } else if (count2 > count1 && count2 > count3) {
      log('Most points from path2 are in the list');
      mostPointsInPath2 = true;
    } else if (count3 > count1 && count3 > count2) {
      log('Most points from path3 are in the list');
      mostPointsInPath3 = true;
    }
    if (mostPointsInPath1 == true &&
        mostPointsInPath2 == true &&
        mostPointsInPath3 == true) {
      return true;
    }
    return false;
  }

  static int countPointsInPath(Path path, List<Offset> pointList) {
    int count = 0;
    for (Offset point in pointList) {
      if (path.contains(point)) {
        count++;
      }
    }
    return count;
  }

  static List<Offset> getOffsetOfPath(Size size) {
    List<Offset> sampledPoints = _samplePath(path0(size), 1.0);
    List<Offset> sampledPoints1 = _samplePath(path1(size), 1.0);
    List<Offset> sampledPoints2 = _samplePath(path2(size), 1.0);
    List<Offset> finalSampledPoints2 = [];
    finalSampledPoints2.addAll(sampledPoints);
    finalSampledPoints2.addAll(sampledPoints1);
    finalSampledPoints2.addAll(sampledPoints2);
    return finalSampledPoints2;
  }

  static List<Offset> _samplePath(Path path, double step) {
    PathMetrics pathMetrics = path.computeMetrics();
    List<Offset> points = [];

    for (PathMetric pathMetric in pathMetrics) {
      for (double i = 0; i < pathMetric.length; i += step) {
        Tangent? tangent = pathMetric.getTangentForOffset(i);
        if (tangent != null) {
          points.add(tangent.position);
        }
      }
    }
    return points;
  }
}
