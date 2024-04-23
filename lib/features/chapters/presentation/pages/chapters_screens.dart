import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/utils.dart';
import '../../../lesson/presentation/pages/lesson_screen.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/image_details.dart';
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
    ChapterModel(isOpen: true, isChapter: true, id: 1),
    ChapterModel(isOpen: true, isLesson: true, id: 2),
    ChapterModel(isOpen: false, isLesson: true, id: 3),
    ChapterModel(isOpen: false, isChapter: true, id: 4),
    ChapterModel(isOpen: false, isLesson: true, id: 5),
    ChapterModel(isOpen: false, isCheckPoint: true, id: 6),
    ChapterModel(isOpen: false, isChapter: true, id: 7),
    ChapterModel(isOpen: false, isLesson: true, id: 8),
    ChapterModel(isOpen: false, isChapter: true, id: 9),
    ChapterModel(isOpen: false, isAssessment: true, id: 10),
    ChapterModel(isOpen: false, isLesson: true, id: 11),
  ];
  final subHeight = 101;
  final subWidth = 78.0;
  Widget createData({required ChapterModel chapterData}) {
    return Container(
      // margin: EdgeInsets.only(bottom: 30),
      // width: 90,
      // height: 120,
      child: Column(
        children: [
          // if (chapterData.isLesson == true) ...{
          //   if (chapterData.isOpen == true) ...{
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //             // height: 50,
          //             margin: const EdgeInsets.only(top: 20),
          //             child: Transform.rotate(
          //                 angle: (-10) * 3.141592653589793 / 180,
          //                 // Rotate 45 degrees in radians
          //                 child: Image.asset(
          //                   AppImages.imageStar,
          //                   height: 20,
          //                 ))),
          //         Image.asset(
          //           AppImages.imageStar,
          //           height: 20,
          //         ),
          //         Container(
          //             // height: 50,
          //             margin: const EdgeInsets.only(top: 20),
          //             child: Transform.rotate(
          //                 angle: (10) * 3.141592653589793 / 180,
          //                 // Rotate 45 degrees in radians
          //                 child: Image.asset(
          //                   AppImages.imageStar,
          //                   height: 20,
          //                 ))),
          //       ],
          //     ),
          //   }
          //   else ...{
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //             // height: 50,
          //             margin: const EdgeInsets.only(top: 20),
          //             child: Transform.rotate(
          //                 angle: (-10) * 3.141592653589793 / 180,
          //                 // Rotate 45 degrees in radians
          //                 child: Image.asset(
          //                   AppImages.imageEmptyStar,
          //                   height: 20,
          //                 ))),
          //         Image.asset(
          //           AppImages.imageEmptyStar,
          //           height: 20,
          //         ),
          //         Container(
          //             // height: 50,
          //             margin: const EdgeInsets.only(top: 20),
          //             child: Transform.rotate(
          //                 angle: (10) * 3.141592653589793 / 180,
          //                 // Rotate 45 degrees in radians
          //                 child: Image.asset(
          //                   AppImages.imageEmptyStar,
          //                   height: 20,
          //                 ))),
          //       ],
          //     ),
          //   }
          // },
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
                if (chapterData.isChapter == true) ...{
                  SvgPicture.asset(AppSvgImages.iconCurrentChapter1),
                  Text(
                    "${chapterData.id}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  // },
                }
                else if (chapterData.isLesson == true) ...{
                  if (chapterData.isOpen == false) ...{
                    Image.asset(
                      AppImages.imageCloseLessonPart,
                      width: 80,
                    ),
                    Column(
                      children: [
                        Text(
                          "Lesson",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        ...List.generate(
                            1,
                            (index) => SvgPicture.asset(
                                  DefaultChapterData.getTheNumberOfChapter(
                                    number: 1,
                                  ).first,
                                  height: 20,
                                ))
                      ],
                    )
                  } else ...{
                    Image.asset(
                      AppImages.imageLessonPart,
                      width: 80,
                    ),
                    Column(
                      children: [
                        Text(
                          "Lesson",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        ...List.generate(
                            1,
                            (index) => SvgPicture.asset(
                                  DefaultChapterData.getTheNumberOfChapter(
                                    number: 1,
                                  ).first,
                                  height: 20,
                                ))
                      ],
                    )
                  },
                }
                else if (chapterData.isCheckPoint == true) ...{
                  Row(
                    children: [
                      20.pw,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                              width: 60,
                            ),
                          ])
                    ],
                  )
                }
                else if (chapterData.isAssessment == true) ...{
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Assessment",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
    );
  }

  Future<List<Offset>> listOfPositions() async {

    List<Offset> positions = [
      const Offset(10, 10),
      Offset(subWidth, subHeight + 20),
      Offset(subWidth + 10, (subHeight * 2) + 40),
      Offset(subWidth * 3 - 10, subHeight * 3 - 20),
      Offset(subWidth * 3 - 10, subHeight * 4),
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
                  levelMapParams: LevelMapParams(
                    levelCount: 4,
                    currentLevel: 3,
                    pathColor: Colors.black,
                    currentLevelImage: ImageParams(
                      path: 'assets/images/close_lesson_part.png',
                      size: Size(100, 100),
                    ),
                    lockedLevelImage: ImageParams(
                      path: "assets/images/lesson_part.png",
                      size: Size(100, 100),
                    ),
                    completedLevelImage: ImageParams(
                      path: "assets/images/lesson_part.png",
                      size: Size(100, 100),
                    ),



                  ),
                )
              )
              // Expanded(
              //   child: Container(
              //     padding: EdgeInsets.only(left: 20),
              //     child: FutureBuilder<List<Offset>>(
              //         future: listOfPositions(),
              //         builder: (context, state) {
              //           if (state.connectionState == ConnectionState.done &&
              //               state.hasData == true) {
              //             return SingleChildScrollView(
              //                 reverse: true,
              //                 scrollDirection: Axis.vertical,
              //                 child: Stack(
              //                     clipBehavior: Clip.none,
              //                     fit: StackFit.passthrough,
              //                     alignment: Alignment.centerRight,
              //                     children: [
              //                       InkWell(
              //                         onTap:(){
              //
              //                           print(size.width);
              //                           print(size.height);
              //                           print(state.data?.last.dy);
              //             },
              //                         child: CustomPaint(
              //                           size: Size(300,2000),
              //                           painter: ZigzagPainter(
              //                                // listOfPoints: state.data ?? [],
              //                             // numberOfWaves: (chapters.reversed.toList().length / 2).ceil()
              //                           ),
              //                         ),
              //                       ),
              //                       ...List.generate(
              //                           state.data?.length ?? 0,
              //                           (i) => Positioned(
              //                               top: ((state.data?[i].dy?? 0) - 10 ) ,
              //                               left: chapters.reversed
              //                                           .toList()[i]
              //                                           .isCheckPoint ==
              //                                       true
              //                                   ? (state.data?[i].dx ?? 0) * 15
              //                                   : (state.data?[i].dx ?? 0)/1.5 ,
              //                               child: createData(
              //                                   chapterData: chapters.reversed
              //                                       .toList()[i])))
              //                     ]));
              //
              //
              //
              //
              //
              //             // ); //,
              //             // if(widgetData.length ==chapters.length)...{
              //             // Positioned(
              //             //     bottom: state.data?.first.dy,
              //             //     left: state.data?.first.dx,
              //             //     child:
              //             //     createData(chapterData: chapters.first))
              //             // }
              //             // ]);
              //           } else {
              //             return SizedBox();
              //           }
              //         }),
              //   ),
              // )

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
