import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../../click_the_picture/widgets/single_row.dart';
import '../manager/click_the_picture_with_word_cubit.dart';

class ClickThePictureWithWord extends StatelessWidget {
  final GameModel gameData;

  const ClickThePictureWithWord({Key? key, required this.gameData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),
        child: Container(
            margin: const EdgeInsets.only(bottom: (30), left: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width - (130 + 40),
            height: MediaQuery.of(context).size.height - (50.h + 90),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: AppColorPhonetics.boarderColor, width: 5)),
            child: BlocConsumer<ClickThePictureWithWordCubit,
                ClickThePictureWithWordInitial>(listener: (context, state) {
              context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
                  stateOfStringIsWord: true,
                  stateOfStringWillSay: state.chooseWord?.word ?? '');
            }, builder: (context, gameState) {
              return Container(
                height: MediaQuery.of(context).size.height - (50.h + 90),
                width: MediaQuery.of(context).size.width - (130 + 40),
                child: Wrap(
                    spacing: 25,
                    // runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                        (gameData.gameImages?.length ?? 0),
                        (index) => BlocConsumer<CurrentGamePhoneticsCubit,
                                CurrentGamePhoneticsState>(
                            listener: (context, state) {},
                            builder: (context, generalStateOfGame) {
                              return SingleElement(
                                  width: (MediaQuery.of(context).size.width -
                                          (130 + 40)) /
                                      (((gameData.gameImages?.length ?? 0) /
                                                  2) +
                                              1)
                                          .round(),
                                  height: (MediaQuery.of(context).size.height -
                                          (50.h + 90)) /
                                      2.2,
                                  //     (gameData.gameImages?.length ?? 0),
                                  index: index,
                                  background: gameState.backGround[index],
                                  image:
                                      gameData.gameImages?[index].image ?? '',
                                  selected: gameState.correctIndexes
                                      .contains(gameData.gameImages?[index].id),
                                  onTap: () async {
                                    print('stateOfAvatar:$generalStateOfGame');
                                    if ((generalStateOfGame.stateOfAvatar ==
                                                BasicOfEveryGame.stateOIdle ||
                                            generalStateOfGame.stateOfAvatar ==
                                                null) &&
                                        gameState.correctIndexes.contains(
                                                gameData
                                                    .gameImages?[index].id) ==
                                            false) {
                                      print(
                                          "###:${(gameState.chooseWord?.word ?? '')}, ${(gameData.gameImages?[index].word)}, ${generalStateOfGame.stateOfAvatar}");
                                      if ((gameState.chooseWord?.word ?? '') ==
                                          (gameData.gameImages?[index].word)) {
                                        await context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .animationOfCorrectAnswer()
                                            .whenComplete(() async {
                                          context
                                              .read<
                                                  ClickThePictureWithWordCubit>()
                                              .addTheCorrectAnswer(
                                                  idOfUserAnswer: (gameData
                                                          .gameImages?[index]
                                                          .id ??
                                                      0));
                                          context
                                              .read<
                                                  ClickThePictureWithWordCubit>()
                                              .submitCorrectTheAnswer();
                                          final sub = context
                                              .read<
                                                  ClickThePictureWithWordCubit>()
                                              .state
                                              .correctAnswer;
                                          context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .addStarToStudent(
                                                  stateOfCountOfCorrectAnswer:
                                                      sub ?? 0,
                                                  mainCountOfQuestion: gameData
                                                          .gameImages?.length ??
                                                      0);
                                          if ((context
                                                      .read<
                                                          ClickThePictureWithWordCubit>()
                                                      .state
                                                      .gameData
                                                      .gameImages
                                                      ?.length ??
                                                  0) ==
                                              sub) {
                                            await Future.delayed(
                                                Duration(seconds: 1));
                                            context
                                                .read<
                                                    CurrentGamePhoneticsCubit>()
                                                .sendStars(gamesId: [
                                              gameState.gameData.id ?? 0
                                            ]);
                                            Navigator.of(context).pop();
                                          } else {
                                            AudioPlayerClass
                                                .player.onPlayerComplete
                                                .listen((finished) async {
                                              await context
                                                  .read<
                                                      ClickThePictureWithWordCubit>()
                                                  .getTheRandomWord();
                                            });
                                          }
                                        });
                                      } else {
                                        await context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .addWrongAnswer(
                                                actionOfWrongAnswer: () {
                                          context
                                              .read<
                                                  ClickThePictureWithWordCubit>()
                                              .sayTheCorrectAnswer();
                                        });
                                      }
                                      context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .backToMainAvatar();
                                    }
                                  });
                            }))),
              );
            })));
  }
}
