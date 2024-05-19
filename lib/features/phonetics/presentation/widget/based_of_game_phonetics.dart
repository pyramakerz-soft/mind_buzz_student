import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/widget/star_widget.dart';

import '../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../core/phonetics/basic_of_every_game.dart';
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
          Positioned(
            top: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      20.pw,
                      Image.asset(
                        stateOfGame.basicData?.gameData?.titleImage ?? '',
                        height: 60.h,
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                          color: stateOfGame.basicData?.backGroundOfStarBar),
                      child: RatingBar(
                        initialRating:
                            double.parse("${(stateOfGame.countOfStar ?? 0)}"),
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 3,
                        itemSize: 25,
                        ratingWidget: RatingWidget(
                          full: const StarWidget(
                            image: AppImagesPhonetics.imageCompleteStar,
                          ),
                          half: const StarWidget(
                            image: AppImagesPhonetics.imageEmptyStar,
                          ),
                          empty: const StarWidget(
                            image: AppImagesPhonetics.imageEmptyStar,
                          ),
                        ),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  GestureDetector(
                    onTap: () {},
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
          Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - (70.h),
                  child: Column(
                    children: [
                      if ((stateOfGame.basicData?.gameData
                          is DragOutGameS)) ...{
                        BlocProvider<DragOutCubit>(
                            create: (_) => DragOutCubit(
                                gameData:
                                    stateOfGameData.data[stateOfGame.index]),
                            child: DragOutGame(
                                gameData:
                                    stateOfGameData.data[stateOfGame.index]))
                      }
                    ],
                  )))
        ],
      ),
    );
  }
}
