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
      width: Size(400, 200).width,
      height: Size(400, 200).height,
      alignment: Alignment.center,
      child: BlocConsumer<TracingCubit, TracingInitial>(
          listener: (context, state) {},
          builder: (contextOfGame, stateOfGame) {
            return GestureDetector(
                onPanDown: (details) {
                  // final renderBox = context.findRenderObject() as RenderBox;
                  // final localPosition =
                  //     renderBox.globalToLocal(details.globalPosition);
                  context.read<TracingCubit>().checkTheLocationOfPoint(
                      point: details.localPosition,
                      size: Size(MediaQuery.of(context).size.width / 3,
                          MediaQuery.of(context).size.height - (60.h)));
                },
                onPanUpdate: (details) {
                  // final renderBox = context.findRenderObject() as RenderBox;
                  // final localPosition =
                      // renderBox.globalToLocal(details.localPosition);
                  context.read<TracingCubit>().checkTheLocationOfPoint(
                      point: details.localPosition,
                      size: Size(MediaQuery.of(context).size.width / 3,
                          MediaQuery.of(context).size.height - (60.h)));
                },
                onPanEnd: (details) {},
                child: CustomPaint(
                  size: Size(400, 200),
                  painter: FlipBookPainterLetterS(
                      colorsOfPaths: stateOfGame.colorsOfPaths),
                ));
          }),
    );
  }
}
