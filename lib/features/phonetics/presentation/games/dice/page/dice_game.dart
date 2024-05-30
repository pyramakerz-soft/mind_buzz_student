import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/dice_cubit.dart';
import '../widget/item_card_of_image_widget.dart';

class DiceGamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiceGamePage();
  }
}

class _DiceGamePage extends State<DiceGamePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DiceCubit>().playTheDice(
          context: context,
          functionOfSaveWords: (String currentAlphabet) {
            context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
                stateOfStringIsWord: false,
                stateOfStringWillSay: currentAlphabet);
            context
                .read<CurrentGamePhoneticsCubit>()
                .saveCurrentStringOfDice(
                letter:
                currentAlphabet);
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.only(right: 15.w, bottom: 9),
        width: MediaQuery.of(context).size.width - (100.w),
        height: MediaQuery.of(context).size.height - 69.h,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5)),
        child: BlocConsumer<DiceCubit, DiceInitial>(listener: (context, state) {
          // context.read<DiceCubit>().playTheDice(context: context);
        }, builder: (context, gameState) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - (100.w),
            height: MediaQuery.of(context).size.height - 60.h,
            child: Wrap(
              children: List.generate(
                  (gameState.gameData?.gameImages)?.length ?? 0,
                  (index) => BlocConsumer<CurrentGamePhoneticsCubit,
                          CurrentGamePhoneticsState>(
                      listener: (context, state) {},
                      builder: (context, generalStateOfGame) {
                        return GestureDetector(
                          onTap: () async {
                            print(
                                '###:${gameState.correctIndexes?.contains(gameState.gameData?.gameImages?[index].id) == false}');
                            print('###:${generalStateOfGame.stateOfAvatar}');
                            print(
                                '###:${((generalStateOfGame.stateOfAvatar == BasicOfEveryGame.stateOIdle || generalStateOfGame.stateOfAvatar == null) && gameState.correctIndexes?.contains(gameState.gameData?.gameImages?[index].id) == false)}');
                            if ((generalStateOfGame.stateOfAvatar ==
                                        BasicOfEveryGame.stateOIdle ||
                                    generalStateOfGame.stateOfAvatar == null) &&
                                (gameState.correctIndexes?.contains(gameState
                                            .gameData?.gameImages?[index].id) ==
                                        false ||
                                    (gameState.correctIndexes?.contains(
                                            gameState.gameData
                                                ?.gameImages?[index].id) ==
                                        null))) {
                              print(
                                  '###:${gameState.gameData?.gameImages?[index].word?.split('').first}');
                              print("###:${gameState.chooseWord}");
                              if (gameState.gameData?.gameImages?[index].word
                                      ?.split('')
                                      .first ==
                                  gameState.chooseWord) {
                                await context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .animationOfCorrectAnswer();
                                await context
                                    .read<DiceCubit>()
                                    .addTheCorrectAnswer(
                                        idOfUserAnswer: (gameState.gameData
                                                    ?.gameImages)?[index]
                                                .id ??
                                            0);
                                context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .addStarToStudent(
                                      stateOfCountOfCorrectAnswer:
                                          gameState.correctIndexes?.length ?? 0,
                                      mainCountOfQuestion: gameState
                                              .gameData?.gameImages?.length ??
                                          0,
                                    );

                                bool isLastLesson = context
                                    .read<DiceCubit>()
                                    .checkIfIsTheLastGameOfLesson();
                                if (isLastLesson == true) {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  context
                                      .read<CurrentGamePhoneticsCubit>().clearCurrentStringOfDice();
                                  Navigator.of(context).pop();
                                } else {
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .backToMainAvatar();
                                  context.read<DiceCubit>().playTheDice(
                                      context: context,
                                      functionOfSaveWords:
                                          (String currentAlphabet) {
                                        context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .saveTheStringWillSay(
                                                stateOfStringIsWord: false,
                                                stateOfStringWillSay:
                                                    currentAlphabet);
                                        context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .saveCurrentStringOfDice(
                                            letter:
                                            currentAlphabet);
                                      });
                                  // await context
                                  //     .read<BingoCubit>()
                                  //     .getTheRandomWord(awaitTime: false);
                                }
                                // int countOfCorrect = await context
                                //     .read<BingoCubit>()
                                //     .increaseCountOfCorrectAnswers();
                              } else {
                                context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .addWrongAnswer(actionOfWrongAnswer: () {
                                  // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                });
                              }
                            }
                          },
                          child: ItemCardOfImageWidget(
                            body: (gameState.gameData?.gameImages)?[index]
                                    .image ??
                                '',
                            maxHeight:
                                MediaQuery.of(context).size.height - 160.h,
                            maxWidth:
                                MediaQuery.of(context).size.width - (170.w),
                            hide: gameState.correctIndexes?.contains(
                                (gameState.gameData?.gameImages)?[index].id),
                            index: index,
                          ),
                        );

                        // return CachedNetworkImage(
                        //   imageUrl:
                        //       (gameState.gameData?.gameImages)?[index].image ??
                        //           '',
                        //   width:
                        //       (MediaQuery.of(context).size.width - (110.w)) / 4,
                        //   height:
                        //       (MediaQuery.of(context).size.height - 60.h) / 5,
                        //
                        //   // height: (MediaQuery.of(context).size.height -
                        //   //         (50.h + 90 + 20)) /
                        //   //     2,
                        // );
                      })),
            ),
          );
        }));
  }
}
