import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/stroke_text.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/spelling_game/widget/drag_target_card.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../manager/sorting_cubit.dart';
import '../widget/item_card_widget.dart';

class SortingGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<sortingCubit, sortingInitial>(
        listener: (context, state) {
      // if (state.countOfWrong == 3) {
      //   context.read<sortingCubit>().increaseCountOfWrongAnswers(count: 0);
      //   context.read<sortingCubit>().navigateToNextIndex();
      // }
    }, builder: (context, gameState) {
      return Padding(
        padding: const EdgeInsets.only(top: 0, left: 30),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    alignment: Alignment.center,
                    // height: MediaQuery.of(context).size.height - (70.h),
                    margin: EdgeInsets.only(right: 15.w),
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.61,
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColorPhonetics.DarkBorderColor,
                            width: 5)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: gameState.currentImages?.length ?? 1,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.5),
                            itemBuilder: (context, index) {
                              return ItemCardWidget(
                                id: gameState.currentImages?[index].id ?? 0,
                                body: gameState.currentImages![index],
                                index: index,
                              );
                            }),
                      ],
                    ))),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      gameState.woodenBackground!,
                      height: 0.8.sh,
                      width: 0.6.sw,
                      fit: BoxFit.fill,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: gameState.gameData!.gameLetters?.length ?? 1,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, i) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.12.sh),
                              child: Container(
                                height: 0.2.sw,
                                width: 2,
                                color: AppColor.strokeColor,
                              ),
                            ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 0.14.sw,
                            padding: EdgeInsets.only(top: 30, right: 20,left: 25),
                            child: Column(
                              children: [
                                StrokeText(
                                  text: gameState.gameData!.gameLetters![index]
                                          .letter ??
                                      '',
                                  isDisabled: false,
                                  fontSize: 0.04.sw,
                                ),
                                // 7.ph,
                                DragTarget<int>(
                                  builder: (
                                    BuildContext context,
                                    List<dynamic> accepted,
                                    List<dynamic> rejected,
                                  ) {
                                    return Container(
                                      width: 0.14.sw,
                                      height: 0.5.sh,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: gameState.correctAnswers
                                              .where((element) =>
                                                  element.gameLetterId ==
                                                  gameState.gameData!
                                                      .gameLetters![index].id)
                                              .toList()
                                              .length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 5),
                                          itemBuilder: (context, i) {
                                            String image = gameState
                                                    .correctAnswers
                                                    .where((element) =>
                                                        element.gameLetterId ==
                                                            gameState.gameData!
                                                                .gameLetters![index].id)
                                                    .toList()[i]
                                                    .image ??
                                                '';
                                            return Image.network(image);
                                          }),
                                    );
                                  },
                                  onAcceptWithDetails:
                                      (DragTargetDetails<int> details) async {
                                    GameImagesModel image = gameState
                                        .gameData!.gameImages!
                                        .firstWhere((element) =>
                                            element.id == details.data);
                                    context
                                        .read<sortingCubit>()
                                        .addTheCorrectAnswer(answer: image);

                                    if (gameState.gameData!.gameLetters?[index].id == image.gameLetterId) {
                                      context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .animationOfCorrectAnswer();
                                      int countOfCorrect = await context
                                          .read<sortingCubit>()
                                          .increaseCountOfCorrectAnswers();

                                      context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .addStarToStudent(
                                            stateOfCountOfCorrectAnswer:
                                                countOfCorrect,
                                            mainCountOfQuestion: gameState
                                                    .gameData
                                                    ?.gameImages
                                                    ?.length ??
                                                0,
                                          );
                                      bool isLastLesson = context
                                          .read<sortingCubit>()
                                          .checkIfIsTheLastGameOfLesson();
                                      if (isLastLesson == true) {
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        Navigator.of(context).pop();
                                      } else {
                                        context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .backToMainAvatar();
                                        context
                                            .read<sortingCubit>()
                                            .changeImages();
                                      }
                                    }
                                    else {
                                      context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .addWrongAnswer(
                                              actionOfWrongAnswer: () async {
                                        // TalkTts.startTalk(text: gameData.mainLetter ?? '');
                                      });

                                      context
                                          .read<sortingCubit>()
                                          .increaseCountOfWrongAnswers();
                                      context
                                          .read<sortingCubit>()
                                          .removeTheWrongAnswer();
                                    }
                                  },
                                ),
                                20.ph,
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
              10.pw
            ],
          ),
        ),
      );
    });
  }
}
