import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/games_structure/phonetics/assets_images_phonetics.dart';
import '../../../../../../core/games_structure/phonetics/basic_of_game.dart';
import '../../../../../../core/games_structure/phonetics/phonetics_color.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../../chapters/presentation/manager/journey_bar_cubit.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/bloc/contact_lesson_bloc.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/drag_out_cubit.dart';

class DragOutGame extends StatelessWidget {
  // final List<GameModel> gameData;
  // DragOutGame({required this.gameData});
  @override
  Widget build(BuildContext context) {
    // final gameData = context.watch<DragOutCubit>().state.gameData;
    final stateOfCurrentGamePhoneticsCubit =
        context.watch<CurrentGamePhoneticsCubit>().state;
    return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),
        child: BlocConsumer<DragOutCubit, DragOutInitial>(
            listener: (context, state) {
          context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
              stateOfStringIsWord: true,
              stateOfStringWillSay:
                  state.gameData[state.index ?? 0].mainLetter ?? '');
        }, builder: (context, gameState) {
          return Row(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 15, left: 10),
                  child: DragTarget<GameImagesModel>(builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return (stateOfCurrentGamePhoneticsCubit.stateOfAvatar ==
                            BasicOfGame.stateOfWin)
                        ? Image.asset(
                            stateOfCurrentGamePhoneticsCubit
                                    .basicData?.gameData?.completeBasket ??
                                '',
                            height:
                                (MediaQuery.of(context).size.height / 2.8).h,
                            width: 130,
                          )
                        : Image.asset(
                            AppImagesPhonetics.imageBasket,
                            height:
                                (MediaQuery.of(context).size.height / 2.8).h,
                            width: 130,
                          );
                  }, onAcceptWithDetails: (item) async {
                    if (item.data.word
                            .toString()
                            .split('')
                            .first
                            .toLowerCase() !=
                        (gameState.gameData[gameState.index ?? 0].mainLetter
                                ?.toLowerCase() ??
                            '')) {
                      await context
                          .read<CurrentGamePhoneticsCubit>()
                          .animationOfCorrectAnswer();
                      int countOfCorrect = await context
                          .read<DragOutCubit>()
                          .increaseCountOfCorrectAnswers();
                      context
                          .read<CurrentGamePhoneticsCubit>()
                          .addStarToStudent(
                            stateOfCountOfCorrectAnswer: countOfCorrect,
                            mainCountOfQuestion: gameState.gameData.length,
                          );
                      bool isLastLesson = context
                          .read<DragOutCubit>()
                          .checkIfIsTheLastGameOfLesson();
                      if (isLastLesson == true) {
                        await Future.delayed(const Duration(seconds: 2));
                        context.read<CurrentGamePhoneticsCubit>().sendStars(
                            gamesId: gameState.gameData
                                .map((obj) => obj.id ?? 0)
                                .toList(),
                            actionOfStars:
                                (int countOfStars, List<int> listOfIds) {
                              context.read<JourneyBarCubit>().sendStars(
                                  gamesId: listOfIds,
                                  countOfStar: countOfStars);
                            });

                        Navigator.of(context).pop();
                      } else {
                        await context
                            .read<CurrentGamePhoneticsCubit>()
                            .backToMainAvatar();
                        context.read<DragOutCubit>().updateIndexOfCurrentGame();
                        context.read<CurrentGamePhoneticsCubit>().increaseCountOfTries();
                      }
                    } else {
                      context.read<CurrentGamePhoneticsCubit>().addWrongAnswer(
                          actionOfWrongAnswer: () {
                        // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                      }, actionWhenTriesBeZero: () {
                        context.read<CurrentGamePhoneticsCubit>().sendStars(
                            gamesId: gameState.gameData
                                .map((obj) => obj.id ?? 0)
                                .toList(),
                            actionOfStars:
                                (int countOfStars, List<int> listOfIds) {
                              context.read<JourneyBarCubit>().sendStars(
                                  gamesId: listOfIds,
                                  countOfStar: countOfStars);
                            });
                      });
                    }
                  })),
              Container(
                margin: const EdgeInsets.only(bottom: (15 + 50), top: 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: MediaQuery.of(context).size.width - (130 + 50 + 130),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: AppColorPhonetics.boarderColor, width: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      gameState.gameData[gameState.index ?? 0].gameImages
                              ?.length ??
                          0,
                      (index) => Draggable<GameImagesModel>(
                          data: gameState.gameData[gameState.index ?? 0]
                              .gameImages?[index],
                          childWhenDragging: SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    (130 + 50 + 130)) /
                                4,
                            height: 130.h,
                          ),
                          feedback: CachedNetworkImage(
                            imageUrl: gameState.gameData[gameState.index ?? 0]
                                    .gameImages?[index].image ??
                                '',
                            width: (MediaQuery.of(context).size.width -
                                    (130 + 50 + 130)) /
                                4,
                            height: 130.h,
                            placeholder: (context, url) => const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                            errorWidget: (context, url, error) => Text('${gameState.gameData[gameState.index ?? 0]
                                .gameImages?[index].word}'),
                            // height: ,
                          ),
                          child: ((stateOfCurrentGamePhoneticsCubit
                                          .stateOfAvatar ==
                                      BasicOfGame.stateOfWin) &&
                                  (gameState.gameData[gameState.index ?? 0]
                                          .gameImages?[index].word
                                          .toString()
                                          .split('')
                                          .first
                                          .toLowerCase() !=
                                      (gameState.gameData[gameState.index ?? 0]
                                              .mainLetter
                                              ?.toLowerCase() ??
                                          '')))
                              ? SizedBox(
                                  width: (MediaQuery.of(context).size.width -
                                          (130 + 50 + 130)) /
                                      4,
                                  height: 130.h,
                                  // height: ,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    TalkTts.startTalk(
                                        text: gameState
                                                .gameData[gameState.index ?? 0]
                                                .gameImages?[index]
                                                .word ??
                                            '');
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: gameState
                                            .gameData[gameState.index ?? 0]
                                            .gameImages?[index]
                                            .image ??
                                        '',
                                    width: (MediaQuery.of(context).size.width -
                                            (130 + 50 + 130)) /
                                        4,
                                    height: 130.h,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) => Center(
                                      child: Text('${gameState.gameData[gameState.index ?? 0]
                                          .gameImages?[index].word}'),
                                    ),
                                    // height: ,
                                  ),
                                ))),
                ),
              )
            ],
          );
        }));
  }
}
