import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/assets_svg_images.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../manager/click_the_sound_cubit.dart';
import '../widgets/letter_border_painter.dart';

class ClickTheSoundGame extends StatelessWidget {
  ClickTheSoundGame({Key? key}) : super(key: key);
  List<String> letters = [];

  List<String> generateRandomLetters({required String mainGameLetter}) {
    List<String> alphabetRange = 'abcdefghijklmnopqrstuvwxyz'.split('');

    alphabetRange.remove(mainGameLetter);
    alphabetRange.shuffle();
    List<String> randomLetters = alphabetRange.sublist(0, 7);
    int randomIndex = Random().nextInt(8);
    randomLetters.insert(randomIndex, mainGameLetter);

    return randomLetters;
  }
  int _correctAnswerCount =  0;

  @override
  Widget build(BuildContext context) {
    final stateOfCurrentGamePhoneticsCubit = context.watch<CurrentGamePhoneticsCubit>().state;
    final clickTheSoundCubit = context.watch<ClickTheSoundCubit>().state;
    final _viewModel = context.watch<ClickTheSoundCubit>();
    
    String mainGameLetter = stateOfCurrentGamePhoneticsCubit.gameData?.first.mainLetter ?? 'a';
    letters = clickTheSoundCubit.letters ?? [];
    return BlocConsumer<ClickTheSoundCubit, ClickTheSoundInitial>(
  listener: (context, state) {
    print('state: $state');
        //     if (state.correctAnswers! > _correctAnswerCount) {
    //       _correctAnswerCount = state.correctAnswers! ?? 0;
    // }
  },
  builder: (context, state) {
    return Container(
      margin: const EdgeInsets.only(bottom: (15 + 50), top: 50, left: 70),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      width: MediaQuery.of(context).size.width - (230),
      height: 290.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: AppColorPhonetics.DarkBorderColor, width: 8)),
      child: letters.isEmpty
          ? Center(
              child: Text(
                "Sorry, This game has an issue.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : StaggeredGridView.count(
              crossAxisCount: 11,
              shrinkWrap: true,
              staggeredTiles: [
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
                            viewModel:_viewModel,
                            index: index,
                            onPress: ()async{
                              if (letters[index] == mainGameLetter) {
                                context.read<CurrentGamePhoneticsCubit>().animationOfCorrectAnswer();
                                context.read<CurrentGamePhoneticsCubit>().backToMainAvatar();
                                _viewModel.incrementCorrectAnswerCount(index);
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
  
  Widget _buildBubbleWidget({required String letter, required Function onPress,index,required ClickTheSoundCubit viewModel}) {
  return InkWell(
    onTap: viewModel.correctIndexes?.contains(index) ?? false ? null :onPress as void Function()?,
    child: Stack(
      alignment: Alignment.center,
      children: [
       SvgPicture.asset(
          viewModel.correctIndexes?.contains(index) ?? false ? AppSvgImages.bubbleDisabled : AppSvgImages.bubble,
        ),
        StrokeText(text:letter ,isDisabled: viewModel.correctIndexes?.contains(index) ?? false,),
      ],
    ),
  );
}

}

class StrokeText extends StatelessWidget {
  final String text;
final isDisabled;
  const StrokeText({
    required this.text,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 39,
            fontFamily:  AppTheme.getFontFamily5(),
            foreground: Paint()..color = isDisabled ? AppColor.white.withOpacity(0.5) : AppColor.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily:  AppTheme.getFontFamily5(),
            fontSize: 39,
            foreground: Paint()
              ..strokeWidth = 1.7
              ..color = isDisabled ? AppColor.lightGreyColor4.withOpacity(0.5) :AppColor.darkBlueColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}
