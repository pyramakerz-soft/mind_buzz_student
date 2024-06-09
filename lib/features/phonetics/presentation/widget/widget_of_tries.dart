import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/widgets/button_start_game.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';

widgetOfTries({required BuildContext context,required int nextGameIndex,
  required CurrentGamePhoneticsState stateOfGame,
  required Function() actionOfDone,
  required Function() backButton}){
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
        Positioned(
          top: 0,
          child: Container(
            height: 50.h + 5,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              boxShadow: [
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
                          width: 65.w,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              ((stateOfGame.countOfStar ?? 0) == 0)
                                  ? Image.asset(
                                AppImagesPhonetics.barZeroStar,
                                width: 40.w,
                                fit: BoxFit.contain,
                              )
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
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 0,
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
        Center(
          child: SizedBox(
            height: 335,
            width: 286,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PositionedDirectional(
                  top: 20,
                  end: 0,
                  child: SvgPicture.asset(
                    AppSvgImages.beeAlert,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned.fill(
                  child: SvgPicture.asset(
                    AppSvgImages.popUpBackground,
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                PositionedDirectional(
                  top: 90,
                  start: 0,
                  child: GestureDetector(
                    onTap: () => backButton(),
                    child: SvgPicture.asset(
                      AppSvgImages.exitButton,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                                  (index) => (double.parse("${stateOfGame.countOfStar}") > (index))
                                  ? Padding(
                                padding: EdgeInsets.only(
                                    bottom: index == 1 ? 10.0 : 0),
                                child: SvgPicture.asset(
                                  AppSvgImages.iconCompleteStar,
                                  height: 30,
                                ),
                              )
                                  : Image.asset(
                                AppImages.iconEmptyStar,
                                height: 30,
                              )),
                        ),
                        if (stateOfGame.countOfStar == 0) ...{
                          Text(
                            '"Try again?"',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: AppColor.darkBlueColor,
                              fontFamily: AppTheme.getFontFamily5(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ButtonLogin(
                              dataFunction: (){
                                final basicData = context.read<CurrentGamePhoneticsCubit>().state.basicData;
                                final gameData = context.read<CurrentGamePhoneticsCubit>().state.gameData;
                                gameData?.first.gameLetters?.forEach((element) {
                                  print('%%:${element.id}');
                                });
                                context.read<CurrentGamePhoneticsCubit>().updateDataOfCurrentGame(basicData: basicData!, gameData: (gameData??[]),
                                    gameIndex: nextGameIndex);
                              },
                              title: 'Retry',
                              playButton: true,
                              width: 150)
                        } else ...{
                          if (stateOfGame.countOfStar == 1) ...{
                            Text(
                              '"Excellent! Keep going?"',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColor.darkBlueColor,
                                fontFamily: AppTheme.getFontFamily5(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          } else if (stateOfGame.countOfStar == 2) ...{
                            Text(
                              '"Very Good! Keep going?"',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColor.darkBlueColor,
                                fontFamily: AppTheme.getFontFamily5(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          } else if (stateOfGame.countOfStar == 3) ...{
                            Text(
                              '"Good! Keep going?"',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColor.darkBlueColor,
                                fontFamily: AppTheme.getFontFamily5(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          },
                          const SizedBox(height: 10),
                          Container(
                            // width: 310,
                            // height: 40,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    final basicData = context.read<CurrentGamePhoneticsCubit>().state.basicData;
                                    final gameData = context.read<CurrentGamePhoneticsCubit>().state.gameData;
                                    gameData?.first.gameLetters?.forEach((element) {
                                      print('%%:${element.id}');
                                    });
                                    context.read<CurrentGamePhoneticsCubit>().updateDataOfCurrentGame(basicData: basicData!, gameData: (gameData??[]),
                                        gameIndex: nextGameIndex);
                                  },
                                  child: SizedBox(
                                    // height: 20,
                                    width: 50,
                                    child: Container(
                                        height: 40,
                                        width: 50,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.darkBlueColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: SvgPicture.asset(
                                          AppSvgImages.reloading,
                                          height: 20,
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: actionOfDone,
                                  child: SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 50,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.darkBlueColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Done',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:
                                            AppTheme.getFontFamily5(),
                                            height: 0,
                                            letterSpacing: 0.50,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )


        // GestureDetector(
        //   onTap: (){
        //     final basicData = context.read<CurrentGamePhoneticsCubit>().state.basicData;
        //     final gameData = context.read<CurrentGamePhoneticsCubit>().state.gameData;
        //     gameData?.first.gameLetters?.forEach((element) {
        //       print('%%:${element.id}');
        //     });
        //     context.read<CurrentGamePhoneticsCubit>().updateDataOfCurrentGame(basicData: basicData!, gameData: (gameData??[]),
        //         gameIndex: nextGameIndex);
        //   },
        //   child: const Center(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(Icons.play_circle),
        //         Text('rePlay')
        //       ],
        //     ),
        //   ),
        // ),
      ],
    ),
  );

}