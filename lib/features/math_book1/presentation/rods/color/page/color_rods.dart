import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../../../core/assets_images.dart';
import '../../../../../../core/math/main_math.dart';
import '../../../../domain/entities/lesson_questions.dart';
import '../manager/color_rods_cubit.dart';

class ColorRods extends StatelessWidget {
  final Function() defaultActionOfSuccessAnswer;
  final Function() defaultActionOfWrongAnswer;
  final LessonQuestionsModel questionData;

  const ColorRods(
      {Key? key,
      required this.questionData,
      required this.defaultActionOfSuccessAnswer,
      required this.defaultActionOfWrongAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
        create: (_) => ColorRodsCubit(questionData: questionData),
        child: BlocBuilder<ColorRodsCubit, ColorRodsInitial>(
            builder: (context, state) {
          return SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.ph,
                Container(
                  // alignment: Alignment.centerRight,
                  child: MainMath.getTheBox(
                      countOfBoxes: int.parse("${questionData.control?.control??0}"),
                      isSolid: false,
                      sizeOfOne: Size(width / 12, (width / 19).toDouble())),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox()),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 75,
                          child: Stack(
                            children: [
                              Positioned(
                                right:-20,
                                child:                         Image.asset(AppImages.imageBluePen, width: 100,),)
                            ],
                          ),
                        ),
                        Container(
                          height: 75,
                          child: Stack(
                            children: [
                              Positioned(
                                right:-20,
                                child:                         Image.asset(AppImages.imageRedPen, width: 100,),)
                            ],
                          ),
                        )
                        // Image.asset(AppImages.imageRedPen, width: 100),
                      ],
                    )),
                  ],
                )

              ],
            ),
          );
        }));
  }
}
