import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_color.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/widgets/button_start_game.dart';

showCustomDialogOfTries(
    {required BuildContext context,
    required int countOfStars,
    required Function() actionOfRetry,
    required Function() actionOfDone,
    required Function() backButton}) {
  return showDialog(
    context: context,
    barrierDismissible: false,

    builder: (BuildContext context) {
      return _CustomDialogOfTries(
          countOfStars: countOfStars,
          actionOfRetry: actionOfRetry,
          actionOfDone: actionOfDone,
          backButton: backButton);
    },
  );
}

class _CustomDialogOfTries extends StatelessWidget {
  final int countOfStars;
  final void Function() backButton;
  final void Function() actionOfDone;
  final void Function() actionOfRetry;
  _CustomDialogOfTries({
    required this.backButton,
    required this.actionOfDone,
    required this.actionOfRetry,
    required this.countOfStars,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 335,
        width: 286,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
              top: 20,
              end: 0,
              child: SvgPicture.asset(
                AppSvgImages.beeAlert,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                AppSvgImages.popUpBackground,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            PositionedDirectional(
              top: 90,
              start: 0,
              child: GestureDetector(
                onTap: () => backButton(),
                child: SvgPicture.asset(
                  AppSvgImages.exitButton,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                // height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(
                          3,
                          (index) => (double.parse("$countOfStars") > (index))
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == 1 ? 10.0 : 0),
                                  child: SvgPicture.asset(
                                    AppSvgImages.iconCompleteStar,
                                    height: 30,
                                  ),
                                )
                              : Image.asset(
                                  AppImages.iconEmptyStar,
                                  height: 30,
                                )),
                    ),
                    if (countOfStars == 0) ...{
                      Text(
                        '"Try again?"',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColor.darkBlueColor,
                          fontFamily: AppTheme.getFontFamily5(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ButtonLogin(
                          dataFunction: actionOfRetry,
                          title: 'Retry',
                          playButton: true,
                          width: 150)
                    }
                    else
                      ...{

                      if(countOfStars == 1)...{
                        Text(
                          '"Excellent! Keep going?"',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.darkBlueColor,
                            fontFamily: AppTheme.getFontFamily5(),

                          ),
                          textAlign: TextAlign.center,
                        ),
                      }
                      else if(countOfStars == 2)...{
                        Text(
                          '"Very Good! Keep going?"',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.darkBlueColor,
                            fontFamily: AppTheme.getFontFamily5(),
                          ),
                        ),
                      }
                      else if(countOfStars == 3)...{
                        Text(
                          '"Good! Keep going?"',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.darkBlueColor,
                            fontFamily: AppTheme.getFontFamily5(),
                          ),
                        ),
                      },
                         const SizedBox(height: 10),
                        Container(
                          // width: 310,
                          // height: 40,
                          child:                         Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                // height: 20,
                      width: 50,
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10, ),
                                  decoration: BoxDecoration(
                                    color: AppColor.darkBlueColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SvgPicture.asset( AppSvgImages.reloading, height: 20,)
                                ),
                              ),
                              const SizedBox(width: 10),

                              Container(
                                height: 40,
                                width: 50,
                                child: Container(
                                  alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 10, ),
                                    decoration: BoxDecoration(
                                      color: AppColor.darkBlueColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Done',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontSize:12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:AppTheme.getFontFamily5() ,
                                        height: 0,
                                        letterSpacing: 0.50,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          )
                          ,
                        )
                      }
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
