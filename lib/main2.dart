import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'core/app_color.dart';
import 'core/assets_images.dart';
import 'core/assets_svg_images.dart';
import 'features/chapters/domain/entities/chapter_model.dart';
import 'features/chapters/presentation/widgets/dotted_line_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(AppImages.bgChapters))),
            child: Column(children: [
              SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///todo: make the icon general
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 45,
                              width: 45,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.darkBlueColor3),
                              child: SvgPicture.asset(
                                AppSvgImages.iconHome,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              ))),
                      Text(
                        'Chapters',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.darkBlueColor3),
                              child: SvgPicture.asset(
                                AppSvgImages.iconAnalysis,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: LineBetweenOffsets(),
                    )),
              )
            ])),
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
  final subHeight = 101;
  final subWidth = 78.0;
  Future<List<Offset>> listOfPositions() async {
    const subHeight = 101;
    const subWidth = 78.0;
    List<Offset> positions = [
      const Offset(10, 10),
      const Offset(subWidth, subHeight + 20),
      const Offset(subWidth + 10, (subHeight * 2) + 40),
      const Offset(subWidth * 3 - 10, subHeight * 3 - 20),
      const Offset(subWidth * 3 - 10, subHeight * 4),
    ];

    List<Offset> newPositions = [];
    int countOfRepeat = (chapters.length / positions.length).round();
    for (int i = 0; i < (countOfRepeat); i++) {
      List<Offset> secondPositions = List.from(positions.where((element) {
        return positions.indexOf(element) + positions.length <= chapters.length;
      }).map((offset) =>
          Offset(offset.dx, offset.dy + ((subHeight * 4) * (i + 1)))));
      newPositions.addAll(secondPositions);
    }
    for (int i = 0; i < (chapters.length - newPositions.length); i++) {
      newPositions.add(Offset(positions[i].dx,
          positions[i].dy + ((subHeight * 4) * (countOfRepeat + 1))));
    }

    return newPositions;
  }

  @override
  Widget build(BuildContext context) {
    // const subHeight = 101;
    // const subWidth = 78.0;
    //
    // List<Offset> positions = [
    //   const Offset(10, 10),
    //   const Offset(subWidth, subHeight + 20),
    //   const Offset(subWidth + 10, (subHeight * 2) + 40),
    //   const Offset(subWidth * 3 - 10, subHeight * 3 - 20),
    //   const Offset(subWidth * 3 - 10, subHeight * 4),
    // ];
    //
    // List<Offset> newPositions = [];
    // int countOfRepeat = (chapters.length / positions.length).round();
    // for (int i = 0; i < (countOfRepeat); i++) {
    //   List<Offset> secondPositions = List.from(positions.where((element) {
    //     return positions.indexOf(element) + positions.length <= chapters.length;
    //   }).map((offset) =>
    //       Offset(offset.dx, offset.dy + ((subHeight * 4) * (i + 1)))));
    //   newPositions.addAll(secondPositions);
    // }
    // for (int i = 0; i < (chapters.length - newPositions.length); i++) {
    //   newPositions.add(Offset(positions[i].dx,
    //       positions[i].dy + ((subHeight * 4) * (countOfRepeat + 1))));
    // }

    return FutureBuilder<List<Offset>>(
        future: listOfPositions(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.done &&
              state.hasData == true) {
            return Container();
            //   CustomPaint(
            //   size: Size(
            //       300,
            //       (state.data?.isEmpty ?? true)
            //           ? 600
            //           : (state.data?.last.dy ?? 0) + subHeight * 2),
            //   painter: DottedLinePainter(listOfPoints: state.data ?? []),
            //   // ),
            // );
          } else {
            return SizedBox();
          }
        });
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