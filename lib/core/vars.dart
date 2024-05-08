import 'package:flutter/material.dart';

import 'app_color.dart';
import 'math/app_images_of_numbers.dart';
import 'assets_images.dart';

extension EmptySpace on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

enum StateOfAvatar { thinking, talking, stop, success, wrong }

enum TtsState { playing, stopped, forceStop }

abstract class DefaultHomeData {
  static const image =
      'https://www.renaissance.com/wp-content/uploads/2023/04/star-phonics-header-2.webp';
  static List<Color> firstCardColor = [
    AppColor.yellowColor1,
    AppColor.yellowColor2,
    AppColor.yellowColor3
  ];
  static List<Color> secondCardColor = [
    AppColor.blueColor1,
    AppColor.blueColor2,
    AppColor.blueColor3
  ];
  static List<Color> thirdCardColor = [
    AppColor.greenColor1,
    AppColor.greenColor2,
    AppColor.greenColor3
  ];
  static List<Color> fourCardColor = [
    AppColor.redColor1,
    AppColor.redColor2,
    AppColor.redColor3
  ];
  static List<List<Color>> fullDataOfCardColor = [
    firstCardColor,
    firstCardColor,
    thirdCardColor,
    fourCardColor
  ];
  static String haveAnAssignment = 'You have an assignment';
  static List<Color> getColor({required int index}) {
    if (index % 4 == 1) {
      print('1');
      return firstCardColor;
    } else if (index % 4 == 2) {
      print('2');

      return secondCardColor;
    } else if (index % 4 == 3) {
      return thirdCardColor;
    } else if (index % 4 == 0) {
      return fourCardColor;
    } else {
      return firstCardColor;
    }
  }
}

abstract class DefaultUnitData {
  static List<Color> fullDataOfCardColor = [
    AppColor.yellowColor1,
    AppColor.darkBlueColor4,
    AppColor.darkGreenColor2,
    AppColor.redColor
  ];
}

abstract class DefaultChapterData {
  static String convertTheNumber({required String number}) {
    switch (number) {
      case '1':
        return AppImagesOfNumbers.numberOne;
      case '2':
        return AppImagesOfNumbers.numberTwo;
      case '3':
        return AppImagesOfNumbers.numberThree;
      case '4':
        return AppImagesOfNumbers.numberFour;
      case '5':
        return AppImagesOfNumbers.numberFive;
      case '6':
        return AppImagesOfNumbers.numberSix;
      case '7':
        return AppImagesOfNumbers.numberSeven;
      case '8':
        return AppImagesOfNumbers.numberEight;
      case '9':
        return AppImagesOfNumbers.numberNine;
      case '0':
        return AppImagesOfNumbers.numberZero;
      default:
        return '';
    }
  }

  static List<String> getTheNumberOfChapter({required int number}) {
    List<String> convertNumber = number.toString().split('');
    List<String> result = [];
    convertNumber.forEach((element) {
      result.add(convertTheNumber(number: element));
    });
    return result;
  }
}

abstract class TestTypes{
  static String finished = 'Finished';
  static String dueSoon = 'Due Soon';
  static String notStarted = 'Not Started';
  static String overdue = 'Overdue';
  static List listOfTestTypes = [finished, dueSoon, notStarted, overdue];
  static List listOfTestColors = [AppColor.resetText, AppColor.redColor4, AppColor.lightGreyColor5, Colors.black];
}
