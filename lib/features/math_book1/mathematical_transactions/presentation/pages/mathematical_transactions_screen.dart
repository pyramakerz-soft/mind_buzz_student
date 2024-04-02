import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../../../../core/injection/injection_container.dart' as di;

import '../../../../../core/main_math.dart';
import '../../../../../core/utils.dart';
import '../../../../loading_intro/presentation/bloc/loading_cubit.dart';
import '../../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../../../manager/current_index_cubit.dart';
import '../../../manager/handling_lesson_cubit.dart';
import '../manager/contact_lesson_bloc.dart';
import '../widgets/card_of_answer.dart';

class MathematicalTransactionsScreen extends StatelessWidget {
  const MathematicalTransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<CurrentIndexCubit>().state;
    return BlocProvider<ContactLessonBloc>(
        create: (_) => di.sl<ContactLessonBloc>()
          ..add(GetContactLessonRequest(programId: int.parse('0'))),
        child: BlocConsumer<ContactLessonBloc, ContactLessonState>(
            listener: (context, state) {

          if (state is CompleteGameState) {
            Utils.navigateAndRemoveUntilTo(
                BlocProvider(
                    create: (_) => WhoAmICubit(), child: WhoAmIScreen()),
                context);
          }
          // else if (state is GetContactInitial) {
          //   context.read<HandlingGameCubit>().sayInstruction();
          // }
          log('state:$state');
        }, builder: (context, state) {
          log('state:$state');

          if (state is GetContactInitial) {
            return BlocProvider(
                create: (_) => HandlingGameCubit(dataOfLesson: state.data),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width:
                                        (state.data[currentIndex].firstNumber ??
                                                1) *
                                            50,
                                    // height: MediaQuery.of(context).size.height / 2,
                                    child: MainMath.getTheBox(
                                        countOfBalls: state.data[currentIndex]
                                                .firstNumber ??
                                            0)),
                                20.ph,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    child: CardOfAnswer(
                                        number: state.data[currentIndex]
                                                .firstNumber ??
                                            0))
                              ],
                            ),
                            Text(
                              '+',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: (state.data[currentIndex]
                                                .secondNumber ??
                                            1) *
                                        50,
                                    // height: MediaQuery.of(context).size.height / 2,
                                    child: MainMath.getTheBox(
                                        countOfBalls: state.data[currentIndex]
                                                .secondNumber ??
                                            0)),
                                20.ph,
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    child: CardOfAnswer(
                                        number: state.data[currentIndex]
                                                .secondNumber ??
                                            0))
                              ],
                            ),
                            Text(
                              '=',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          state.data[currentIndex].numbersOfAnswers?.length ??
                              0,
                          (index) => SizedBox(
                              width: MediaQuery.of(context).size.width / 15,
                              height: MediaQuery.of(context).size.height / 6,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<CurrentIndexCubit>()
                                      .checkCorrect(
                                          correctAnswer: state
                                                  .data[currentIndex]
                                                  .correctAnswer ??
                                              0,
                                          currentAnswer: (state
                                                  .data[currentIndex]
                                                  .numbersOfAnswers?[index] ??
                                              0),
                                          context: context,
                                          totalCountOfQuestions:
                                              state.data.length);
                                },
                                child: CardOfAnswer(
                                    number: state.data[currentIndex]
                                            .numbersOfAnswers?[index] ??
                                        0),
                              ))),
                    )),
                  ],
                ));
          } else if (state is GetContactLoadingInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
          }
        }));
  }
}
