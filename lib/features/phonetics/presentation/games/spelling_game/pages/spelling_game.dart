import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

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
        listener: (context, state) {

        },
        builder: (context, gameState) {
          log((gameState.gameData?.toJson()).toString());
          print('(gameState.gameData?.toJson()).toString()');
          return Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        gameState.woodenBackground!,
                        height: 0.6.sh,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          Image.network(
                            gameState.gameData!.gameImages![0].image!,
                            height: 0.35.sh,
                          ),
                          10.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(gameState.gameData?.correctAns?.split('').length??0,
                                    (index) =>   DragTarget<String>(
                                  builder: (
                                      BuildContext context,
                                      List<dynamic> accepted,
                                      List<dynamic> rejected,
                                      ) {
                                    return Container(
                                      height: 0.14.sh,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          color: AppColor.dragContainerColor,
                                          border: Border.all(
                                              color: AppColor.strokeColor)),
                                      child: Center(
                                        child: Text(((gameState.correctAnswers?.length??0) - 1) >= index ? (gameState.correctAnswers?[index]??''): '',
                                          style: TextStyle(color: AppColor.darkBlueColor, fontSize: 0.04.sw,
                                              fontWeight: FontWeight.w900
                                          ),),
                                      ),
                                    );
                                  },
                                  onAcceptWithDetails:
                                      (DragTargetDetails<String> details) async{
                                    if(details.data ==
                                        gameState.gameData?.correctAns?.split('')[index].toLowerCase() &&
                                    !(gameState.correctAnswers?.contains(details.data )??false)) {
                                              await context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .animationOfCorrectAnswer();
                                              int countOfCorrect = await context
                                                  .read<SpellingCubit>()
                                                  .increaseCountOfCorrectAnswers();
                                              await context
                                                  .read<SpellingCubit>()
                                                  .addTheCorrectAnswer(
                                                      answer: details.data);
                                              context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .addStarToStudent(
                                                    stateOfCountOfCorrectAnswer:
                                                        countOfCorrect,
                                                    mainCountOfQuestion: gameState
                                                            .gameData
                                                            ?.gameLetters
                                                            ?.length ??
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
                                              else if(context
                                                  .read<SpellingCubit>()
                                                  .checkCurrentFinished()){
                                                await context
                                                    .read<
                                                        CurrentGamePhoneticsCubit>()
                                                    .backToMainAvatar();
                                                await context
                                                    .read<SpellingCubit>()
                                                    .navigateToNextIndex();

                                                // await context
                                                //     .read<SpellingCubit>()
                                                //     .getTheRandomWord(awaitTime: false);
                                              }

                                          }
                                    else if(details.data !=
                                        gameState.gameData?.correctAns?.split('')[index].toLowerCase()) {
                                      context
                                          .read<
                                          CurrentGamePhoneticsCubit>()
                                          .addWrongAnswer(
                                          actionOfWrongAnswer: () {
                                            // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                          });
                                    }
                                        },
                                )),
                          ),
                        ),
                          10.ph,
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    // height: MediaQuery.of(context).size.height - (70.h),
                    margin: EdgeInsets.only(right: 15.w),
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.64,
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColorPhonetics.DarkBorderColor,
                            width: 5)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ((gameState.cardsLetters)
                                    ?.map((e) => e.letter)
                                    .toSet()
                                    .toList()
                                    .length ??
                                1),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, childAspectRatio: 1.3),
                            itemBuilder: (context, index) {
                              return ItemCardWidget(
                                id: ((gameState.cardsLetters)!
                                        .map((e) => e.id)
                                        .toSet()
                                        .toList()[index]) ??
                                    0,
                                body: (gameState.cardsLetters)
                                        ?.map((e) => e.letter)
                                        .toSet()
                                        .toList()[index] ?? '',
                                maxHeight: 0.095.sh,
                                maxWidth: 0.07.sw,
                                index: index,
                              );
                            }),
                      ],
                    ))),
              ],
            ),
          );
        });
  }
}
