import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/features/phonetics/domain/entities/game_model.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../manager/bloc/contact_lesson_bloc.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/click_picture_cubit.dart';
import '../widgets/single_row.dart';

class ClickPictureGame extends StatelessWidget {
  const ClickPictureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameData = context.read<ClickPictureCubit>().state.gameData;
    final List<String> backgroundImages =
        context.read<ClickPictureCubit>().state.backGround;
    final stateOfCurrentGamePhoneticsCubit =
        context.read<CurrentGamePhoneticsCubit>().state;
    return BlocConsumer<ClickPictureCubit, ClickPictureInitial>(
        listener: (context, state) {
      double success = state.correctIndexes.length /
          (gameData.gameImages?.where((e) => e.correct == 1).toList().length ??
              1);
      if (state.correctIndexes.length ==
          (gameData.gameImages?.where((e) => e.correct == 1).toList().length ??
              1)) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }
      if (success >= 0.3 || success >= 0.6 || success >= 0.9) {
        context.read<CurrentGamePhoneticsCubit>().increaseDirectlyCountOfStar();
      }
    }, builder: (context, stateOfGameData) {
      ClickPictureCubit clickPictureCubit = context.watch<ClickPictureCubit>();
      return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),
        child: Container(
          margin: const EdgeInsets.only(bottom: (30), left: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width - (130 + 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: AppColorPhonetics.boarderColor, width: 5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Wrap(
              spacing: 25,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: List.generate(
                  gameData.gameImages?.length ?? 0,
                  (index) => SingleElement(
                    index: index,
                        background: backgroundImages[index],
                        image: gameData.gameImages?[index].image ?? '',
                        selected: context
                            .read<ClickPictureCubit>()
                            .state
                            .correctIndexes
                            .contains(index),
                        onTap: () {
                          if (!stateOfGameData.correctIndexes.contains(index)) {
                            if (clickPictureCubit.addAnswer(index)) {
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .animationOfCorrectAnswer();
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .animationOfCorrectAnswer();
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .backToMainAvatar();
                            } else {
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .addWrongAnswer();
                            }
                          }
                        },
                      )),
            ),
          ),
        ),
      );
    });
  }
}
