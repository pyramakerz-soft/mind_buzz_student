import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/bingo_cubit.dart';
import '../widget/item_card_widget.dart';

class BingoGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),

        margin: EdgeInsets.only(right: 15.w),
        width: MediaQuery.of(context).size.width - (100.w),
        height: MediaQuery.of(context).size.height - 150.h,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5)),
        child: BlocConsumer<BingoCubit, BingoInitial>(
            listener: (context, state) {},
            builder: (context, gameState) {
              return Center(
                  child: Wrap(
                children: List.generate(
                    (gameState.cardsLetters)?.length ?? 0,
                    (rowIndex) => (gameState.cardsLetters)?[rowIndex].id == null
                        ? Container(
                            alignment: Alignment.center,
                            color: AppColorPhonetics.DarkBorderColor,
                            width:
                                (MediaQuery.of(context).size.width - (106.w)) /
                                    3,
                            height:
                                (MediaQuery.of(context).size.height - 162.h) /
                                    3,
                            child: Text(
                              'Bingo',
                              style: TextStyle(
                                  fontSize: 39,
                                  fontFamily: AppTheme.getFontFamily5(),
                                  color: Colors.white),
                            ))
                        : ItemCardWidget(
                            onTap: () async {
                              if ((gameState.cardsLetters)?[rowIndex]
                                      .letter
                                      ?.toLowerCase() !=
                                  (gameState.chooseWord?.letter
                                          ?.toLowerCase() ??
                                      '')) {
                                await context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .animationOfCorrectAnswer();
                                int countOfCorrect = await context
                                    .read<BingoCubit>()
                                    .increaseCountOfCorrectAnswers();
                                await context
                                    .read<BingoCubit>()
                                    .addTheCorrectAnswer(
                                        idOfUserAnswer:
                                            (gameState.cardsLetters)?[rowIndex]
                                                    .id ??
                                                0);
                                context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .addStarToStudent(
                                      stateOfCountOfCorrectAnswer:
                                          countOfCorrect,
                                      mainCountOfQuestion: gameState
                                              .gameData?.gameLetters?.length ??
                                          0,
                                    );
                                await context
                                    .read<BingoCubit>()
                                    .getTheRandomWord();
                                bool isLastLesson = context
                                    .read<BingoCubit>()
                                    .checkIfIsTheLastGameOfLesson();
                                if (isLastLesson == true) {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  Navigator.of(context).pop();
                                } else {
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .backToMainAvatar();
                                }
                              } else {
                                context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .addWrongAnswer(actionOfWrongAnswer: () {
                                  // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                });
                              }
                            },
                            body: (gameState.cardsLetters)?[rowIndex].letter ??
                                '',
                            maxHeight:
                                MediaQuery.of(context).size.height - 162.h,
                            maxWidth:
                                MediaQuery.of(context).size.width - (107.w),
                            hide: gameState.correctIndexes?.contains(
                                (gameState.cardsLetters)?[rowIndex].id),
                          )),
              ));
            }));
  }
}
