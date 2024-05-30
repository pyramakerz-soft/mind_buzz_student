import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/sorting_cups_cubit.dart';
import '../widget/cup_widget.dart';
import '../widget/item_card_widget_sorting_cups.dart';

class GamesSortingCups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 15.w),
        width: MediaQuery.of(context).size.width - 40.w,
        height: MediaQuery.of(context).size.height - 70.h,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5)),
        child: BlocConsumer<SortingCupsCubit, SortingCupsInitial>(
            listener: (context, state) {
          context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
              stateOfStringIsWord: false,
              stateOfStringWillSay: state.chooseWord?.letter ?? '');
        }, builder: (context, gameState) {
          return Column(
            children: [
              ...List.generate(
                  ((gameState.gameData.gameLetters?.length ?? 0) / 10).ceil(),
                  (rowIndex) {
                int startIndex = rowIndex * 10;
                int endIndex = (rowIndex + 1) * 10;
                endIndex =
                    endIndex > (gameState.gameData.gameLetters?.length ?? 0)
                        ? (gameState.gameData.gameLetters?.length ?? 0)
                        : endIndex;

                List<GameLettersModel> rowItems =
                    (gameState.gameData.gameLetters)
                            ?.sublist(startIndex, endIndex) ??
                        [];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rowItems.asMap().entries.map(
                    (item) {
                      GlobalKey key = GlobalKey();

                      return Row(
                        key: key,
                        children: [
                          Draggable<GameLettersModel>(
                              // onDraggableCanceled:
                              //     (Velocity velocity, Offset offset) {},
                              // onDragStarted: () {},
                              data: item.value,
                              childWhenDragging: SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - (5)) /
                                        13,
                                height: (MediaQuery.of(context).size.height -
                                        (50)) /
                                    4,
                              ),
                              feedback: ItemCardWidgetOFSortingCups(
                                width:
                                    (MediaQuery.of(context).size.width - (5)) /
                                        13,
                                height: (MediaQuery.of(context).size.height -
                                        (50)) /
                                    4,
                                body: item.value.letter ?? '',
                                hide: gameState.correctIndexes
                                        ?.contains(item.value.id ?? '') ??
                                    false,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: double.parse(
                                        "${(item.key) % 5 == 0.0 ? 0.0 : double.parse("${(item.key) % 4 != 0 ? ((item.key) > 5 ? (item.key - 5) : item.key) * 5 : (((item.key) > 5 ? (item.key - 5) : item.key) - 2) * 5}")}")),
                                child: gameState.correctIndexes
                                            ?.contains(item.value.id) ==
                                        true
                                    ? SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    (5)) /
                                                13,
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                (50)) /
                                            4,
                                      )
                                    : ItemCardWidgetOFSortingCups(
                                        hide: gameState.correctIndexes
                                                ?.contains(
                                                    item.value.id ?? '') ??
                                            false,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    (5)) /
                                                13,
                                        height: (MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                (50)) /
                                            4,
                                        body: item.value.letter ?? '',
                                      ),
                              )),
                          if ((item.key) < rowItems.length - 1)
                            const SizedBox(width: 5),
                        ],
                      );
                    },
                  ).toList(),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      gameState.gameData.mainLetter?.split('').length ?? 0,
                      (index) {
                    return BlocConsumer<CurrentGamePhoneticsCubit,
                            CurrentGamePhoneticsState>(
                        listener: (context, state) {},
                        builder: (context, generalStateOfGame) {
                          return DragTarget<GameLettersModel>(
                            builder: (context, candidateItems, rejectedItems) {
                              // log('candidateItems:${candidateItems}');
                              // log('rejectedItems:${context.}');
                              return CupWidget(
                                  image: gameState.gameData.mainLetter
                                          ?.split('')[index] ??
                                      '');
                            },
                            onAcceptWithDetails: (item) async {
                              if ((generalStateOfGame.stateOfAvatar ==
                                      BasicOfEveryGame.stateOIdle ||
                                  generalStateOfGame.stateOfAvatar == null)) {
                                print(
                                    "##:${gameState.gameData.mainLetter?.split('')[index].toLowerCase()}");
                                print(
                                    "##:${(item.data.letter?.toLowerCase() ?? '')}");
                                if (gameState.gameData.mainLetter
                                        ?.split('')[index]
                                        .toLowerCase() ==
                                    (item.data.letter?.toLowerCase() ?? '')) {
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .animationOfCorrectAnswer();

                                  await context
                                      .read<SortingCupsCubit>()
                                      .addTheCorrectAnswer(
                                          idOfUserAnswer: item.data.id ?? 0);
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addStarToStudent(
                                        stateOfCountOfCorrectAnswer:
                                            gameState.correctIndexes?.length ??
                                                0,
                                        mainCountOfQuestion: gameState
                                                .gameData.gameLetters?.length ??
                                            0,
                                      );
                                  bool isLastLesson = context
                                      .read<SortingCupsCubit>()
                                      .checkIfIsTheLastGameOfLesson();
                                  if (isLastLesson == true) {
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .clearCurrentStringOfDice();
                                    Navigator.of(context).pop();
                                  } else {
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .backToMainAvatar();
                                    context
                                        .read<SortingCupsCubit>()
                                        .getTheRandomWord();
                                    // await context
                                    //     .read<BingoCubit>()
                                    //     .getTheRandomWord(awaitTime: false);
                                  }
                                  print('item:${item.data}');
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .backToMainAvatar();
                                } else {
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addWrongAnswer(actionOfWrongAnswer: () {
                                    // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                  });
                                }

                              }
                            },
                          );
                        });
                  }),
                ),
              ),
            ],
          );
        }));
  }
}