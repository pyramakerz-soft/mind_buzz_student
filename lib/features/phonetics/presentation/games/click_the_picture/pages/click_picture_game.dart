import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/games_structure/phonetics/phonetics_color.dart';
import '../../../../../chapters/presentation/manager/journey_bar_cubit.dart';
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
      int success = state.correctIndexes.length;
      if (success ==
          (gameData.gameImages?.where((e) => e.correct == 1).toList().length ??
              1)) {
        Future.delayed(Duration(seconds: 2), () {
          context.read<CurrentGamePhoneticsCubit>().sendStars(
              gamesId: [state.gameData.id ?? 0],
              actionOfStars: (int countOfStars, List<int> listOfIds) {
                context
                    .read<JourneyBarCubit>()
                    .sendStars(gamesId: listOfIds, countOfStar: countOfStars);
              });

          Navigator.pop(context);
        });
      }
      // if (success == 2 || success == 4 || success ==5) {
      //   context.read<CurrentGamePhoneticsCubit>().increaseDirectlyCountOfStar();
      // }
    }, builder: (context, stateOfGameData) {
      ClickPictureCubit clickPictureCubit = context.watch<ClickPictureCubit>();

      context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
          stateOfStringIsWord: false,
          stateOfStringWillSay: stateOfGameData.gameData.mainLetter ?? '');
      return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),
        child: Container(
          margin: EdgeInsets.only(
              bottom: (30),
              left: stateOfGameData.isArabic ==
                      true
                  ? 0
                  : 20,
              right: stateOfGameData.isArabic ==
                      true
                  ? 20
                  : 0),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: MediaQuery.of(context).size.width - (130 + 50),
          height: MediaQuery.of(context).size.height - (50.h + 75),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: AppColorPhonetics.boarderColor, width: 5)),
          child: SizedBox(
            // padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Wrap(
              spacing: 15,
              // runSpacing: 10,
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
                        height: (MediaQuery.of(context).size.height - (50.h + 75+20))/2,
                        onTap: () async {
                          // if (clickPictureCubit.checkCurrentClickTime(
                          //     current: DateTime.now())) {
                          if (!stateOfGameData.correctIndexes.contains(index)) {
                            if (clickPictureCubit.addAnswer(index)) {
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .animationOfCorrectAnswer();
                              print(stateOfGameData.correctIndexes.length);
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .addStarToStudent(
                                      stateOfCountOfCorrectAnswer:
                                          stateOfGameData
                                                  .correctIndexes.length +
                                              1,
                                      mainCountOfQuestion: stateOfGameData
                                          .gameData.gameImages!
                                          .where(
                                              (element) => element.correct == 1)
                                          .length);
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .animationOfCorrectAnswer();
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .backToMainAvatar();
                            } else {
                              // context
                              //     .read<CurrentGamePhoneticsCubit>()
                              //     .addWrongAnswer();
                              context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .addWrongAnswer(actionWhenTriesBeZero: () {
                                context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .sendStars(
                                        gamesId: [
                                      stateOfGameData.gameData.id ?? 0
                                    ],
                                        actionOfStars: (int countOfStars,
                                            List<int> listOfIds) {
                                          context
                                              .read<JourneyBarCubit>()
                                              .sendStars(
                                                  gamesId: listOfIds,
                                                  countOfStar: countOfStars);
                                        });
                              });
                              await context
                                  .read<ClickPictureCubit>()
                                  .sayTheOnlyLetter();
                            }
                          }
                          // }
                        },
                      )),
            ),
          ),
        ),
      );
    });
  }
}
