import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../../../core/math/main_math.dart';
import '../../../../../../core/utils.dart';
import '../../../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../../../manager/current_game_cubit.dart';
import '../../../manager/current_game_state.dart';
import '../../../manager/get_contact/contact_lesson_bloc.dart';
import '../manager/beads_sum_mcq_cubit.dart';
import '../widgets/card_of_answer.dart';

class MathematicalTransactionsScreen extends StatelessWidget {
  final Function() defaultActionOfSuccessAnswer;
  final Function() defaultActionOfWrongAnswer;
  const MathematicalTransactionsScreen(
      {Key? key,
      required this.defaultActionOfSuccessAnswer,
      required this.defaultActionOfWrongAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionData = context.watch<BeadsSumMcqCubit>().questionData;

    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6 + 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: -10,
                              child: SizedBox(
                                  width: int.parse(
                                          "${(questionData.control?.control ?? 1)}") *
                                      50,
                                  // height: MediaQuery.of(context).size.height / 2,
                                  child: MainMath.getTheBox(
                                      countOfBalls: int.parse(
                                          "${questionData.control?.control ?? 0}"))),
                            ),
                            Positioned(
                              // bottom: 0,
                              child: Column(
                                children: [
                                  30.ph,
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      child: CardOfAnswer(
                                          number: int.parse(
                                              "${questionData.control?.control ?? 0}"))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            20.ph,
                            Text(
                              '+',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6 + 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: -10,
                              child: SizedBox(
                                  width: int.parse(
                                          "${(questionData.control?.action ?? 1)}") *
                                      50,
                                  // height: MediaQuery.of(context).size.height / 2,
                                  child: MainMath.getTheBox(
                                      countOfBalls: int.parse(
                                          "${questionData.control?.action ?? 0}"))),
                            ),
                            Positioned(
                              // bottom: 0,
                              child: Column(
                                children: [
                                  30.ph,
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      child: CardOfAnswer(
                                          number: int.parse(
                                              "${questionData.control?.action ?? 0}"))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            20.ph,
                            Text(
                              '=',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              questionData.choices?.length ?? 0,
              (index) => Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width / 15,
                  height: MediaQuery.of(context).size.height / 6,
                  child: GestureDetector(
                    onTap: () async {
                      await context.read<BeadsSumMcqCubit>().checkCorrect(
                            actionOfSuccess: () =>
                                defaultActionOfSuccessAnswer(),
                            actionOfWrong: () => defaultActionOfWrongAnswer(),
                            currentAnswer: int.parse(
                                "${questionData.choices?[index] ?? 0}"),
                          );
                    },
                    child: CardOfAnswer(
                        number:
                            int.parse("${questionData.choices?[index] ?? 0}")),
                  ))),
        )),
      ],
    );
  }
}
