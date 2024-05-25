import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/spelling_cubit.dart';
import '../widget/item_card_widget.dart';

class SpellingGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpellingCubit, SpellingInitial>(
        listener: (context, state) {},
        builder: (context, gameState) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Image.asset(gameState.woodenBackground!,
              height: 0.6.sh,),
            ),
            Container(
                alignment: Alignment.center,
                // height: MediaQuery.of(context).size.height - (70.h),
                margin: EdgeInsets.only(right: 15.w),
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height*0.5,
                // padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5)),
                child: Center(
                    child: Wrap(
                      children: List.generate(
                          (gameState.cardsLetters)?.length ?? 0,
                              (rowIndex) =>  ItemCardWidget(
                            onTap: () async {
                              if ((gameState.cardsLetters)?[rowIndex]
                                  .letter
                                  ?.toLowerCase() ==
                                  (gameState.chooseWord?.letter
                                      ?.toLowerCase() ??
                                      '')) {
                                await context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .animationOfCorrectAnswer();
                                int countOfCorrect = await context
                                    .read<SpellingCubit>()
                                    .increaseCountOfCorrectAnswers();
                                await context
                                    .read<SpellingCubit>()
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

                                bool isLastLesson = context
                                    .read<SpellingCubit>()
                                    .checkIfIsTheLastGameOfLesson();
                                if (isLastLesson == true) {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  Navigator.of(context).pop();
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
                            maxHeight: 50,
                            maxWidth:70,
                             index: rowIndex,
                          )),
                    ))),
          ],
        );
      }
    );
  }
}
