import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/button_start_game.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';

import '../assets_svg_images.dart';

showCustomDialogLandscape({
  required BuildContext context,
  int? countOfStars,
  required void Function() onRetryPressed,
  void Function()? onDonePressed,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return _CustomDialogLandscape(
        countOfStars: countOfStars ?? 0,
        onRetryPressed: onRetryPressed,
        onDonePressed: onDonePressed,
      );
    },
  );
}

enum StarsEnum { zero, one, two, three }

extension MessageExtension on StarsEnum {
  String get message {
    switch (this) {
      case StarsEnum.one:
        return "Good! Keep going?";
      case StarsEnum.two:
        return "Very Good! Keep going?";
      case StarsEnum.three:
        return "Excellent! Keep going?";
      case StarsEnum.zero:
        return "Try again?";
    }
  }

  int get value {
    switch (this) {
      case StarsEnum.one:
        return 1;
      case StarsEnum.two:
        return 2;
      case StarsEnum.three:
        return 3;
      case StarsEnum.zero:
        return 0;
    }
  }
}

class _CustomDialogLandscape extends StatelessWidget {
  final int countOfStars;
  final void Function() onRetryPressed;
  final void Function()? onDonePressed;

  _CustomDialogLandscape({
    required this.countOfStars,
    required this.onRetryPressed,
    this.onDonePressed,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 300.h,
        width: 230.w,
        child: Stack(
          children: [
            _buildBackground(),
            _buildExitButton(context),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Positioned _buildContent() {
    return Positioned(
      top: 70.h,
      right: 0,
      left: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => (double.parse(
                            "${StarsEnum.values.firstWhere((type) => type.value == countOfStars).value}") >
                        (index))
                    ? Padding(
                        padding: EdgeInsets.only(bottom: index == 1 ? 10.0 : 0),
                        child: SvgPicture.asset(
                          AppSvgImages.iconCompleteStar,
                          height: 45.h,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(bottom: index == 1 ? 10.0 : 0),
                        child: Image.asset(
                          AppImages.iconEmptyStar,
                          height: 45.h,
                        ),
                      )),
          ),
          20.ph,
          Text(
            StarsEnum.values
                .firstWhere((type) => type.value == countOfStars)
                .message,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColor.darkBlueColor,
              fontFamily: AppTheme.getFontFamily5(),
            ),
          ),
          20.ph,
          if (StarsEnum.values
                  .firstWhere((type) => type.value == countOfStars)
                  .value ==
              0)
            ButtonLogin(
              leading: SvgPicture.asset(AppSvgImages.retryIcon),
              dataFunction: onRetryPressed,
              title: 'Retry',
              playButton: true,
              width: 60.w,
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                  child: ButtonLogin(
                    leading: SvgPicture.asset(AppSvgImages.retryIcon),
                    dataFunction: onRetryPressed,
                    title: '',
                    playButton: true,
                    width: 30.w,
                  ),
                ),
                5.pw,
                SizedBox(
                  width: 80.w,
                  child: ButtonLogin(
                    dataFunction: onDonePressed ?? () {},
                    title: 'Done',
                    playButton: true,
                    width: 80.w,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  PositionedDirectional _buildExitButton(BuildContext context) {
    return PositionedDirectional(
      top: 100.h,
      start: 35.w,
      child: GestureDetector(
        onTap: Navigator.of(context).pop,
        child: SvgPicture.asset(
          AppSvgImages.exitButton,
          width: 50.w,
          height: 50.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Positioned _buildBackground() {
    return Positioned.fill(
      child: SvgPicture.asset(
        AppSvgImages.popUpBackgroundLandscape,
        width: 180.w,
        height: 200.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
