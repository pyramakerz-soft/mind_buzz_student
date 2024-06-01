import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/click_the_sound/manager/click_the_sound_cubit.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/click_the_sound/manager/click_the_sound_cubit.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/x_out_game/manager/x_out_cubit.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/widget/star_widget.dart';

import '../../../../core/assets_sound.dart';
import '../../../../core/audio_player.dart';
import '../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../core/phonetics/basic_of_phonetics.dart';
import '../../../../core/talk_tts.dart';
import '../games/bingo_game/manager/bingo_cubit.dart';
import '../games/bingo_game/pages/bingo_game.dart';
import '../games/click_the_picture/manager/click_picture_cubit.dart';
import '../games/click_the_picture/pages/click_picture_game.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';
import '../games/dice/manager/dice_cubit.dart';
import '../games/dice/page/dice_game.dart';
import '../games/dice/widget/wave_dice.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../games/sorting_game/manager/sorting_cubit.dart';
import '../games/sorting_game/pages/sorting_game.dart';
import '../games/x_out_game/pages/x_out_game.dart';
import '../games/spelling_game/manager/spelling_cubit.dart';
import '../games/spelling_game/pages/spelling_game.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';

class BasedOfGameConnect extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final GetContactInitial stateOfGameData;

  const BasedOfGameConnect(
      {Key? key, required this.stateOfGame, required this.stateOfGameData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(stateOfGame.basicData?.background ?? ''),
              fit: BoxFit.fill)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          /////////////////////game title//////////////////
          Positioned(
            top: 0,
            left: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h + 5,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: stateOfGame.basicData?.backGroundOfStarBar,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  30.pw,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Image.asset(
                                      AppImagesPhonetics.backButtonIcon,
                                      height: 40.h,
                                      // width: 40.w,
                                    ),
                                  ),
                                  10.pw,
                                  GestureDetector(
                                    child: Image.asset(
                                      AppImagesPhonetics.settingButtonIcon,
                                      height: 45.h,
                                      // width: 40.w,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              AppImagesPhonetics.stayOfStarBar,
                              width: 50.w,
                            ),
                            ((stateOfGame.countOfStar ?? 0) == 0)
                                ? Image.asset(AppImagesPhonetics.barZeroStar,
                                    width: 40.w)
                                : ((stateOfGame.countOfStar ?? 0) == 1)
                                    ? Image.asset(AppImagesPhonetics.barOneStar,
                                        width: 40.w)
                                    : ((stateOfGame.countOfStar ?? 0) == 2)
                                        ? Image.asset(
                                            AppImagesPhonetics.barTwoStar,
                                            width: 40.w)
                                        : Image.asset(
                                            AppImagesPhonetics.barThreeStar,
                                            width: 40.w)
                          ],
                        )),
                      ],
                    ),
                  ),
                  stateOfGame.basicData!.gameData!.isRound
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Container(
                            width: 0.8.sw,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  stateOfGame.basicData?.gameData?.titleImage ??
                                      '',
                                  height: 75.h,
                                  width: 90.w,
                                  fit: BoxFit.fill,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    print(
                                        '%%:${MediaQuery.of(context).size.height}');
                                    await TalkTts.startTalk(
                                        text: stateOfGameData
                                                .data[stateOfGame.index].inst ??
                                            '');
                                    print(
                                        'stateOfGame.stateOfStringIsWord:${stateOfGame.stateOfStringIsWord}');
                                    print(
                                        'stateOfGame.stateOfStringIsWord:${stateOfGame.stateOfStringWillSay}');
                                    if (stateOfGame.stateOfStringIsWord ==
                                        true) {
                                      await TalkTts.startTalk(
                                          text: stateOfGame
                                                  .stateOfStringWillSay ??
                                              '');
                                    } else {
                                      await AudioPlayerClass.startPlaySound(
                                          soundPath: AppSound.getSoundOfLetter(
                                              mainGameLetter: stateOfGame
                                                      .stateOfStringWillSay ??
                                                  ''));
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: stateOfGame.avatarArtboard == null
                                          ? Image.asset(
                                              stateOfGame.currentAvatar ?? '',
                                              // height:
                                              // MediaQuery.of(context).size.height - (70.h),
                                              height: 85.h,
                                              width: 80.w,
                                            )
                                          : SizedBox(
                                              height: 110.h,
                                              width: 70.w,
                                              child: Rive(
                                                artboard:
                                                    stateOfGame.avatarArtboard!,
                                                fit: BoxFit.fill,
                                                useArtboardSize: true,
                                                alignment: Alignment.center,
                                              ))),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: 0.8.sw,
                          height: 0.32.sh,
                          padding: EdgeInsets.only(left: 10),
                          child: Stack(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                top: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    print(
                                        '%%:${MediaQuery.of(context).size.height}');
                                    await TalkTts.startTalk(
                                        text: stateOfGameData
                                                .data[stateOfGame.index].inst ??
                                            '');
                                    print(
                                        'stateOfGame.stateOfStringIsWord:${stateOfGame.stateOfStringIsWord}');
                                    print(
                                        'stateOfGame.stateOfStringIsWord:${stateOfGame.stateOfStringWillSay}');
                                    if (stateOfGame.stateOfStringIsWord ==
                                        true) {
                                      await TalkTts.startTalk(
                                          text: stateOfGame
                                                  .stateOfStringWillSay ??
                                              '');
                                    } else {
                                      await AudioPlayerClass.startPlaySound(
                                          soundPath: AppSound.getSoundOfLetter(
                                              mainGameLetter: stateOfGame
                                                      .stateOfStringWillSay ??
                                                  ''));
                                    }
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: stateOfGame.avatarArtboard == null
                                          ? Image.asset(
                                              stateOfGame.currentAvatar ?? '',
                                              // height:
                                              // MediaQuery.of(context).size.height - (70.h),
                                              height: 75.h,
                                              width: 80.w,
                                            )
                                          : Container(
                                              margin:
                                                  EdgeInsets.only(left: 7.w),
                                              child: SizedBox(
                                                  height: 90.h,
                                                  width: 65.w,
                                                  child: Rive(
                                                    artboard: stateOfGame
                                                        .avatarArtboard!,
                                                    fit: BoxFit.fill,
                                                    useArtboardSize: true,
                                                    alignment: Alignment.center,
                                                  )),
                                            )),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    print(
                                        '%%:${MediaQuery.of(context).size.height}');
                                    await TalkTts.startTalk(
                                        text: stateOfGameData
                                                .data[stateOfGame.index].inst ??
                                            '');
                                    if (stateOfGame.stateOfStringIsWord ==
                                        true) {
                                      await TalkTts.startTalk(
                                          text: stateOfGame
                                                  .stateOfStringWillSay ??
                                              '');

                                      await AudioPlayerClass.startPlaySound(
                                          soundPath: AppSound.getSoundOfLetter(
                                              mainGameLetter: stateOfGame
                                                      .stateOfStringWillSay ??
                                                  ''));
                                    } else {
                                      await AudioPlayerClass.startPlaySound(
                                          soundPath: AppSound.getSoundOfLetter(
                                              mainGameLetter: stateOfGame
                                                      .stateOfStringWillSay ??
                                                  ''));
                                    }
                                  },
                                  child: Image.asset(
                                    stateOfGame
                                            .basicData?.gameData?.titleImage ??
                                        '',
                                    height: 75.h,
                                    width: 75.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  if(stateOfGame.currentStringOfDice!=null)...{
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: WaveDice(
                        currentAlphabet: '${stateOfGame.currentStringOfDice}',
                        width: 90,
                        height: 90,
                      ),
                    )
                  }
                ],
              ),
            ),
          ),
          /////////////////////game//////////////////
          //  Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             60.ph,
          //             if ((stateOfGame.basicData?.gameData is BingoGame)) ...{
          //               BlocProvider<BingoCubit>(
          //                   create: (_) => BingoCubit(
          //                     gameData: stateOfGameData.data[stateOfGame.index],
          //                   ),
          //                   child: BingoGameScreen())
          //             }
          //                else if ((stateOfGame.basicData?.gameData is XOutGame)) ...{
          //               BlocProvider<XOutCubit>(
          //                   create: (_) => XOutCubit(
          //                     //gameData: stateOfGameData.data[stateOfGame.index],
          //                     gameData: stateOfGameData.data,
          //                   ),
          //                   child: XOutGameScreen())
          //             }
          //           ],
          //         ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.ph,
              if ((stateOfGame.basicData?.gameData is BingoGame)) ...{
                BlocProvider<BingoCubit>(
                    create: (_) => BingoCubit(
                          gameData: stateOfGameData.data[stateOfGame.index],
                        ),
                    child: BingoGameScreen())
              } else if ((stateOfGame.basicData?.gameData is XOutGame)) ...{
                BlocProvider<XOutCubit>(
                    create: (_) => XOutCubit(
                          gameData: stateOfGameData.data,
                        ),
                    child: XOutGameScreen())
              } else if ((stateOfGame.basicData?.gameData is SpellingGame)) ...{
                BlocProvider<SpellingCubit>(
                    create: (_) => SpellingCubit(
                        // gameData: stateOfGameData.data[stateOfGame.index],
                        index: stateOfGame.index,
                        background:
                            (stateOfGame.basicData?.gameData as SpellingGame)
                                .woodenBackground,
                        allGames: stateOfGameData.data),
                    child: SpellingGameScreen())
              } else if ((stateOfGame.basicData?.gameData
                  is SortingPicturesGame)) ...{
                BlocProvider<sortingCubit>(
                    create: (_) => sortingCubit(
                        gameData: stateOfGameData.data[stateOfGame.index],
                        index: stateOfGame.index,
                        background: (stateOfGame.basicData?.gameData
                                as SortingPicturesGame)
                            .woodenBackground,
                        allGames: stateOfGameData.data),
                    child: SortingGameScreen())
              } else if ((stateOfGame.basicData?.gameData is DiceGame)) ...{
                BlocProvider<DiceCubit>(
                    create: (_) => DiceCubit(
                          gameData: stateOfGameData.data[stateOfGame.index],
                        ),
                    child: DiceGamePage())
              }
            ],
          ),
        ],
      ),
    );
  }
}
