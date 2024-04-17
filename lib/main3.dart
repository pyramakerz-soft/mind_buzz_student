import 'dart:developer';

import 'package:flutter/material.dart';

import 'features/chapters/domain/entities/chapter_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Line between Offset points'),
        ),
        body: Center(
          child: LineBetweenOffsets(),
        ),
      ),
    );
  }
}

class LineBetweenOffsets extends StatelessWidget {
  List<ChapterModel> chapters = [
    ChapterModel(isOpen: true, isChapter: true),
    ChapterModel(isOpen: true, isLesson: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isChapter: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isCheckPoint: true),
    ChapterModel(isOpen: false, isChapter: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isChapter: true),
    ChapterModel(isOpen: false, isAssessment: true),
    ChapterModel(isOpen: false, isLesson: true),
  ];

  @override
  Widget build(BuildContext context) {
    // final subHeight = (MediaQuery.of(context).size.height - 140) / 7;
    // final subWidth = MediaQuery.of(context).size.width / 5;
    final subHeight = 101; //(MediaQuery.of(context).size.height - 140) / 7;
    final subWidth = 78.0; //MediaQuery.of(context).size.width / 5;

    // Define the initial set of positions
    List<Offset> positions = [
      const Offset(10, 10),
      Offset(subWidth, subHeight + 20),
      Offset(subWidth + 10, (subHeight * 2) + 40),
      Offset(subWidth * 3 - 10, subHeight * 3 - 20),
      Offset(subWidth * 3 - 10, subHeight * 4),
      // Offset(subWidth * 2, ((subHeight * 4)+subHeight) ),
    ];

    // Create the second set of positions by shifting vertically from the initial set
    List<Offset> secondPositions = List.from(positions
        .map((offset) => Offset(offset.dx, offset.dy + subHeight * 4)));

    // Combine the initial and second sets of positions
    positions.addAll(secondPositions);

    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.vertical,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          size: Size(300, 300),
          painter: LinePainter(positions),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> positions;

  LinePainter(this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    log('positions:${positions.length}:$positions');

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Draw lines between consecutive points
    for (int i = 0; i < positions.length - 1; i++) {
      canvas.drawLine(positions[i], positions[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
