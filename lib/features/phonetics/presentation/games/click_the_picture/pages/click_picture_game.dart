import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../manager/bloc/contact_lesson_bloc.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/click_picture_cubit.dart';

class ClickPictureGame extends StatelessWidget {
  const ClickPictureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameData = context.read<ClickPictureCubit>().state.gameData;
    final List<String> backgroundImages =
        context.read<ClickPictureCubit>().state.backGround;
    final stateOfCurrentGamePhoneticsCubit =
        context.read<CurrentGamePhoneticsCubit>().state;
    return Container(
      alignment: Alignment.center,
      // height: MediaQuery.of(context).size.height - (70.h),
      child: Container(
        margin: const EdgeInsets.only(bottom: (15 + 50), top: 50, left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.width - (130 + 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.boarderColor, width: 5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              gameData.gameImages?.length ?? 0,
              (index) => (stateOfCurrentGamePhoneticsCubit.stateOfAvatar ==
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
                  : GestureDetector(
                onTap: (){
                  context.watch<ClickPictureCubit>().addAnswer(index);
                },
                    child: Stack(
                        children: [
                          Image.asset(
                            backgroundImages[index],
                            width: (MediaQuery.of(context).size.width -
                                    (130 + 50 + 130)) /
                                4,
                            height: 120.h,
                            color: context.read<ClickPictureCubit>().state.correctIndexes.contains(index)? AppColor.selectedColor : null,
                          ),
                          CachedNetworkImage(
                            imageUrl: gameData.gameImages?[index].image ?? '',
                            width: (MediaQuery.of(context).size.width -
                                    (130 + 50 + 130)) /
                                4,
                            height: 130.h,
                            // height: ,
                          ),
                        ],
                      ),
                  )),
        ),
      ),
    );
  }
}
