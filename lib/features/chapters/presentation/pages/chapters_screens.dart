import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/utils.dart';
import '../../../lesson/presentation/pages/lesson_screen.dart';
import '../../domain/entities/chapter_model.dart';
import '../widgets/dotted_line_painter.dart';

class ChaptersScreen extends StatelessWidget {
  final String programId;
  final String programName;
  ChaptersScreen(
      {Key? key, required this.programId, required this.programName});
  List<ChapterModel> chapters = [
    ChapterModel(isOpen: true),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
  ];


  @override
  Widget build(BuildContext context) {
    final subHeight = (MediaQuery.of(context).size.height - 140) / 7;
    final subWidth = MediaQuery.of(context).size.width / 5;
    final List<Offset> positions = [
      const Offset(10, 10),
      Offset(subWidth, subHeight + 20),
      Offset(subWidth + 10, (subHeight * 2) + 40),
      Offset(subWidth * 3 - 10, subHeight * 3 - 20),
      Offset(subWidth * 3 - 10, subHeight * 4 + 10),
    ];

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
                                AppImages.iconHome,
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
                                AppImages.iconAnalysis,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.flip(
                      flipY: true,
                      child: CustomPaint(
                        // size: Size(mainWidth, mainHeight),
                        size: Size(subWidth * 4, subHeight * 6),
                        painter: DottedLinePainter(listOfPoints: positions),
                      ),
                    ),
                    for (var i = 0; i < positions.length; i++)
                      Positioned(
                          bottom: positions[i].dy,
                          left: positions[i].dx,
                          child: SizedBox(
                            width: 70,
                            height: 120,
                            child: Column(
                              children: [
                                if (chapters[i].isOpen == true)...{

                                  Row(
                                    children: [
                                      Container(
                                        // height: 50,
                                          margin: const EdgeInsets.only(
                                              top: 20),
                                          child: Transform.rotate(
                                              angle: (-10) *
                                                  3.141592653589793 /
                                                  180,
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
                                          margin: const EdgeInsets.only(
                                              top: 20),
                                          child: Transform.rotate(
                                              angle: (10) *
                                                  3.141592653589793 /
                                                  180,
                                              // Rotate 45 degrees in radians
                                              child: Image.asset(
                                                AppImages.imageStar,
                                                height: 20,
                                              ))),
                                    ],
                                  ),
                                }else...{
                                  Row(
                                    children: [
                                      Container(
                                        // height: 50,
                                          margin: const EdgeInsets.only(
                                              top: 20),
                                          child: Transform.rotate(
                                              angle: (-10) *
                                                  3.141592653589793 /
                                                  180,
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
                                          margin: const EdgeInsets.only(
                                              top: 20),
                                          child: Transform.rotate(
                                              angle: (10) *
                                                  3.141592653589793 /
                                                  180,
                                              // Rotate 45 degrees in radians
                                              child: Image.asset(
                                                AppImages.imageEmptyStar,
                                                height: 20,
                                              ))),
                                    ],
                                  ),
                                },
                                GestureDetector(
                                  onTap: () {
                                    Utils.navigateTo(
                                        LessonScreen(
                                          programId: programId,
                                          programName: programName,
                                        ),
                                        context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      if (chapters[i].isOpen == false)...{
                                        SvgPicture.asset(
                                          AppImages.iconLockChapter,
                                          // width: 50,
                                          // height: 50,
                                        ),
                                      }else...{
                                        SvgPicture.asset(
                                          i == 0 || i % 2 == 0
                                              ? AppImages.iconCurrentChapter1
                                              : AppImages.iconCurrentChapter2,
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
                                      },

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                  ],
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
