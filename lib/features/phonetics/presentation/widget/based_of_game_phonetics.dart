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
import 'package:mind_buzz_refactor/features/phonetics/presentation/widget/star_widget.dart';

import '../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../core/talk_tts.dart';
import '../games/click_the_picture/manager/click_picture_cubit.dart';
import '../games/click_the_picture/pages/click_picture_game.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';

class BasedOfGamePhonetics extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final GetContactInitial stateOfGameData;

  const BasedOfGamePhonetics(
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
        children: [
          /////////////////////game//////////////////
          Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if ((stateOfGame.basicData?.gameData
                          is BasicDragOutGame)) ...{
                        BlocProvider<DragOutCubit>(
                            create: (_) => DragOutCubit(
                                gameData:
                                    stateOfGameData.data),
                            child: DragOutGame(
                              // gameData: stateOfGameData.data,
                            ))
                      }
                      else if ((stateOfGame.basicData?.gameData
                          is ClickPictureS)) ...{
                        BlocProvider<ClickPictureCubit>(
                            create: (_) => ClickPictureCubit(
                                gameData:
                                    stateOfGameData.data[stateOfGame.index],
                                background: (stateOfGame.basicData?.gameData
                                        as ClickPictureS)
                                    .getBackGround(stateOfGameData
                                            .data[stateOfGame.index]
                                            .gameImages
                                            ?.length ??
                                        0)),
                            child: ClickPictureGame())
                      } else if ((stateOfGame.basicData?.gameData
                      is ClickPictureOfWord)) ...{
                        BlocProvider<ClickThePictureWithWordCubit>(
                            create: (_) => ClickThePictureWithWordCubit(
                                gameData:
                                stateOfGameData.data[stateOfGame.index],
                                backGround: (stateOfGame.basicData?.gameData as ClickPictureOfWord).getBackGround(stateOfGameData
                                    .data[stateOfGame.index]
                                    .gameImages
                                    ?.length ??
                                    0)),
                            child: ClickThePictureWithWord(gameData: stateOfGameData.data[stateOfGame.index],))
                      } else if ((stateOfGame.basicData?.gameData
                          is BasicClickTheSoundGame)) ...{
                        BlocProvider<ClickTheSoundCubit>(
                            create: (_) => ClickTheSoundCubit(
                                gameData: stateOfGameData.data[stateOfGame.index],),
                            child: ClickTheSoundGame())
                      }
                    ],
                  ))),


          /////////////////////game title//////////////////
          Positioned(
            top: 0,
            child: Center(
              child: Column(
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
                            ((stateOfGame.countOfStar ?? 0) ==0)?
                            Image.asset(AppImagesPhonetics.barZeroStar,
                                width: 40.w):((stateOfGame.countOfStar ?? 0) ==1)?
                            Image.asset(AppImagesPhonetics.barOneStar,
                                width: 40.w):((stateOfGame.countOfStar ?? 0) ==2)?
                            Image.asset(AppImagesPhonetics.barTwoStar,
                                width: 40.w):Image.asset(AppImagesPhonetics.barThreeStar,
                                width: 40.w)
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            20.pw,
                            Image.asset(
                              stateOfGame.basicData?.gameData?.titleImage ?? '',
                              height: 75.h,
                            ),
                            SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    GestureDetector(
                      onTap: () async{
                        await TalkTts.startTalk(text:  stateOfGameData.data[stateOfGame.index].inst ?? '');
                      },
                      child: Container(
                          child: stateOfGame.avatarArtboard == null
                              ? Image.asset(
                            stateOfGame.currentAvatar ?? '',
                            height:
                            MediaQuery.of(context).size.height - (70.h),
                            width: 130,
                          )
                              : SizedBox(
                              height:
                              MediaQuery.of(context).size.height - (70.h),
                              width: 170,
                              child: Rive(
                                artboard: stateOfGame.avatarArtboard!,
                                fit: BoxFit.cover,
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
