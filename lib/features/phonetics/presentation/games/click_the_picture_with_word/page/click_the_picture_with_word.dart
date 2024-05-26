import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../domain/entities/game_images_model.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            width: MediaQuery.of(context).size.width - (130 + 50),
            height: MediaQuery.of(context).size.height - (50.h + 75),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: AppColorPhonetics.boarderColor, width: 5)),
            child: BlocConsumer<ClickThePictureWithWordCubit,
                    ClickThePictureWithWordInitial>(
                listener: (context, state) {},
                builder: (context, gameState) {
                  return StaggeredGridView.count(
                      crossAxisCount: 11,
                      shrinkWrap: true,
                      staggeredTiles: List.generate(
                        (gameData.gameImages?.length ?? 0),
                        (index) => index == 0
                            ? StaggeredTile.count(2, 3):
                        index == 1
                            ? StaggeredTile.count(2, 5)
                            : index < 4
                                ? StaggeredTile.count(2, 2)
                                : index < 6
                                    ? StaggeredTile.count(3, 2)
                                    : StaggeredTile.count(3, 3),
                      ),
                      children: List.generate(
                          (gameData.gameImages?.length ?? 0),
                          (index) => Center(
                            child: SingleElement(
                                width: (MediaQuery.of(context).size.width -
                                        (130 + 40)) /
                                    5,
                                height: (MediaQuery.of(context).size.height -
                                        (50.h + 90 + 20)) /
                                    2,
                                index: index,
                                background: gameState.backGround[index],
                                image: gameData.gameImages?[index].image ?? '',
                                selected: gameState.correctIndexes
                                    .contains(gameData.gameImages?[index].id),
                                onTap: () async {
                                  if ((gameState.chooseWord?.word ?? '') ==
                                      (gameData.gameImages?[index].word)) {
                                    context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .animationOfCorrectAnswer();
                                    context
                                        .read<ClickThePictureWithWordCubit>()
                                        .submitCorrectTheAnswer(
                                            winAnimation: () => context
                                                .read<CurrentGamePhoneticsCubit>()
                                                .animationOfCorrectAnswer(),
                                            reStateOfAvatar: () => context
                                                .read<CurrentGamePhoneticsCubit>()
                                                .backToMainAvatar(),
                                            idOfUserAnswer:
                                                (gameData.gameImages?[index].id ??
                                                    0),
                                            increaseCountOfCorrectAnswer:
                                                (correctAnswer) {
                                              context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .addStarToStudent(
                                                      stateOfCountOfCorrectAnswer:
                                                          correctAnswer,
                                                      mainCountOfQuestion:
                                                          gameData.gameImages
                                                                  ?.length ??
                                                              0);
                                            },
                                            actionWhenComplete: () {
                                              Navigator.of(context).pop();
                                            });
                                  } else {
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .addWrongAnswer()
                                        .whenComplete(() {
                                      context
                                          .read<ClickThePictureWithWordCubit>()
                                          .sayTheCorrectAnswer();
                                    });
                                  }
                                }),
                          )));
                })));
  }
}
