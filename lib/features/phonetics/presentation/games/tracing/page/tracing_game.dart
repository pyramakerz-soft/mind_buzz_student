import 'dart:math' hide log;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/tracing_cubit.dart';
import '../widget/letter_s.dart';

class TracingGame extends StatelessWidget {
  const TracingGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 150),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height - (60.h),
      alignment: Alignment.center,
      child: BlocConsumer<TracingCubit, TracingInitial>(
          listener: (context, state) {},
          builder: (contextOfGame, stateOfGame) {
            return GestureDetector(
                onPanDown: (details) {
                  context.read<TracingCubit>().saveFinalOffset(
                      finalOffset: RPSCustomPainterLetterS.getOffsetOfPath(Size(
                          MediaQuery.of(context).size.width / 3,
                          MediaQuery.of(context).size.height - (60.h))));
                  final renderBox = context.findRenderObject() as RenderBox;
                  final localPosition =
                      renderBox.globalToLocal(details.globalPosition);
                  context.read<TracingCubit>().checkAndAddPoints(
                      renderBox: renderBox,
                      localPosition: localPosition,
                      details: details.localPosition);
                  // log("check the state of complete :${RPSCustomPainterLetterS.isCompleted(count1: stateOfGame.count1??0, count2: stateOfGame.count2??0,count3:stateOfGame.count3??0 , onComplete: () {
                  //       Navigator.of(context).pop();
                  //     })}");
                },
                onPanUpdate: (details) {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final localPosition =
                      renderBox.globalToLocal(details.globalPosition);
                  context.read<TracingCubit>().checkAndAddPoints(
                      renderBox: renderBox,
                      localPosition: localPosition,
                      details: details.localPosition);


                },
                onPanEnd: (details) {
                  RPSCustomPainterLetterS.isCompleted(count1: stateOfGame.count1 ?? 0, count2: stateOfGame.count2 ?? 0, count3: stateOfGame.count3 ?? 0, onComplete: () async {
                    await context
                        .read<CurrentGamePhoneticsCubit>()
                        .animationOfCorrectAnswer().whenComplete(() async {
                      context
                          .read<CurrentGamePhoneticsCubit>()
                          .addStarToStudent(
                        stateOfCountOfCorrectAnswer:
                        1,
                        mainCountOfQuestion: 1 ??
                            0,
                      );
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.of(contextOfGame).pop();
                    });
                  });
                  // setState(() {
                  // //  _offsets.add(Offset.zero);
                  // });
                },
                child: CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width / 3,
                        MediaQuery.of(context).size.height -
                            (60.h)), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainterLetterS(whenDone: () {
                      List<int> counters =
                          RPSCustomPainterLetterS.getCountOfPints(
                              points: stateOfGame.offsets,
                              size: Size(MediaQuery.of(context).size.width / 3,
                                  MediaQuery.of(context).size.height - (60.h)));
                      context.read<TracingCubit>().saveCounter(
                          count1: counters.first,
                          count2: counters[1],
                          count3: counters.last);
                    }),
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width / 3,
                          MediaQuery.of(context).size.height - (60.h)),
                      painter: FlipBookPainterLetterS(stateOfGame.offsets),
                    )));
          }),
    );
  }
}
