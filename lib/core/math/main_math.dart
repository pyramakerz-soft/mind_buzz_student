import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_color.dart';
import '../widgets/box_painter.dart';

abstract class MainMath{
  static const String _mainPathOfMathBall = 'assets/math_ball/';
  static const String _ball1 = "${_mainPathOfMathBall}ball1.svg";
  static const String _ball2 = "${_mainPathOfMathBall}ball2.svg";
  static const String _ball3 = "${_mainPathOfMathBall}ball3.svg";
  static const String _ball4 = "${_mainPathOfMathBall}ball4.svg";
  static const String _ball5 = "${_mainPathOfMathBall}ball5.svg";
  static const String _ball6 = "${_mainPathOfMathBall}ball6.svg";
  static const String _ball7 = "${_mainPathOfMathBall}ball7.svg";
  static const String _ball8 = "${_mainPathOfMathBall}ball8.svg";
  static const String _ball9 = "${_mainPathOfMathBall}ball9.svg";
  static const String _circle = "${_mainPathOfMathBall}circle.svg";

  static Widget getTheBalls({required int countOfBalls}) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(_circle),
        ...List.generate(countOfBalls, (index) => SvgPicture.asset(selectedBall(countOfBalls:countOfBalls))),
        SvgPicture.asset(_circle),
      ],
    );
  }

  static String selectedBall({required int countOfBalls}){
    switch (countOfBalls){
      case 1:
        return _ball1;
      case 2:
        return _ball2;
      case 3:
        return _ball3;
      case 4:
        return _ball4;
      case 5:
        return _ball5;
      case 6:
        return _ball6;
      case 7:
        return _ball7;
      case 8:
        return _ball8;
      case 9:
        return _ball9;
      default:
        return _ball9;
    }
  }

  static const Color colorOne = Color(0xffd45c45);
  static const Color colorTwo = Color(0xff21a04b);
  static const Color colorThree = Color(0xffe0a3bc);
  static const Color colorFour = Color(0xffe4cd4e);
  static const Color colorFive = Color(0xff99c2e2);
  static const Color colorSix = Color(0xff8d63a0);
  static const Color colorSeven = Color(0xffc3c0c5);
  static const Color colorEight = Color(0xffa75128);
  static const Color colorNine = Color(0xff6664a6);
  static Color colorOfCard({required int number}){
    switch(number){
      case 1:
        return colorOne;
      case 2:
        return colorTwo;
      case 3:
        return colorThree;
      case 4:
        return colorFour;
      case 5:
        return colorFive;
      case 6:
        return colorSix;
      case 7:
        return colorSeven;
      case 8:
        return colorEight;
      case 9:
        return colorNine;
    }
    return colorNine;

  }

  static List<ColorModel> colors = [
    ColorModel(colorMain: const Color(0xffEE1D23), colorBoarder: const Color(0xff930B0F)),
    ColorModel(colorMain: const Color(0xff406AB4), colorBoarder: const Color(0xff1C398D)),
  ];

  static Widget getTheBox(
      {required int countOfBoxes,
        required bool isSolid,
        List<Color?>? colorOfBox,
        required Size sizeOfOne}) {
    return SizedBox(
      height: sizeOfOne.height,
      width: countOfBoxes * (sizeOfOne.width - 14) + sizeOfOne.width/4, // Add size of one box to accommodate the last box
      child: Stack(
        children: [
          ...List.generate(countOfBoxes, (index) {
            if (index == 0 || index % 2 == 0) {
              return Positioned(
                left: index == 0 ? 0 : (sizeOfOne.width * index) - (14 * index),
                child: GestureDetector(
                  child: CustomPaint(
                      size: sizeOfOne,
                      painter: BoxCustomPainter(
                          color: colorOfBox?[index]??(isSolid==true?AppColor.bgMatheColor:colors.first.colorMain),
                          boarderColor: Colors.grey)),
                ),
              );
            } else {
              return Positioned(
                left: (sizeOfOne.width * index) - (14 * index),
                child: CustomPaint(
                    size: sizeOfOne,
                    painter: BoxCustomPainter(
                        color: colorOfBox?[index]??(isSolid==true?AppColor.bgMatheColor:colors.last.colorMain),
                        boarderColor: Colors.grey)),
              );
            }
          }).reversed
        ],
      ),
    );
  }
}

class ColorModel {
  final Color colorMain;
  final Color colorBoarder;

  ColorModel({required this.colorMain, required this.colorBoarder});
}