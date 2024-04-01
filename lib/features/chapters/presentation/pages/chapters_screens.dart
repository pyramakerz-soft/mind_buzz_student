import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../widgets/dotted_line_painter.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subHeight = (MediaQuery.of(context).size.height-140) / 8;
    final subWidth = MediaQuery.of(context).size.width / 5;
    final List<Offset> positions = [
      const Offset(10, 10),
      Offset(subWidth, subHeight),
      Offset(subWidth, subHeight * 2),
      Offset(subWidth * 3, subHeight * 3),
      Offset(subWidth * 3, subHeight * 4),
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
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
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
                            ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
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
                            height: 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                  SvgPicture.asset(
                                    i==0||i%2==0?AppImages.iconCurrentChapter1:AppImages.iconCurrentChapter2,
                                  ),
                                  Text(
                                    "${i+1}",
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 25, fontWeight: FontWeight.w700),
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
                    Image.asset(AppImages.halfBee, width: 150,),
                    100.ph
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
