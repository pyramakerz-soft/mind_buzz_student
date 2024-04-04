import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/math/main_math.dart';
import '../../../../../core/utils.dart';
import '../../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../../../entities/passed_data.dart';
import '../../../manager/inherited_widget_game.dart';
import '../../../manager/current_game_cubit.dart';
import '../manager/contact_lesson_bloc.dart';
import '../widgets/card_of_answer.dart';

class MathematicalTransactionsScreen extends StatefulWidget {
  const MathematicalTransactionsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MathematicalTransactionsScreen();
  }
}

class _MathematicalTransactionsScreen
    extends State<MathematicalTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<CurrentGameCubit>().state.index ?? 0;
    final activeButton =
        context.watch<CurrentGameCubit>().state.activeButton ?? true;
    return BlocProvider<ContactLessonBloc>(
        create: (_) => di.sl<ContactLessonBloc>()
          ..add(GetContactLessonRequest(programId: int.parse('0'))),
        child: BlocConsumer<ContactLessonBloc, ContactLessonState>(
            listener: (context, state) {
          if (state is CompleteGameState) {
            Utils.navigateAndRemoveUntilTo(
                BlocProvider(
                    create: (_) => WhoAmICubit(), child: const WhoAmIScreen()),
                context);
          }
          log('state:$state');
        }, builder: (context, state) {
          if (state is GetContactInitial) {
            // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            // });
            return BlocProvider(
                create: (_) => CurrentGameCubit(
                    dataOfLesson: state.data, index: currentIndex),
                child: Row(
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
                                    height: MediaQuery.of(context).size.height /
                                        6+30,
                                    child: Stack(
                                      clipBehavior : Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: -10,
                                          child: SizedBox(
                                              width:
                                              (state.data[currentIndex].firstNumber ??
                                                  1) *
                                                  50,
                                              // height: MediaQuery.of(context).size.height / 2,
                                              child: MainMath.getTheBox(
                                                  countOfBalls: state
                                                      .data[currentIndex].firstNumber ??
                                                      0)),
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
                                                      number: state.data[currentIndex]
                                                              .firstNumber ??
                                                          0)),
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
                                    height: MediaQuery.of(context).size.height /
                                        6+30,
                                    child: Stack(
                                      clipBehavior : Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: -10,
                                          child: SizedBox(
                                              width:
                                              (state.data[currentIndex].secondNumber ??
                                                  1) *
                                                  50,
                                              // height: MediaQuery.of(context).size.height / 2,
                                              child: MainMath.getTheBox(
                                                  countOfBalls: state
                                                      .data[currentIndex].secondNumber ??
                                                      0)),
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
                                                      number: state.data[currentIndex]
                                                          .secondNumber ??
                                                          0)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          state.data[currentIndex].numbersOfAnswers?.length ??
                              0,
                          (index) => SizedBox(
                              width: MediaQuery.of(context).size.width / 15,
                              height: MediaQuery.of(context).size.height / 6,
                              child: GestureDetector(
                                onTap: () async {
                                  if (activeButton == true) {
                                    DataContainer.of(context)?.updateData(
                                        state.data[currentIndex].message);
                                    await context
                                        .read<CurrentGameCubit>()
                                        .checkCorrect(
                                            correctAnswer:
                                                state.data[currentIndex]
                                                        .correctAnswer ??
                                                    0,
                                            currentAnswer: (state
                                                    .data[currentIndex]
                                                    .numbersOfAnswers?[index] ??
                                                0),
                                            context: context,
                                            totalCountOfQuestions:
                                                state.data.length);
                                  }

                                  DataContainer.of(context)?.updateData(
                                      state.data[currentIndex].message);
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
