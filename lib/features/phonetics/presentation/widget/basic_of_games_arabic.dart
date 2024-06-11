import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/click_the_sound/manager/click_the_sound_cubit.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/assets_sound.dart';
import '../../../../core/audio_player.dart';
import '../../../../core/games_structure/arabic/game_arabic_types.dart';
import '../../../../core/games_structure/phonetics/basic_of_game.dart';
import '../../../../core/talk_tts.dart';
import '../games/click_the_picture/manager/click_picture_cubit.dart';
import '../games/click_the_picture/pages/click_picture_game.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../games/tracing/manager/tracing_cubit.dart';
import '../games/tracing/page/tracing_game.dart';
import '../games/videos/screen/game_video.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';

class BasedOfGameArabic extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final GetContactInitial stateOfGameData;

  const BasedOfGameArabic(
      {super.key, required this.stateOfGame, required this.stateOfGameData});
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
        alignment: Alignment.center,
        children: [
          ///////////////////game//////////////////

          Positioned(
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if ((stateOfGame.basicData?.gameData is ClickPicture)) ...{
                    BlocProvider<ClickPictureCubit>(
                        create: (_) => ClickPictureCubit(
                            gameData: stateOfGameData.data[stateOfGame.index],
                            background: (stateOfGame.basicData?.gameData
                                    as ClickPicture)
                                .getBackGround(stateOfGameData
                                        .data[stateOfGame.index]
                                        .gameImages
                                        ?.length ??
                                    0), isArabic: true),
                        child: const ClickPictureGame())
                  }
                ],
              )),

          ///////////////////game title//////////////////
          Positioned(
            top: 0,
            child: Container(
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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            30.pw,
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image.asset(
                                AppImages.backButtonIcon,
                                height: 40.h,
                                // width: 40.w,
                              ),
                            ),
                            10.pw,
                            GestureDetector(
                              child: Image.asset(
                                AppImages.settingButtonIcon,
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
                        AppImages.stayOfStarBar,
                        width: 65.w,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ((stateOfGame.countOfStar ?? 0) == 0)
                                ? Image.asset(
                                    AppImages.barZeroStar,
                                    width: 40.w,
                                    fit: BoxFit.contain,
                                  )
                                : ((stateOfGame.countOfStar ?? 0) == 1)
                                    ? Image.asset(AppImages.barOneStar,
                                        width: 40.w)
                                    : ((stateOfGame.countOfStar ?? 0) == 2)
                                        ? Image.asset(AppImages.barTwoStar,
                                            width: 40.w)
                                        : Image.asset(AppImages.barThreeStar,
                                            width: 40.w)
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          Positioned(
              top: 50.h + 5,
              right: 20,
              child: Image.asset(
                stateOfGame.basicData?.gameData?.titleImageAr ?? '',
                height: 75.h,
              )),

          Positioned(
            bottom: 15,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    GestureDetector(
                      onTap: () async {
                        print('%%:${MediaQuery.of(context).size.height}');
                        await TalkTts.startTalk(
                            isArabic: true,
                            text:
                                stateOfGameData.data[stateOfGame.index].inst ??
                                    '');
                        print(
                            'stateOfGame.stateOfStringIsWord:${stateOfGame.basicData}');
                        if (stateOfGame.stateOfStringIsWord == true) {
                          await TalkTts.startTalk(
                              text: stateOfGame.stateOfStringWillSay ?? '');
                        } else {
                          await AudioPlayerClass.startPlaySound(
                              soundPath: AppSound.getSoundOfLetter(
                                  mainGameLetter:
                                      stateOfGame.stateOfStringWillSay ?? ''));
                        }
                      },
                      child: Container(
                          child: stateOfGame.avatarArtboard == null
                              ? Image.asset(
                                  stateOfGame.currentAvatar ?? '',
                                  height:
                                      MediaQuery.of(context).size.height > 450
                                          ? 250.h
                                          : 200.h,
                                  width: 100.w,
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height > 450
                                          ? 250.h
                                          : 180.h,
                                  width: 80.w,
                                  child: Rive(
                                    artboard: stateOfGame.avatarArtboard!,
                                    fit: BoxFit.fill,
                                    // useArtboardSize: true,
                                  ))),
                    ),
                    // SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
