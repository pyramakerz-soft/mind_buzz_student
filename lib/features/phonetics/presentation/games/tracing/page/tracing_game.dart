import 'dart:math' hide log;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/tracing_cubit.dart';
import '../widget/letter_s.dart';

class TracingGame extends StatelessWidget {
  const TracingGame({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
        Container(
          // padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width/3),
          width: MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height - (60.h),
          alignment: Alignment.center,
          child:  BlocConsumer<TracingCubit,
              TracingInitial>(
            listener: (context, state) {},
        builder: (contextOfGame, stateOfGame) { return GestureDetector(
              onPanDown: (details) {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                context.read<TracingCubit>().checkAndAddPoints(
                    renderBox: renderBox,
                    localPosition: localPosition,
                    details: details.localPosition);
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
                // setState(() {
                // //  _offsets.add(Offset.zero);
                // });
              },
              child: CustomPaint(
                  size: Size(
                      MediaQuery.of(context).size.width / 3,
                      MediaQuery.of(context).size.height -
                          (60.h)), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainterLetterS(),
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width / 3,
                        MediaQuery.of(context).size.height - (60.h)),
                    painter: FlipBookPainterLetterS(stateOfGame.offsets),
                  )));}),
        );
  }
}
