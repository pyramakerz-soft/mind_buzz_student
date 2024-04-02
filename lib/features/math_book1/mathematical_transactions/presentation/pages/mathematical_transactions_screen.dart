import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/main_math.dart';
import '../../../../../core/utils.dart';
import '../../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../../../manager/inherited_widget_game.dart';
import '../../../manager/current_index_cubit.dart';
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
          log('state:$state');
        }, builder: (context, state) {
          if (state is GetContactInitial) {
            DataContainer.of(context)
                ?.updateData(state.data[currentIndex].message);

            return BlocProvider(
                create: (_) => CurrentIndexCubit(
                    dataOfLesson: state.data, index: currentIndex),
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: [
                    Row(
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
                                        width: (state.data[currentIndex]
                                                    .firstNumber ??
                                                1) *
                                            50,
                                        // height: MediaQuery.of(context).size.height / 2,
                                        child: MainMath.getTheBox(
                                            countOfBalls: state
                                                    .data[currentIndex]
                                                    .firstNumber ??
                                                0)),
                                    20.ph,
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
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
                                            countOfBalls: state
                                                    .data[currentIndex]
                                                    .secondNumber ??
                                                0)),
                                    20.ph,
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
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
                              state.data[currentIndex].numbersOfAnswers
                                      ?.length ??
                                  0,
                              (index) => SizedBox(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
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
                                                          .numbersOfAnswers?[
                                                      index] ??
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
                    ),
                    // Positioned(
                    //   top: -70,
                    //   right: 0,
                    //   child: Row(
                    //     children: [
                    //       InkWell(
                    //         onTap: () {
                    //           log('state:${state.data}');
                    //
                    //           context.read<CurrentIndexCubit>().sayInstruction(
                    //               message: state.data[currentIndex].message);
                    //           // await TalkTts.startTalk(text: newMessageQuestion ?? '');
                    //         },
                    //         child: Image.asset(
                    //           AppImages.iconGetInstruction,
                    //           height: 70,
                    //         ),
                    //       ),
                    //       30.pw
                    //     ],
                    //   ),
                    // ),
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
