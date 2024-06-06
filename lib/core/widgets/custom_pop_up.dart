import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';
import 'package:mind_buzz_refactor/core/widgets/button_start_game.dart';

showCustomDialog(
    {required BuildContext context,
    required String firstContent,
    required String remainingContent,
    required String numberOfAssignments,
    required String buttonTitle,
    required void Function() onButtonPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return _CustomDialog(
          firstContent: firstContent,
          remainingContent: remainingContent,
          numberOfAssignments: numberOfAssignments,
          buttonTitle: buttonTitle,
          onButtonPressed: onButtonPressed);
    },
  );
}

class _CustomDialog extends StatelessWidget {
  final String firstContent;
  final String remainingContent;
  final String numberOfAssignments;
  final String buttonTitle;
  final void Function() onButtonPressed;
  _CustomDialog({
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.firstContent,
    required this.remainingContent,
    required this.numberOfAssignments,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 335,
        width: 286,
        child: Stack(
          children: [
            PositionedDirectional(
              top: 20,
              end: 0,
              child: SvgPicture.asset(
                'assets/svg/bee.svg',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/svg/pop_up_background.svg',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            PositionedDirectional(
              top: 90,
              start: 0,
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: SvgPicture.asset(
                  'assets/svg/exit_button.svg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 130,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: firstContent,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColor.darkBlueColor,
                        fontFamily: AppTheme.getFontFamily5(),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: numberOfAssignments,
                          style: TextStyle(
                              fontSize: 30.0, // Make the number larger
                              fontWeight: FontWeight.bold,
                              color: AppColor.darkBlueColor,
                              fontFamily: AppTheme.getFontFamily5()),
                        ),
                        TextSpan(
                          text: ' $remainingContent',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.darkBlueColor,
                            fontFamily: AppTheme.getFontFamily5(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonLogin(
                      dataFunction: onButtonPressed,
                      title: buttonTitle,
                      playButton: true,
                      width: 150)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
