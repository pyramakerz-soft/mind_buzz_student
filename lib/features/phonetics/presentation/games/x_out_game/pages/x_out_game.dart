import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/x_out_game/manager/x_out_cubit.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/theme_text.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

class XOutGameScreen extends StatelessWidget {
  const XOutGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 90.h;
    final screenWidth = MediaQuery.of(context).size.width - 120.w;
    final gridItemHeight = (screenHeight - 4 - 40 - 2 * 15) / 2; // 4 for padding, 40 for text height, 2 * 15 for border radius
    final gridItemWidth = (screenWidth - 4 - 3 * 2) / 2; // 4 for padding, 3 * 2 for border width

    return BlocConsumer<XOutCubit, XOutInitial>(
      listener: (context, state) {},
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
            border: Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5),
          ),
          child: Column(
            children: [
              Text(
                state.gameData?.mainLetter ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppTheme.getFontFamily5(),
                  color: AppColor.white,
                  height: 0,
                  letterSpacing: 0.50,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: gridItemWidth / gridItemHeight, // Aspect ratio of each item
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final isSelected = state.selectedItems?.contains(index) == true;
                    final isCorrect = state.gameData?.gameImages?[index].correct == 0;
                    return XOutItemWidget(
                      imageName: state.gameData?.gameImages?[index].image ?? "",
                      isSelected: isSelected,
                      isCorrect: isCorrect,
                      onTap: () {
                        context.read<XOutCubit>().selectItem(index).then((_) {
                          if (isCorrect) {
                            context.read<XOutCubit>().increaseCountOfCorrectAnswers().then((countOfCorrect) {
                              context.read<CurrentGamePhoneticsCubit>().addStarToStudent(
                                  stateOfCountOfCorrectAnswer: countOfCorrect,
                                  mainCountOfQuestion: state.gameData?.numOfLetters ?? 0);
                              //here should load next game data 
                            });
                          } else {
                            context.read<CurrentGamePhoneticsCubit>().addWrongAnswer();
                          }
                        });
                      },
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
    required this.onTap,
  }) : super(key: key);

  final String imageName;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? (isCorrect ? AppColor.greenColor3 : AppColor.incorrect) : AppColor.white,
          border: Border.all(color: AppColor.skyBlueColor, width: 3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageName,
              fit: BoxFit.fill,
              height: 80.h,
              width: 50.w,
            ),
          ],
        ),
      ),
    );
  }
}
