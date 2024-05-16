import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../manager/bloc/contact_lesson_bloc.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/drag_out_cubit.dart';

class DragOutGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameData = context.read<DragOutCubit>().state.gameData;
    final stateOfCurrentGamePhoneticsCubit =
        context.read<CurrentGamePhoneticsCubit>().state;
    return Container(
      alignment: Alignment.center,
      // height: MediaQuery.of(context).size.height - (70.h),
      child: Row(
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
                        BasicOfEveryGame.stateOfWin)
                    ? Image.asset(
                  stateOfCurrentGamePhoneticsCubit.basicData?.gameData?.completeBasket??'',
                  height: (MediaQuery.of(context).size.height / 2.8).h,
                  width: 130,
                )
                    : Image.asset(
                        AppImagesPhonetics.imageBasket,
                        height: (MediaQuery.of(context).size.height / 2.8).h,
                        width: 130,
                      );
              }, onAcceptWithDetails: (item) {
                if (item.data.word.toString().split('').first.toLowerCase() !=
                    (gameData.mainLetter?.toLowerCase() ?? '')) {
                  context.read<CurrentGamePhoneticsCubit>().addSuccessAnswer(
                      actionInEndOfLesson: () {
                    Navigator.of(context).pop();
                  });

                } else {
                  context.read<CurrentGamePhoneticsCubit>().addWrongAnswer();
                }
              })),
          Container(
            margin: const EdgeInsets.only(bottom: (15 + 50), top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  gameData.gameImages?.length ?? 0,
                  (index) => Draggable<GameImagesModel>(
                      data: gameData.gameImages?[index],
                      childWhenDragging: SizedBox(
                        width: (MediaQuery.of(context).size.width -
                                (130 + 50 + 130)) /
                            4,
                        height: 130.h,
                      ),
                      feedback: CachedNetworkImage(
                        imageUrl: gameData.gameImages?[index].image ?? '',
                        width: (MediaQuery.of(context).size.width -
                                (130 + 50 + 130)) /
                            4,
                        height: 130.h,
                        // height: ,
                      ),
                      child: (stateOfCurrentGamePhoneticsCubit.stateOfAvatar ==
                                  BasicOfEveryGame.stateOfWin &&
                              gameData.gameImages?[index].word
                                      .toString()
                                      .split('')
                                      .first
                                      .toLowerCase() !=
                                  (gameData.mainLetter?.toLowerCase() ?? ''))
                          ? SizedBox(
                              width: (MediaQuery.of(context).size.width -
                                      (130 + 50 + 130)) /
                                  4,
                              height: 130.h,
                              // height: ,
                            )
                          : CachedNetworkImage(
                              imageUrl: gameData.gameImages?[index].image ?? '',
                              width: (MediaQuery.of(context).size.width -
                                      (130 + 50 + 130)) /
                                  4,
                              height: 130.h,
                              // height: ,
                            ))),
            ),
          )
        ],
      ),
    );
  }
}
