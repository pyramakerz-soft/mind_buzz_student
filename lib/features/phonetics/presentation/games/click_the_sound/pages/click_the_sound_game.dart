import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/assets_svg_images.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../manager/click_the_sound_cubit.dart';
import '../widgets/stroked_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClickTheSoundGame extends StatelessWidget {
  ClickTheSoundGame({Key? key}) : super(key: key);
  List<String> letters = [];
  bool _isInteracting = false;

  @override
  Widget build(BuildContext context) {
    final stateOfCurrentGamePhoneticsState =
        context.watch<CurrentGamePhoneticsCubit>().state;
    final clickTheSoundState = context.watch<ClickTheSoundCubit>().state;
    final _viewModel = context.watch<ClickTheSoundCubit>();
    String mainGameLetter =
        stateOfCurrentGamePhoneticsState.gameData?.first.mainLetter ?? 'a';
    letters = clickTheSoundState.letters ?? [];
    return BlocConsumer<ClickTheSoundCubit, ClickTheSoundInitial>(
      listener: (context, state) {
        if (state.isInteracting) {
          _isInteracting = true;
        }
        if (state.isInteracting == false) {
          _isInteracting = false;
        }
      },
      builder: (context, state) {
        context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
            stateOfStringIsWord: false,
            stateOfStringWillSay: state.gameData.mainLetter ?? '');
        return Container(
          margin: const EdgeInsets.only(bottom: 30, top: 50, left: 70),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          width: MediaQuery.of(context).size.width - 265,
          height: MediaQuery.of(context).size.width < 760
              ? MediaQuery.of(context).size.height * 0.7
              : MediaQuery.of(context).size.height * 0.65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 8),
          ),
          child: letters.isEmpty
              ? const Center(
                  child: Text(
                    "Sorry, Something went wrong while loading your game.",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : StaggeredGridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 760 ? 11 : 12,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing:
                      MediaQuery.of(context).size.width < 760 ? 5 : 3,
                  crossAxisSpacing:
                      MediaQuery.of(context).size.width < 760 ? 8 : 11,
                  staggeredTiles: const [
                    StaggeredTile.count(3, 2), //0
                    StaggeredTile.count(2, 2), //1
                    StaggeredTile.count(3, 3), //2
                    StaggeredTile.count(2, 2), //3
                    StaggeredTile.count(2, 3), //4
                    StaggeredTile.count(3, 2), //5
                    StaggeredTile.count(3, 3), //6
                    StaggeredTile.count(2, 3), //7
                  ],
                  children: List.generate(
                    8,
                    (index) => Center(
                      child: _buildBubbleWidget(
                        letter: letters[index],
                        viewModel: _viewModel,
                        index: index,
                        onPress: _isInteracting || state.isInteracting
                            ? null
                            : () async {
                                _viewModel.selectItem(index);
                                _viewModel.startInteraction();
                                if (letters[index] == mainGameLetter) {
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .animationOfCorrectAnswer();
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .backToMainAvatar();
                                  await _viewModel
                                      .incrementCorrectAnswerCount(index);
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addStarToStudent(
                                          stateOfCountOfCorrectAnswer:
                                              _viewModel.state.correctAnswers ??
                                                  0,
                                          mainCountOfQuestion:
                                              stateOfCurrentGamePhoneticsState
                                                      .gameData
                                                      ?.first
                                                      .numOfLetterRepeat ??
                                                  0);
                                  print(
                                      '_viewModel.state.correctAnswers:${_viewModel.state.correctAnswers}');
                                  print(
                                      '_viewModel.state.correctAnswers:${(_viewModel.state.correctAnswers == stateOfCurrentGamePhoneticsState.gameData?.first.numOfLetterRepeat)}');
                                  if (_viewModel.state.correctAnswers ==
                                      stateOfCurrentGamePhoneticsState
                                          .gameData?.first.numOfLetterRepeat) {
                                    // context.read<CurrentGamePhoneticsCubit>().addSuccessAnswer(
                                    //     nextGameId: state.gameData.nextGameId,
                                    //     actionInEndOfLesson: () {
                                    context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .sendStars(
                                            gamesId: [state.gameData.id ?? 0]);

                                    Navigator.of(context).pop();
                                    // });
                                  }
                                } else {
                                  context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addWrongAnswer();
                                  // sayTheLetter();
                                  Future.delayed(Duration(seconds: 2),
                                      () async {
                                    await context
                                        .read<ClickTheSoundCubit>()
                                        .sayTheLetter();
                                  });
                                }
                                Future.delayed(const Duration(seconds: 2), () {
                                  _viewModel.stopInteraction();
                                });
                                _viewModel.resetSelectedItems();
                              },
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildBubbleWidget({
    required String letter,
    required VoidCallback? onPress,
    required int index,
    required ClickTheSoundCubit viewModel,
  }) {
    return SizedBox(
      width: 64,
      height: 64,
      child: InkWell(
        onTap: viewModel.state.correctIndexes?.contains(index) ?? false
            ? null
            : onPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              viewModel.state.correctIndexes?.contains(index) ?? false
                  ? AppSvgImages.bubbleDisabled
                  : AppSvgImages.bubble,
              width: 64,
              height: 64,
            ),
            // if (viewModel.state.isInteracting && viewModel.state.selectedItem == index &&  viewModel.state.correctIndexes?.contains(index) == false)
            //   Image.asset(
            //     AppImagesPhonetics.bubbleSelected,
            //     fit: BoxFit.cover,
            //   ),
            StrokedText(
              fontSize: 37,
              text: letter,
              isDisabled:
                  viewModel.state.correctIndexes?.contains(index) ?? false,
            ),
          ],
        ),
      ),
    );
  }
}
