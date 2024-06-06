import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/spelling_game/widget/drag_target_card.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../../../chapters/presentation/manager/journey_bar_cubit.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/spelling_cubit.dart';
import '../widget/item_card_widget.dart';

class SpellingGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpellingCubit, SpellingInitial>(
        listener: (context, state) {
      if (state.countOfWrong == 3) {
        context.read<SpellingCubit>().increaseCountOfWrongAnswers(count: 0);
        bool isLast =
            context.read<SpellingCubit>().checkIfIsTheLastGameOfLesson();
        print('isLast:$isLast');
        if (isLast == true) {
          Future.delayed(Duration(seconds: 2), () {
            // context.read<SpellingCubit>().navigateToNextIndex();
          });
        } else {
          context.read<SpellingCubit>().increaseIndexOfCorrectAnswers();
        }
      }
    }, builder: (context, gameState) {
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
                      CachedNetworkImage(
                        imageUrl: gameState.gameData![gameState.index]
                            .gameImages!.first.image!,
                        height: 0.35.sh,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        // height: ,
                      ),
                      7.ph,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              gameState.gameData?[gameState.index].correctAns
                                      ?.split('')
                                      .length ??
                                  0,
                              (index) => DragTarget<String>(
                                    builder: (
                                      BuildContext context,
                                      List<dynamic> accepted,
                                      List<dynamic> rejected,
                                    ) {
                                      return DragTargetWidget(
                                          title:
                                              gameState.correctAnswers[index]);
                                    },
                                    onAcceptWithDetails:
                                        (DragTargetDetails<String>
                                            details) async {
                                      context
                                          .read<SpellingCubit>()
                                          .addTheCorrectAnswer(
                                              index: index,
                                              answer: details.data);

                                      if (context
                                          .read<SpellingCubit>()
                                          .checkCurrentFinished()) {
                                        if (context
                                            .read<SpellingCubit>()
                                            .checkIsCorrectAnswer()) {
                                          context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .animationOfCorrectAnswer();
                                          int countOfCorrect = await context
                                              .read<SpellingCubit>()
                                              .increaseCountOfCorrectAnswers();

                                          context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .addStarToStudent(
                                                stateOfCountOfCorrectAnswer:
                                                    countOfCorrect,
                                                mainCountOfQuestion: 3,
                                              );
                                          bool isLast = context
                                              .read<SpellingCubit>()
                                              .checkIfIsTheLastGameOfLesson();
                                          print('isLast:$isLast');
                                          if (isLast == true) {
                                            Future.delayed(Duration(seconds: 2),
                                                () {
                                              // context.read<SpellingCubit>().navigateToNextIndex();
                                              context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .sendStars(
                                                      gamesId: gameState
                                                              .gameData
                                                              ?.map((obj) =>
                                                                  obj.id ?? 0)
                                                              .toList() ??
                                                          [],
                                                      actionOfStars: (int
                                                              countOfStars,
                                                          List<int> listOfIds) {
                                                        context
                                                            .read<
                                                                JourneyBarCubit>()
                                                            .sendStars(
                                                                gamesId:
                                                                    listOfIds,
                                                                countOfStar:
                                                                    countOfStars);
                                                      });
                                              Navigator.of(context).pop();
                                            });
                                          } else {
                                            context
                                                .read<
                                                    CurrentGamePhoneticsCubit>()
                                                .backToMainAvatar();
                                            context
                                                .read<SpellingCubit>()
                                                .increaseIndexOfCorrectAnswers();
                                          }
                                        } else {
                                          context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .addWrongAnswer(
                                                  actionOfWrongAnswer:
                                                      () async {
                                            // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                          }, actionWhenTriesBeZero: () {
                                            context
                                                .read<
                                                CurrentGamePhoneticsCubit>()
                                                .sendStars(
                                                gamesId: gameState
                                                    .gameData
                                                    ?.map((obj) =>
                                                obj.id ?? 0)
                                                    .toList() ??
                                                    [],
                                                actionOfStars: (int
                                                countOfStars,
                                                    List<int> listOfIds) {
                                                  context
                                                      .read<
                                                      JourneyBarCubit>()
                                                      .sendStars(
                                                      gamesId:
                                                      listOfIds,
                                                      countOfStar:
                                                      countOfStars);
                                                });
                                          });
                                          if (!context
                                              .read<SpellingCubit>()
                                              .checkIfIsTheLastGameOfLesson())
                                            context
                                                .read<
                                                    CurrentGamePhoneticsCubit>()
                                                .increaseCountOfTries();

                                          context
                                              .read<SpellingCubit>()
                                              .clearAnswers();
                                          context
                                              .read<SpellingCubit>()
                                              .increaseCountOfWrongAnswers();
                                        }
                                      }

                                      // await context
                                      //     .read<SpellingCubit>()
                                      //     .getTheRandomWord(awaitTime: false);
                                    },
                                  )),
                        ),
                      ),
                      20.ph,
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
                        color: AppColorPhonetics.DarkBorderColor, width: 5)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ((gameState.gameData?[gameState.index])
                                ?.gameLetters
                                ?.map((e) => e.letter)
                                .toSet()
                                .toList()
                                .length ??
                            1),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1.3),
                        itemBuilder: (context, index) {
                          return ItemCardWidget(
                            id: ((gameState.gameData?[gameState.index]
                                        .gameLetters)!
                                    .map((e) => e.id)
                                    .toSet()
                                    .toList()[index]) ??
                                0,
                            body: (gameState
                                        .gameData?[gameState.index].gameLetters)
                                    ?.map((e) => e.letter)
                                    .toSet()
                                    .toList()[index] ??
                                '',
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
