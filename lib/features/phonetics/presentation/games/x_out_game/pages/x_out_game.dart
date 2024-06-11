import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/x_out_game/manager/x_out_cubit.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/games_structure/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../../../chapters/presentation/manager/journey_bar_cubit.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

class XOutGameScreen extends StatelessWidget {
  const XOutGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 90.h;
    final screenWidth = MediaQuery.of(context).size.width - 120.w;
    final gridItemHeight = (screenHeight - 4 - 40 - 2 * 15) /
        2; // 4 for padding, 40 for text height, 2 * 15 for border radius
    final gridItemWidth =
        (screenWidth - 4 - 3 * 2) / 2; // 4 for padding, 3 * 2 for border width
    bool _isInteracting = false;
    return BlocConsumer<XOutCubit, XOutInitial>(
      listener: (context, state) {
        if (state.isInteracting) {
          _isInteracting = true;
        }
        if (state.isInteracting == false) {
          _isInteracting = false;
        }
        context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
            stateOfStringIsWord: false,
            stateOfStringWillSay:
                state.gameData?[state.currentGameIndex ?? 0].mainLetter ?? '');
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 15.w),
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColorPhonetics.DarkBorderColor,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5),
          ),
          child: Column(
            children: [
              Text(
                state.gameData?[state.currentGameIndex ?? 0].mainLetter ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTheme.getFontFamily5(),
                      color: AppColor.white,
                      height: 0,
                      letterSpacing: 0.50,
                    ),
              ),
              if (state.gameData?[state.currentGameIndex ?? 0].gameImages
                      ?.isNotEmpty ??
                  false)
                Expanded(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      childAspectRatio: gridItemWidth /
                          gridItemHeight, // Aspect ratio of each item
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final isSelected =
                          state.selectedItems?.contains(index) == true;
                      final isCorrect = state
                              .gameData?[state.currentGameIndex ?? 0]
                              .gameImages?[index]
                              .correct ==
                          0;
                      final bool gameHasData = state
                              .gameData?[state.currentGameIndex ?? 0]
                              .gameImages
                              ?.isNotEmpty ??
                          false;
                      return !gameHasData
                          ? SizedBox()
                          : XOutItemWidget(
                              imageName: state
                                      .gameData?[state.currentGameIndex ?? 0]
                                      .gameImages?[index]
                                      .image ??
                                  "",
                              isSelected: isSelected,
                              isCorrect: isCorrect,
                              onTap: state.isInteracting
                                  ? null
                                  : () {
                                      context
                                          .read<XOutCubit>()
                                          .startInteraction();
                                      context
                                          .read<XOutCubit>()
                                          .selectItem(index)
                                          .then((_) async {
                                        if (isCorrect) {
                                          //call animation of right
                                          await context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .animationOfCorrectAnswer();
                                          context
                                              .read<XOutCubit>()
                                              .increaseCountOfCorrectAnswers()
                                              .then((countOfCorrect) async {
                                            context
                                                .read<
                                                    CurrentGamePhoneticsCubit>()
                                                .addStarToStudent(
                                                    stateOfCountOfCorrectAnswer:
                                                        countOfCorrect,
                                                    mainCountOfQuestion: state
                                                            .gameData?[state
                                                                    .currentGameIndex ??
                                                                0]
                                                            .numOfLetters ??
                                                        0);
                                            bool isLastLesson = context
                                                .read<XOutCubit>()
                                                .isLastGame();
                                            if (isLastLesson == true) {
                                              await Future.delayed(
                                                  const Duration(seconds: 2));
                                              context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .sendStars(
                                                      gamesId: state.gameData
                                                              ?.map((obj) =>
                                                                  obj.id ?? 0)
                                                              .toList() ??
                                                          [],
                                                      actionOfStars: (int
                                                              countOfStars,
                                                          List<int> listOfIds) {
                                                        context
                                                            .read<
                                                                JourneyBarCubit>()
                                                            .sendStars(
                                                                gamesId:
                                                                    listOfIds,
                                                                countOfStar:
                                                                    countOfStars);
                                                      });
                                              Navigator.of(context).pop();
                                            } else {
                                              await context
                                                  .read<
                                                      CurrentGamePhoneticsCubit>()
                                                  .backToMainAvatar();

                                              await context
                                                  .read<
                                                  CurrentGamePhoneticsCubit>()
                                                  .increaseCountOfTries();
                                              context
                                                  .read<XOutCubit>()
                                                  .updateGameIndex();
                                            }
                                          });
                                        } else {
                                          context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .addWrongAnswer(

                                              actionWhenTriesBeZero: () {


                                                context
                                                    .read<
                                                    CurrentGamePhoneticsCubit>()
                                                    .sendStars(
                                                    gamesId: state.gameData
                                                        ?.map((obj) =>
                                                    obj.id ?? 0)
                                                        .toList() ??
                                                        [],
                                                    actionOfStars: (int
                                                    countOfStars,
                                                        List<int> listOfIds) {
                                                      context
                                                          .read<
                                                          JourneyBarCubit>()
                                                          .sendStars(
                                                          gamesId:
                                                          listOfIds,
                                                          countOfStar:
                                                          countOfStars);
                                                    });
                                              }
                                          );
                                        }
                                      });
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
                                        context
                                            .read<XOutCubit>()
                                            .stopInteraction();
                                      });
                                    },
                        word: state
                            .gameData?[state.currentGameIndex ?? 0]
                            .gameImages?[index].word??'',
                            );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class XOutItemWidget extends StatelessWidget {
  const XOutItemWidget({
    Key? key,
    required this.imageName,
    required this.isSelected,
    required this.isCorrect,
    required this.word,
    required this.onTap,
  }) : super(key: key);

  final String imageName;
  final String word;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (isCorrect ? AppColor.greenColor3 : AppColor.incorrect)
              : AppColor.white,
          border: Border.all(color: AppColor.skyBlueColor, width: 3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageName,
              fit: BoxFit.fill,
              height: 70.h,
              // width: 50.w,
              errorWidget: (context, url, error){
                return Center(
                  child: Text('${word}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
