import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/tracing_cubit.dart';
import '../widget/letter_s.dart';

class TracingGame extends StatelessWidget {
  const TracingGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height - (70.h),
      alignment: Alignment.center,
      child: BlocConsumer<TracingCubit, TracingInitial>(
          listener: (context, state) {},
          builder: (context, stateOfGame) {
            return Stack(
              children: [
                if (stateOfGame.stateOfGame?.basicData!.tracingOfLetter !=
                    null) ...{
                  GestureDetector(
                      onPanDown: (details) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        final localPosition =
                            renderBox.globalToLocal(details.globalPosition);
                        context
                            .read<TracingCubit>()
                            .saveCurrentPosition(position: localPosition);

                        context.read<TracingCubit>().checkTheLocationOfPoint(
                              point: localPosition,
                              size: Size(MediaQuery.of(context).size.width / 3,
                                  MediaQuery.of(context).size.height - (70.h)),
                            );
                      },
                      onPanUpdate: (details) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        final localPosition =
                            renderBox.globalToLocal(details.globalPosition);

                        context
                            .read<TracingCubit>()
                            .saveCurrentPosition(position: localPosition);
                        context.read<TracingCubit>().checkTheLocationOfPoint(
                              point: localPosition,
                              size: Size(MediaQuery.of(context).size.width / 3,
                                  MediaQuery.of(context).size.height - (70.h)),
                            );
                      },
                      onPanEnd: (details) async {
                        if (stateOfGame.colorsOfPaths
                            .where((element) => element == null)
                            .isEmpty) {
                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .animationOfCorrectAnswer();
                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .addStarToStudent(
                                stateOfCountOfCorrectAnswer: 1,
                                mainCountOfQuestion: 1,
                              );
                          await Future.delayed(const Duration(seconds: 3));
                          Navigator.pop(context);
                        } else {
                          context
                              .read<TracingCubit>()
                              .saveCurrentPosition(position: null);
                        }
                      },
                      child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width / 3,
                              MediaQuery.of(context).size.height - (70.h)),
                          painter: stateOfGame.stateOfGame?.basicData!
                              .tracingOfLetter!(stateOfGame.colorsOfPaths))),
                },
                if (stateOfGame.currentPosition != null) ...{
                  Positioned(
                      top: stateOfGame.currentPosition?.dy,
                      left: stateOfGame.currentPosition?.dx,
                      child: Image.asset(
                        AppImagesPhonetics.position2Finger,
                        height: 70.h,
                        // width: 50.w,
                      ))
                }
              ],
            );
          }),
    );
  }
}
