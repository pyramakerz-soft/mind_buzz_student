
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/assets_svg_images.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../manager/click_the_sound_cubit.dart';
import '../widgets/stroked_text_widget.dart';

class ClickTheSoundGame extends StatelessWidget {
  ClickTheSoundGame({Key? key}) : super(key: key);
  List<String> letters = [];
  
  @override
  Widget build(BuildContext context) {
    final stateOfCurrentGamePhoneticsCubit = context.watch<CurrentGamePhoneticsCubit>().state;
    final clickTheSoundCubit = context.watch<ClickTheSoundCubit>().state;
    final _viewModel = context.watch<ClickTheSoundCubit>();
    String mainGameLetter = stateOfCurrentGamePhoneticsCubit.gameData?.first.mainLetter ?? 'a';
    letters = clickTheSoundCubit.letters ?? [];
    return BlocConsumer<ClickTheSoundCubit, ClickTheSoundInitial>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: (15 + 50), top: 50, left: 70),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          width: MediaQuery.of(context).size.width - (230),
          height: 290.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: AppColorPhonetics.DarkBorderColor, width: 8)),
          child: letters.isEmpty
              ? const Center(
                  child: Text(
                    "Sorry, Something went wrong while loading your game.",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : StaggeredGridView.count(
                  crossAxisCount: 11,
                  shrinkWrap: true,
                  staggeredTiles: const [
                    StaggeredTile.count(2, 1),
                    StaggeredTile.count(2, 1),
                    StaggeredTile.count(2, 3),
                    StaggeredTile.count(2, 4),
                    StaggeredTile.count(2, 1),
                    StaggeredTile.count(3, 3),
                    StaggeredTile.count(2, 2),
                    StaggeredTile.count(3, 1),
                  ],
                  children: List.generate(
                      8,
                      (index) => Center(
                        
                            child: _buildBubbleWidget(
                                letter: letters[index],
                                viewModel: _viewModel,
                                index: index,
                                onPress: () async {
                                  if (letters[index] == mainGameLetter) {
                                    context.read<CurrentGamePhoneticsCubit>().animationOfCorrectAnswer();
                                    context.read<CurrentGamePhoneticsCubit>().backToMainAvatar();
                                    _viewModel.incrementCorrectAnswerCount(index);
                                    context.read<CurrentGamePhoneticsCubit>().addStarToStudent(stateOfCountOfCorrectAnswer: _viewModel.correctAnswers ?? 0, mainCountOfQuestion: stateOfCurrentGamePhoneticsCubit.gameData?.first.numOfLetterRepeat ?? 0);
                                    if (_viewModel.correctAnswers == stateOfCurrentGamePhoneticsCubit.gameData?.first.numOfLetterRepeat) {
                                      context.read<CurrentGamePhoneticsCubit>().addSuccessAnswer(actionInEndOfLesson: () {
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  } else {
                                    context.read<CurrentGamePhoneticsCubit>().addWrongAnswer();
                                  }
                                }),
                          )),
                ),
        );
      },
    );
  }

  Widget _buildBubbleWidget({required String letter, required Function onPress, index, required ClickTheSoundCubit viewModel}) {
    return InkWell(
      onTap: viewModel.correctIndexes?.contains(index) ?? false ? null : onPress as void Function()?,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            viewModel.correctIndexes?.contains(index) ?? false ? AppSvgImages.bubbleDisabled : AppSvgImages.bubble,
            width: 64,
            height: 64,
          ),
          StrokeText(
            text: letter,
            isDisabled: viewModel.correctIndexes?.contains(index) ?? false,
          ),
        ],
      ),
    );
  }
}
