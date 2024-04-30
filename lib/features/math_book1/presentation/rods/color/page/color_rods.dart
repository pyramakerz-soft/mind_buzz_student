import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/assets_images.dart';
import '../../../../../../core/math/main_math.dart';
import '../../../../../../core/widgets/box_painter.dart';
import '../../../../domain/entities/lesson_questions.dart';
import '../manager/color_rods_cubit.dart';

class ColorRods extends StatelessWidget {
  final Function() defaultActionOfSuccessAnswer;
  final Function() defaultActionOfWrongAnswer;
  // final LessonQuestionsModel questionData;

  const ColorRods(
      {Key? key,
      // required this.questionData,
      required this.defaultActionOfSuccessAnswer,
      required this.defaultActionOfWrongAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final questionData = context.watch<ColorRodsCubit>().state.questionData;

    return  SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.ph,
                Container(
                  child: MainMath.getTheBox(
                      countOfBoxes:
                          int.parse("${questionData?.control?.control ?? 0}"),
                      isSolid: false,
                      sizeOfOne: Size(width / 12, (width / 19).toDouble())),
                ),
                Row(
                  children: [
                     Expanded(flex: 3, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: MainMath.getTheBox(
                              countOfBoxes:
                              int.parse("${questionData?.control?.action ?? 0}"),
                              isSolid: false,
                              sizeOfOne: Size(width / 12, (width / 19).toDouble())),
                        ),
                        BlocBuilder<ColorRodsCubit, ColorRodsInitial>(
                            builder: (context, state) {
                              return Container(
                          child: SizedBox(
                            height: Size(width / 12, (width / 19).toDouble()).height,
                            width: int.parse("${questionData?.control?.answer ?? 0}") * (Size(width / 12, (width / 19).toDouble()).width - 14) + Size(width / 12, (width / 19).toDouble()).width/4, // Add size of one box to accommodate the last box
                            child: Stack(
                              children: [
                                ...List.generate(int.parse("${questionData?.control?.answer ?? 0}"), (index) {
                                  if (index == 0 || index % 2 == 0) {
                                    return Positioned(
                                      left: index == 0 ? 0 : (Size(width / 12, (width / 19).toDouble()).width * index) - (14 * index),
                                      child: GestureDetector(
                                        onTap: (){
                                          context.read<ColorRodsCubit>().submitTheColor(index: index, newColor: Colors.blue, );
                                        },
                                        // child: CustomPaint(
                                        //     size: Size(width / 12, (width / 19).toDouble()),
                                        //     painter: BoxCustomPainter(
                                        //         color: state.selectedColorsOfBox?[index]??(true==true?AppColor.bgMatheColor:MainMath.colors.first.colorMain),
                                        //         boarderColor: Colors.grey)),
                                      ),
                                    );
                                  } else {
                                    return Positioned(
                                      left: (Size(width / 12, (width / 19).toDouble()).width * index) - (14 * index),
                                      child: GestureDetector(
                                        onTap: (){
                                          context.read<ColorRodsCubit>().submitTheColor(index: index, newColor: Colors.green, );
                                        },
                                        child: CustomPaint(
                                            size: Size(width / 12, (width / 19).toDouble()),
                                            // painter: BoxCustomPainter(
                                            //     color: state.selectedColorsOfBox?[index]??(true==true?AppColor.bgMatheColor:MainMath.colors.last.colorMain),
                                            //     boarderColor: Colors.grey)
                                        ),
                                      ),
                                    );
                                  }
                                }).reversed
                              ],
                            ),
                          )
                        );})
                      ],
                    ),),
                    Expanded(
                      child: BlocBuilder<ColorRodsCubit, ColorRodsInitial>(
                          builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 75,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<ColorRodsCubit>()
                                      .submitTheSelectColor(colorId: 0);
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: state.selectedColor == 0 ? 0 : -20,
                                      child: Image.asset(
                                        AppImages.imageBluePen,
                                        width: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 75,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<ColorRodsCubit>()
                                      .submitTheSelectColor(colorId: 1);
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: state.selectedColor == 1 ? 0 : -20,
                                      child: Image.asset(
                                        AppImages.imageRedPen,
                                        width: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Image.asset(AppImages.imageRedPen, width: 100),
                          ],
                        );
                      }),
                    )
                  ],
                ),



              ],
            ),
          );
  }
}
