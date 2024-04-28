import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/utils.dart';
import '../../../lesson/presentation/pages/lesson_screen.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/image_details.dart';
import '../bloc/chapters_bloc.dart';
import '../widgets/dotted_line_painter.dart';
import '../widgets/level_map.dart';
import '../widgets/level_map_parameters.dart';

class ChaptersScreen extends StatefulWidget {
  final String programId;
  final String programName;

  ChaptersScreen(
      {Key? key, required this.programId, required this.programName});

  @override
  State<StatefulWidget> createState() {
    return _ChaptersScreen();
  }
}

class _ChaptersScreen extends State<ChaptersScreen> {
  List<ChapterModel> chapters = [
    ChapterModel(
        isOpen: true,
        isChapter: true,
        id: 1,
        levelImg: 'assets/images/chapter.png'),
    ChapterModel(
        isOpen: true,
        isLesson: true,
        id: 2,
        levelImg: 'assets/images/close_lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 3,
        levelImg: 'assets/images/close_lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 4,
        levelImg: 'assets/images/chapter.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 5,
        levelImg: 'assets/images/close_lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isCheckPoint: true,
        id: 6,
        levelImg: 'assets/images/checkpoint_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 7,
        levelImg: 'assets/images/chapter.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 8,
        levelImg: 'assets/images/close_lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 9,
        levelImg: 'assets/images/chapter.png'),
    ChapterModel(
        isOpen: false,
        isAssessment: true,
        id: 10,
        levelImg: 'assets/images/assessment_part.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 11,
        levelImg: 'assets/images/close_lesson_part.png'),
  ];
  final subHeight = 101;
  final subWidth = 78.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bgChapters))),
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                child: LevelMap(
                  backgroundColor: Colors.transparent,
                  onTapLevel: (index) {
                    print(index);
                  },
                  levelMapParams: LevelMapParams(
                    levelCount: chapters.length,
                    currentLevel: chapters.length.toDouble(),
                    pathColor: Colors.black,

                    levelsImages: chapters
                        .map((e) => ImageParams(
                            path: e.levelImg!,
                            size: Size(100, 100),
                            bodyWidget: e.isChapter == true
                                ? e.isOpen == true
                                    ? Text(
                                        "1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700),
                                      )
                                    : SvgPicture.asset(AppSvgImages.iconLock)
                                : e.isCheckPoint == true
                                    ? e.isOpen == true
                                        ? SizedBox()
                                        : SvgPicture.asset(
                                            AppSvgImages.iconLock)
                                    : e.isAssessment == true
                                        ? e.isOpen == true
                                            ? SizedBox()
                                            : SvgPicture.asset(
                                                AppSvgImages.iconLock)
                                        : e.isLesson == true
                                            ? e.isOpen == true
                                                ? Column(
                                                    children: [
                                                      Text(
                                                        "Lesson",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge
                                                            ?.copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      ...List.generate(
                                                          1,
                                                          (index) =>
                                                              SvgPicture.asset(
                                                                DefaultChapterData
                                                                    .getTheNumberOfChapter(
                                                                  number: 1,
                                                                ).first,
                                                                height: 20,
                                                              ))
                                                    ],
                                                  )
                                                : SizedBox()
                                            : SizedBox()))
                        .toList(),

                    // currentLevelImage: ImageParams(
                    //   path: 'assets/images/close_lesson_part.png',
                    //   size: Size(100, 100),
                    // ),
                    // lockedLevelImage: ImageParams(
                    //   path: "assets/images/lesson_part.png",
                    //   size: Size(100, 100),
                    // ),
                    // completedLevelImage: ImageParams(
                    //   path: "assets/images/lesson_part.png",
                    //   size: Size(100, 100),
                    // ),
                  ),
                ),
              ),
            ]),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.halfBee,
                      width: 110,
                    ),
                    // 100.ph
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
