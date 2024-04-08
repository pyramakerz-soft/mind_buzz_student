import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/math/main_math.dart';
import '../manager/beads_matching_cubit.dart';
import '../widget/dot_lines.dart';

class MatchingScreen extends StatelessWidget {
  final Function() defaultActionOfSuccessAnswer;
  final Function() defaultActionOfWrongAnswer;
  MatchingScreen(
      {Key? key,
      required this.defaultActionOfSuccessAnswer,
      required this.defaultActionOfWrongAnswer})
      : super(key: key);
  Offset? firstPosition;
  Offset? secondPosition;
  final GlobalKey _key = GlobalKey();
  final List<GlobalKey> listKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];

  @override
  Widget build(BuildContext context) {
    final questionData = context.watch<BeadsMatchingCubit>().questionData;

    return BlocConsumer<BeadsMatchingCubit, BeadsMatchingInitial>(
        listener: (context, state) {
      log('state:$state');
    }, builder: (context, state) {
      return CustomPaint(
          painter: DottedLinePainterOfMatch(state.position1, state.position2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: int.parse(
                                "${(questionData.control?.control ?? 1)}") *
                            50,
                        child: MainMath.getTheBox(
                            countOfBalls: int.parse(
                                "${questionData.control?.control ?? 0}"))),
                    SizedBox(
                        key: _key,
                        width: int.parse(
                                "${(questionData.control?.action ?? 1)}") *
                            50,
                        child: MainMath.getTheBox(
                            countOfBalls: int.parse(
                                "${questionData.control?.action ?? 0}"))),
                  ],
                ),
              ),
              SizedBox(
                height: 28 * 9,
                child: Column(
                  children: List.generate(
                      9,
                      (index) => GestureDetector(
                            key: listKeys[index],
                            onTap: () async {
                              final RenderBox renderBox = _key.currentContext!
                                  .findRenderObject() as RenderBox;
                              final Offset localPosition =
                                  renderBox.localToGlobal(Offset.zero);
                              final RenderBox renderBox2 = listKeys[index]
                                  .currentContext!
                                  .findRenderObject() as RenderBox;
                              final Offset localPosition2 =
                                  renderBox2.localToGlobal(Offset.zero);
                              context.read<BeadsMatchingCubit>().updatedThePosition(
                                  position1: Offset(
                                      localPosition.dx +
                                          (int.parse(
                                                  "${(questionData.control?.action ?? 1)}") *
                                              50),
                                      localPosition.dy - 100),
                                  position2: Offset(localPosition2.dx,
                                      localPosition2.dy - 80));
                              await Future.delayed(const Duration(seconds: 1));
                              await context.read<BeadsMatchingCubit>().checkCorrect(
                                actionOfSuccess: () =>
                                    defaultActionOfSuccessAnswer(),
                                actionOfWrong: () => defaultActionOfWrongAnswer(),
                                currentAnswer: int.parse("${index + 1}"),
                              );
                            },
                            child: SizedBox(
                                width: int.parse("${(index + 1)}") * 50,
                                // height: 27,
                                child: MainMath.getTheBox(
                                    countOfBalls: int.parse("${index + 1}"))),
                          )),
                ),
              )
            ],
          ));
    });
  }
}
