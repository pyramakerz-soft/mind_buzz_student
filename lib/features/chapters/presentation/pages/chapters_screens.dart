import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/utils.dart';
import '../../../lesson/presentation/pages/lesson_screen.dart';
import '../../domain/entities/chapter_model.dart';
import '../widgets/dotted_line_painter.dart';

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
    ChapterModel(isOpen: true, isChapter: true),
    ChapterModel(isOpen: true, isLesson: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isChapter: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isCheckPoint: true),
    ChapterModel(isOpen: false, isChapter: true),
    ChapterModel(isOpen: false, isLesson: true),
    ChapterModel(isOpen: false, isChapter: true),
    // ChapterModel(isOpen: false, isAssessment: true),
    // ChapterModel(isOpen: false, isLesson: true),
  ];
  int secondListIndex = 0;

  List<Offset> mainPositions = [];
  @override
  void initState() {
    super.initState();
  }

  List<Widget> createData(
      {required double subHeight,
      required double subWidth,
      required List<Offset> positions}) {
    List<Widget> widgetData = [];
    for (var i = 0; i < chapters.length; i++) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          widgetData.add(Positioned(
              bottom: positions[secondListIndex].dy,
              left: positions[secondListIndex].dx,
              child: SizedBox(
                width: 90,
                height: 120,
                child: Column(
                  children: [
                    if (chapters[i].isLesson == true) ...{
                      if (chapters[i].isOpen == true) ...{
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                // height: 50,
                                margin: const EdgeInsets.only(top: 20),
                                child: Transform.rotate(
                                    angle: (-10) * 3.141592653589793 / 180,
                                    // Rotate 45 degrees in radians
                                    child: Image.asset(
                                      AppImages.imageStar,
                                      height: 20,
                                    ))),
                            Image.asset(
                              AppImages.imageStar,
                              height: 20,
                            ),
                            Container(
                                // height: 50,
                                margin: const EdgeInsets.only(top: 20),
                                child: Transform.rotate(
                                    angle: (10) * 3.141592653589793 / 180,
                                    // Rotate 45 degrees in radians
                                    child: Image.asset(
                                      AppImages.imageStar,
                                      height: 20,
                                    ))),
                          ],
                        ),
                      } else ...{
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                // height: 50,
                                margin: const EdgeInsets.only(top: 20),
                                child: Transform.rotate(
                                    angle: (-10) * 3.141592653589793 / 180,
                                    // Rotate 45 degrees in radians
                                    child: Image.asset(
                                      AppImages.imageEmptyStar,
                                      height: 20,
                                    ))),
                            Image.asset(
                              AppImages.imageEmptyStar,
                              height: 20,
                            ),
                            Container(
                                // height: 50,
                                margin: const EdgeInsets.only(top: 20),
                                child: Transform.rotate(
                                    angle: (10) * 3.141592653589793 / 180,
                                    // Rotate 45 degrees in radians
                                    child: Image.asset(
                                      AppImages.imageEmptyStar,
                                      height: 20,
                                    ))),
                          ],
                        ),
                      }
                    },
                    GestureDetector(
                      onTap: () {
                        Utils.navigateTo(
                            LessonScreen(
                              programId: widget.programId,
                              programName: widget.programName,
                            ),
                            context);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (chapters[i].isChapter == true) ...{
                            SvgPicture.asset(
                              i == 0 || i % 2 == 0
                                  ? AppSvgImages.iconCurrentChapter1
                                  : AppSvgImages.iconCurrentChapter2,
                            ),
                            Text(
                              "${i + 1}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                            ),
                            // },
                          } else if (chapters[i].isLesson == true) ...{
                            if (chapters[i].isOpen == false) ...{
                              Image.asset(
                                AppImages.imageCloseLessonPart,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Lesson",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  ...List.generate(
                                      1,
                                      (index) => SvgPicture.asset(
                                            DefaultChapterData
                                                .getTheNumberOfChapter(
                                              number: 1,
                                            ).first,
                                            height: 20,
                                          ))
                                ],
                              )
                            } else ...{
                              Image.asset(
                                AppImages.imageLessonPart,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Lesson",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  ...List.generate(
                                      1,
                                      (index) => SvgPicture.asset(
                                            DefaultChapterData
                                                .getTheNumberOfChapter(
                                              number: 1,
                                            ).first,
                                            height: 20,
                                          ))
                                ],
                              )
                            },
                          } else if (chapters[i].isCheckPoint == true) ...{
                            Column(children: [
                              Text(
                                "Checkpoint",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                              ),
                              Image.asset(
                                AppImages.imageCheckpointPart,
                                width: 70,
                              ),
                            ])
                          } else if (chapters[i].isAssessment == true) ...{
                            Column(children: [
                              Text(
                                "Assessment",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                              ),
                              Image.asset(
                                AppImages.imageAssessmentPart,
                                width: 70,
                              ),
                            ])
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              )));
          secondListIndex++;
          if (secondListIndex >= positions.length) {
            secondListIndex =
                0; // Reset index to start from the beginning of second list
          }
        });
      });
    }
    return widgetData;
  }

  Future<List<Offset>> listOfPositions() async {
    final subHeight = 101; //(MediaQuery.of(context).size.height - 140) / 7;
    final subWidth = 78.0; //MediaQuery.of(context).size.width / 5;
    // log('subHeight:$subHeight, subWidth:$subWidth');
    List<Offset> positions = [
      const Offset(10, 10),
      Offset(subWidth, subHeight + 20),
      Offset(subWidth + 10, (subHeight * 2) + 40),
      Offset(subWidth * 3 - 10, subHeight * 3 - 20),
      Offset(subWidth * 3 - 10, subHeight * 4),
      // Offset(subWidth * 2, ((subHeight * 4)+subHeight) ),
    ];
    int secondListIndex0 = 0; // To keep track of the index of the second list
    bool reverseSecondList0 = false;
    List<Offset> subPositions = [];
    for (int i = 0; i < chapters.length; i++) {
      if (reverseSecondList0 == false) {
        // log('--:${positions[reverseSecondList0 ? positions.length - 1 - secondListIndex0 : secondListIndex0]}');
        // subPositions.add(Offset((positions[i].dx), (positions[i].dy)));
        // }
        subPositions.add(Offset((positions[secondListIndex0].dx),
            (positions[secondListIndex0].dy)));
      } else {
        log('#####################');

        subPositions.add(Offset(((positions[secondListIndex0].dx)),
            (positions.last.dy) + (subHeight * 3)));
      }
      secondListIndex0++;
      if (secondListIndex0 >= positions.length) {
        secondListIndex0 = 0;
        reverseSecondList0 = !reverseSecondList0;
      }
    }
    log('subPositions:$subPositions');
    return subPositions;
  }

  @override
  Widget build(BuildContext context) {
    final subHeight = (MediaQuery.of(context).size.height - 140) / 7;
    final subWidth = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bgChapters))),
        child: Stack(
          children: [
            Column(children: [
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

              FutureBuilder<List<Offset>>(
                  future: listOfPositions(),
                  builder: (context, state) {
                    if (state.connectionState == ConnectionState.done &&
                        state.hasData == true) {
                      log("--${state.data}");
                      return Center(
                          child: Stack(alignment: Alignment.center, children: [
                        Transform.flip(
                          flipY: true,
                          child: SingleChildScrollView(
                            child: Container(
                              // height: subHeight,
                              child: CustomPaint(
                                // size: Size(mainWidth, mainHeight),
                                size: Size(subWidth * 4, subHeight * 6),
                                painter: DottedLinePainter(
                                    listOfPoints: state.data ?? []),
                              ),
                            ),
                          ),
                        ),
                        // if(widgetData.length ==chapters.length)...{
                        // ...List.generate(
                        //     chapters.length,
                        //     (index) => createData(
                        //         subHeight: subHeight,
                        //         subWidth: subWidth,
                        //         positions: state.data ?? [])[index])
                        // }
                      ]));
                    } else {
                      return SizedBox();
                    }
                  })

              //     ],
              //   ),
              // ),
            ]),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.halfBee,
                      width: 150,
                    ),
                    100.ph
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
