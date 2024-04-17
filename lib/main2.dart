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
    ];

    List<Offset> newPositions = [];
    newPositions.addAll(positions);
    List<Offset> secondPositions = List.from(positions.where((element) {
      log('##${positions.indexOf(element) + positions.length}');
      log('##${chapters.length}');

      return positions.indexOf(element) + positions.length <= chapters.length;
    }).map((offset) => Offset(offset.dx, offset.dy + subHeight * 4)));
    newPositions.addAll(secondPositions);

    // for (int i = 0; i < chapters.length; i++) {
    //   if ((i + 1) <= positions.length) {
    //     newPositions.add(positions[i]);
    //   } else {
    //     log("${i - positions.length}:${positions.length}:$i");
    //     log("${positions[i - positions.length].dy}:${positions[i - positions.length].dy + (subHeight * 4)}:$i");
    //     newPositions.add(Offset(positions[i - positions.length].dx,
    //         positions[i - positions.length].dy + (subHeight * 4)));
    //   }
    // }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          size: Size(300, 300),
          painter: LinePainter(newPositions),
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
