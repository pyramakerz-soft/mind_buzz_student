import 'package:flutter/material.dart';

class AppColor {
  static const Color lightBlueColor = Color(0xFFB9E3EB);
  // static const Color lightBlueColor2 = Color(0xFFC8EFF6);
  static const Color lightBlueColor3 = Color(0xFFF5F7FF);
  static const Color blackRedColor = Color(0xFF1E1E1E);
  // static const Color brownColor4 = Color(0xFFA8592C);
  // static const Color lightBlueColor5 = Color(0xFF95CED9);
  // static const Color lightBlueColor6 = Color(0xFF80CCDA);
  // static const Color lightBlueColor7 = Color(0xFF58B1C1);
  static const Color lightBlueColor8 = Color(0xFF95DDF5);
  // static const Color lightBlueColor1 = Color(0xFF61DBF0);
  static const Color greyColor = Color(0xFFAFA5A5);
  static const Color yellowColor = Color(0xFFFECB2F);
  static const Color yellowColor1 = Color(0xFFF6BB3C);
  static const Color yellowColor2 = Color(0xFFFFD75E);
  static const Color yellowColor3 = Color(0xFFFFECB1);
  static const Color blueColor1 = Color(0xFF3B5FAE);
  static const Color blueColor2 = Color(0xFF4C73C7);
  static const Color blueColor3 = Color(0xFF7BB0DB);
  static const Color greenColor1 = Color(0xFF52C495);
  static const Color greenColor2 = Color(0xFF52C495);
  static const Color greenColor3 = Color(0xFFA6F4D6);
  static const Color correct = Color(0xFFB1E59F);
  static const Color incorrect = Color(0xFFF9B1B1);
  static const Color redColor1 = Color(0xFFD1232A);
  static const Color redColor2 = Color(0xFFF5454C);
  static const Color redColor3 = Color(0xFFFFA1A5);
  static const Color whiteBlue = Color(0xFFEDF7FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blueColor = Color(0xFF1690EB);
  static const Color burberColor = Color(0xFF6750A3);
  static const Color purpleColor = Color(0xFF713A9C);
  static const Color darkBlueColor = Color(0xFF004279);
  static const Color darkBlueColor3 = Color(0xFF003348);
  static const Color darkBlueColor2 = Color(0xFF5FA1D5);
  static const Color blackRed = Color(0x07000000);
  static const Color whiteRed = Color(0xFFF5F5F5);
  static const Color whiteBlue2 = Color(0xFFF9F9FA);

  static const Color darkBlueColor4 = Color(0xFF3B5FAE);
  static const Color darkBlueColor5 = Color(0xFF4C73C7);
  static const Color darkBlueColor6 = Color(0xFF7BB0DB);
  static const Color darkBlueColor7 = Color(0xFF80D4E9);
  static const Color skyBlueColor = Color(0xFF9ADFF5);

  // static const Color darkGreenColor = Color(0xFF076F45);
  static const Color darkGreenColor2 = Color(0xFF3A9C74);
  // static const Color lightGreenColor = Color(0xFF88C979);
  static const Color redColor = Color(0xFFD1232A);
  static const Color redColor4 = Color(0xFFE03138);
  // static const Color pinkColor = Color(0xFFEB1E83);
  static const Color orangeColor = Color(0xFFDB4E19);
  // static const Color bgMatheColor = Color(0xFFafe2fd);
  static const Color titleColor = Color(0xFF786B6B);
  static const Color lightGreyColor = Color(0xEEEEEEEE);
  static const Color lightGreyColor2 = Color(0xFFF7F7F7);
  static const Color lightGreyColor3 = Color(0xFF707070);
  static const Color lightGreyColor4 = Color(0xFFABABAB);
  static const Color lightGreyColor5 = Color(0xFFCCCCCC);
  static const Color lightGreyColor6 = Color(0xFF77838F);
  static const Color lightGreyColor7 = Color(0xFF475467);
  static const Color lightGreyColor8 = Color(0xFFBFBFBF);
  static const Color lightGreyColor9 = Color(0xFF938989);
  static const Color borderGreyColor = Color(0xFFD4D4D4);
  static const Color darkBlueColor10 = Color(0x19004279);
  static const Color dividerColor = Color(0xffE5E5E5);
  static const Color darkGreyText = Color(0xff33393E);
  static const Color resetText = Color(0xff008D4B);
  static const Color textFieldColor = Color(0xffF9F9FA);
  static const Color selectedColor = Color(0xff5AE2C8);
  static const Color strokeColor = Color(0xff7E3116);
  static const Color dragContainerColor = Color(0xffF0D2AA);
  Color hexToColor(String code) {
    return Color(int.parse("0xff${code.toString().split("#").last}"));
  }

  static const Color calenderDayText = Color(0xff3C3C43);
  
  static const gradientColor1 = LinearGradient(
          colors: [
            Color(0xFF114677), // Start color
            Color(0xFF2A6294), // End color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
}
