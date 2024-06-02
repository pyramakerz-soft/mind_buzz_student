import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class FlipBookPainterLetterS extends CustomPainter {
  FlipBookPainterLetterS({this.colorsOfPaths});
  static (Path, int) path0(Size size) {
    int keyPosition = 1;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7943775, size.height * 0.3075161);
    path_2.cubicTo(
        size.width * 0.8295582,
        size.height * 0.3075161,
        size.width * 0.8640562,
        size.height * 0.2855484,
        size.width * 0.8991968,
        size.height * 0.2416129);
    path_2.cubicTo(
        size.width * 0.9304418,
        size.height * 0.2002903,
        size.width * 0.9467470,
        size.height * 0.1673548,
        size.width * 0.9467470,
        size.height * 0.1427742);
    path_2.cubicTo(
        size.width * 0.9467470,
        size.height * 0.1087742,
        size.width * 0.9206827,
        size.height * 0.08158065,
        size.width * 0.8673092,
        size.height * 0.06222581);
    path_2.cubicTo(
        size.width * 0.8211245,
        size.height * 0.04548387,
        size.width * 0.7755020,
        size.height * 0.03216126,
        size.width * 0.7303213,
        size.height * 0.02212900);
    path_2.lineTo(size.width * 0.7303213, size.height * 0.2938710);
    path_2.cubicTo(
        size.width * 0.7571888,
        size.height * 0.3028387,
        size.width * 0.7786747,
        size.height * 0.3075161,
        size.width * 0.7943775,
        size.height * 0.3075161);
    path_2.close();
    return (path_2 as Path, keyPosition as int);
  }

  static (Path, int) path2(Size size) {
    int keyPosition = 6;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8432129, size.height * 0.4330645);
    path_0.cubicTo(
        size.width * 0.7989558,
        size.height * 0.4155484,
        size.width * 0.7514859,
        size.height * 0.4005806,
        size.width * 0.7008835,
        size.height * 0.3886129);
    path_0.lineTo(size.width * 0.05337349, size.height * 0.3886129);
    path_0.cubicTo(
        size.width * 0.06060241,
        size.height * 0.4130000,
        size.width * 0.07060241,
        size.height * 0.4356774,
        size.width * 0.08333333,
        size.height * 0.4565806);
    path_0.cubicTo(
        size.width * 0.09028112,
        size.height * 0.4680000,
        size.width * 0.09771084,
        size.height * 0.4786774,
        size.width * 0.1055823,
        size.height * 0.4886129);
    path_0.lineTo(size.width * 0.9267871, size.height * 0.4886129);
    path_0.cubicTo(
        size.width * 0.9026506,
        size.height * 0.4641290,
        size.width * 0.8748996,
        size.height * 0.4455806,
        size.width * 0.8432129,
        size.height * 0.4330645);
    path_0.close();
    return (path_0, keyPosition);
  }

  static (Path, int) path1(Size size) {
    int keyPosition = 14;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.08658635, size.height * 0.6835806);
    path_1.cubicTo(size.width * 0.02863454, size.height * 0.7484194, 0,
        size.height * 0.7981290, 0, size.height * 0.8336774);
    path_1.cubicTo(
        0,
        size.height * 0.8613871,
        size.width * 0.01433735,
        size.height * 0.8828387,
        size.width * 0.04297189,
        size.height * 0.8974839);
    path_1.cubicTo(
        size.width * 0.07871486,
        size.height * 0.9155806,
        size.width * 0.1150602,
        size.height * 0.9312258,
        size.width * 0.1520080,
        size.height * 0.9445161);
    path_1.lineTo(size.width * 0.1520080, size.height * 0.6531613);
    path_1.cubicTo(
        size.width * 0.1230120,
        size.height * 0.6552581,
        size.width * 0.1015261,
        size.height * 0.6651290,
        size.width * 0.08658635,
        size.height * 0.6835806);
    path_1.close();
    return (path_1, keyPosition);
  }

  static (Path, int) path3(Size size) {
    int keyPosition = 2;

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5319679, size.height * 0.2526129);
    path_3.cubicTo(
        size.width * 0.5899197,
        size.height * 0.2526129,
        size.width * 0.6517671,
        size.height * 0.2646452,
        size.width * 0.7169076,
        size.height * 0.2892258);
    path_3.cubicTo(
        size.width * 0.7215261,
        size.height * 0.2909032,
        size.width * 0.7259839,
        size.height * 0.2924516,
        size.width * 0.7303614,
        size.height * 0.2939032);
    path_3.lineTo(size.width * 0.7303614, size.height * 0.02216129);
    path_3.cubicTo(size.width * 0.6640964, size.height * 0.007483871,
        size.width * 0.5988755, 0, size.width * 0.5346185, 0);
    path_3.cubicTo(
        size.width * 0.5233735,
        0,
        size.width * 0.5123293,
        size.height * 0.0001290323,
        size.width * 0.5014458,
        size.height * 0.0003548387);
    path_3.lineTo(size.width * 0.5014458, size.height * 0.2532258);
    path_3.cubicTo(
        size.width * 0.5109639,
        size.height * 0.2528387,
        size.width * 0.5211647,
        size.height * 0.2526129,
        size.width * 0.5320080,
        size.height * 0.2526129);
    path_3.lineTo(size.width * 0.5319679, size.height * 0.2526129);
    path_3.close();
    return (path_3, keyPosition);
  }

  static (Path, int) path4(Size size) {
    int keyPosition = 5;

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.6986747, size.height * 0.3880645);
    path_4.cubicTo(
        size.width * 0.6472289,
        size.height * 0.3760323,
        size.width * 0.5990361,
        size.height * 0.3676774,
        size.width * 0.5541365,
        size.height * 0.3634839);
    path_4.cubicTo(
        size.width * 0.5091968,
        size.height * 0.3587742,
        size.width * 0.4720884,
        size.height * 0.3509355,
        size.width * 0.4421285,
        size.height * 0.3394194);
    path_4.cubicTo(
        size.width * 0.4128112,
        size.height * 0.3279032,
        size.width * 0.3978317,
        size.height * 0.3122258,
        size.width * 0.3978317,
        size.height * 0.2928710);
    path_4.cubicTo(
        size.width * 0.3978317,
        size.height * 0.2914194,
        size.width * 0.3979924,
        size.height * 0.2900000,
        size.width * 0.3982735,
        size.height * 0.2886129);
    path_4.lineTo(size.width * 0.03971944, size.height * 0.2886129);
    path_4.cubicTo(
        size.width * 0.03971944,
        size.height * 0.2888065,
        size.width * 0.03971944,
        size.height * 0.2890323,
        size.width * 0.03971944,
        size.height * 0.2892258);
    path_4.cubicTo(
        size.width * 0.03971944,
        size.height * 0.3249677,
        size.width * 0.04437791,
        size.height * 0.3581290,
        size.width * 0.05337390,
        size.height * 0.3886129);
    path_4.lineTo(size.width * 0.7008835, size.height * 0.3886129);
    path_4.cubicTo(
        size.width * 0.7001205,
        size.height * 0.3884516,
        size.width * 0.6993976,
        size.height * 0.3882581,
        size.width * 0.6986747,
        size.height * 0.3880645);
    path_4.close();
    return (path_4, keyPosition);
  }

  static (Path, int) path5(Size size) {
    int keyPosition = 7;

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.9267871, size.height * 0.4886129);
    path_5.lineTo(size.width * 0.1078317, size.height * 0.4886129);
    path_5.lineTo(size.width * 0.1078317, size.height * 0.4914194);
    path_5.cubicTo(
        size.width * 0.1319281,
        size.height * 0.5210968,
        size.width * 0.1602012,
        size.height * 0.5440000,
        size.width * 0.1927313,
        size.height * 0.5601290);
    path_5.cubicTo(
        size.width * 0.2132936,
        size.height * 0.5703226,
        size.width * 0.2345386,
        size.height * 0.5798065,
        size.width * 0.2565064,
        size.height * 0.5886129);
    path_5.lineTo(size.width * 0.9873092, size.height * 0.5886129);
    path_5.cubicTo(
        size.width * 0.9800000,
        size.height * 0.5645161,
        size.width * 0.9693976,
        size.height * 0.5425161,
        size.width * 0.9552209,
        size.height * 0.5224839);
    path_5.cubicTo(
        size.width * 0.9463855,
        size.height * 0.5101290,
        size.width * 0.9369076,
        size.height * 0.4988710,
        size.width * 0.9267871,
        size.height * 0.4886129);
    path_5.close();
    return (path_5, keyPosition);
  }

  static (Path, int) path6(Size size) {
    int keyPosition = 8;

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.2567867, size.height * 0.5886129);
    path_6.lineTo(size.width * 0.2567867, size.height * 0.5887097);
    path_6.cubicTo(
        size.width * 0.2820478,
        size.height * 0.5988065,
        size.width * 0.3082325,
        size.height * 0.6080000,
        size.width * 0.3353410,
        size.height * 0.6160968);
    path_6.cubicTo(
        size.width * 0.3861442,
        size.height * 0.6312581,
        size.width * 0.4336546,
        size.height * 0.6417097,
        size.width * 0.4779518,
        size.height * 0.6464194);
    path_6.cubicTo(
        size.width * 0.5085944,
        size.height * 0.6500323,
        size.width * 0.5354217,
        size.height * 0.6544194,
        size.width * 0.5585944,
        size.height * 0.6595484);
    path_6.lineTo(size.width * 0.9990763, size.height * 0.6595484);
    path_6.cubicTo(
        size.width * 0.9978715,
        size.height * 0.6340968,
        size.width * 0.9939759,
        size.height * 0.6104839,
        size.width * 0.9873494,
        size.height * 0.5885806);
    path_6.lineTo(size.width * 0.2567867, size.height * 0.5885806);
    path_6.lineTo(size.width * 0.2567867, size.height * 0.5886129);
    path_6.close();
    return (path_6, keyPosition);
  }

  static (Path, int) path7(Size size) {
    int keyPosition = 9;

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.9990361, size.height * 0.6595806);
    path_7.lineTo(size.width * 0.5585542, size.height * 0.6595806);
    path_7.cubicTo(
        size.width * 0.5688353,
        size.height * 0.6618710,
        size.width * 0.5784739,
        size.height * 0.6642581,
        size.width * 0.5873092,
        size.height * 0.6668387);
    path_7.cubicTo(
        size.width * 0.6166265,
        size.height * 0.6757419,
        size.width * 0.6309237,
        size.height * 0.6861935,
        size.width * 0.6309237,
        size.height * 0.6982258);
    path_7.cubicTo(
        size.width * 0.6309237,
        size.height * 0.7124516,
        size.width * 0.6199598,
        size.height * 0.7232258,
        size.width * 0.5981124,
        size.height * 0.7305484);
    path_7.lineTo(size.width * 0.9958635, size.height * 0.7305484);
    path_7.cubicTo(
        size.width * 0.9982329,
        size.height * 0.7136452,
        size.width * 0.9994779,
        size.height * 0.6959032,
        size.width * 0.9994779,
        size.height * 0.6772903);
    path_7.cubicTo(
        size.width * 0.9994779,
        size.height * 0.6712903,
        size.width * 0.9993173,
        size.height * 0.6653871,
        size.width * 0.9990361,
        size.height * 0.6595806);
    path_7.close();
    return (path_7, keyPosition);
  }

  static (Path, int) path8(Size size) {
    int keyPosition = 10;

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.5981124, size.height * 0.7305484);
    path_8.cubicTo(
        size.width * 0.5807631,
        size.height * 0.7363548,
        size.width * 0.5565863,
        size.height * 0.7399677,
        size.width * 0.5255020,
        size.height * 0.7414194);
    path_8.lineTo(size.width * 0.5255020, size.height * 0.8273226);
    path_8.lineTo(size.width * 0.9646988, size.height * 0.8273226);
    path_8.cubicTo(
        size.width * 0.9803614,
        size.height * 0.7990000,
        size.width * 0.9908032,
        size.height * 0.7667097,
        size.width * 0.9958635,
        size.height * 0.7305484);
    path_8.lineTo(size.width * 0.5981124, size.height * 0.7305484);
    path_8.close();
    return (path_8, keyPosition);
  }

  static (Path, int) path9(Size size) {
    int keyPosition = 11;

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.5255020, size.height * 0.8273226);
    path_9.lineTo(size.width * 0.5255020, size.height * 0.7414194);
    path_9.cubicTo(
        size.width * 0.5151807,
        size.height * 0.7419032,
        size.width * 0.5040964,
        size.height * 0.7421290,
        size.width * 0.4922490,
        size.height * 0.7421290);
    path_9.cubicTo(
        size.width * 0.4648996,
        size.height * 0.7421290,
        size.width * 0.4344578,
        size.height * 0.7373226,
        size.width * 0.4010044,
        size.height * 0.7278710);
    path_9.lineTo(size.width * 0.4010044, size.height * 0.9971935);
    path_9.cubicTo(
        size.width * 0.4257430,
        size.height * 0.9990323,
        size.width * 0.4507229,
        size.height * 0.9999677,
        size.width * 0.4759839,
        size.height * 0.9999677);
    path_9.cubicTo(
        size.width * 0.4929719,
        size.height * 0.9999677,
        size.width * 0.5094378,
        size.height * 0.9997097,
        size.width * 0.5255020,
        size.height * 0.9992258);
    path_9.cubicTo(
        size.width * 0.5772691,
        size.height * 0.9976774,
        size.width * 0.6243775,
        size.height * 0.9936774,
        size.width * 0.6661044,
        size.height * 0.9868710);
    path_9.cubicTo(
        size.width * 0.7214458,
        size.height * 0.9779677,
        size.width * 0.7761446,
        size.height * 0.9633226,
        size.width * 0.8302008,
        size.height * 0.9419032);
    path_9.cubicTo(
        size.width * 0.8432932,
        size.height * 0.9366452,
        size.width * 0.8557028,
        size.height * 0.9306774,
        size.width * 0.8674297,
        size.height * 0.9240645);
    path_9.cubicTo(
        size.width * 0.9035341,
        size.height * 0.9036129,
        size.width * 0.9330924,
        size.height * 0.8766129,
        size.width * 0.9552209,
        size.height * 0.8430645);
    path_9.cubicTo(
        size.width * 0.9585944,
        size.height * 0.8379677,
        size.width * 0.9617269,
        size.height * 0.8326774,
        size.width * 0.9647390,
        size.height * 0.8272903);
    path_9.lineTo(size.width * 0.5255422, size.height * 0.8272903);
    path_9.lineTo(size.width * 0.5255020, size.height * 0.8273226);
    path_9.close();
    return (path_9, keyPosition);
  }

  static (Path, int) path10(Size size) {
    int keyPosition = 12;

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.3027715, size.height * 0.6909032);
    path_10.cubicTo(
        size.width * 0.2938157,
        size.height * 0.6865484,
        size.width * 0.2851008,
        size.height * 0.6826129,
        size.width * 0.2765064,
        size.height * 0.6790323);
    path_10.lineTo(size.width * 0.2765064, size.height * 0.9797419);
    path_10.cubicTo(
        size.width * 0.3172695,
        size.height * 0.9882581,
        size.width * 0.3587554,
        size.height * 0.9940968,
        size.width * 0.4010044,
        size.height * 0.9972258);
    path_10.lineTo(size.width * 0.4010044, size.height * 0.7279032);
    path_10.cubicTo(
        size.width * 0.3707635,
        size.height * 0.7193548,
        size.width * 0.3380325,
        size.height * 0.7070323,
        size.width * 0.3027715,
        size.height * 0.6909032);
    path_10.close();
    return (path_10, keyPosition);
  }

  static (Path, int) path11(Size size) {
    int keyPosition = 13;

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.1640960, size.height * 0.6527097);
    path_11.cubicTo(
        size.width * 0.1599193,
        size.height * 0.6527097,
        size.width * 0.1559434,
        size.height * 0.6528710,
        size.width * 0.1520478,
        size.height * 0.6531290);
    path_11.lineTo(size.width * 0.1520478, size.height * 0.9444839);
    path_11.cubicTo(
        size.width * 0.1928108,
        size.height * 0.9591290,
        size.width * 0.2342968,
        size.height * 0.9708710,
        size.width * 0.2765458,
        size.height * 0.9797097);
    path_11.lineTo(size.width * 0.2765458, size.height * 0.6790000);
    path_11.cubicTo(
        size.width * 0.2345779,
        size.height * 0.6613871,
        size.width * 0.1971080,
        size.height * 0.6527097,
        size.width * 0.1640960,
        size.height * 0.6527097);
    path_11.close();
    return (path_11, keyPosition);
  }

  static (Path, int) path12(Size size) {
    int keyPosition = 3;

    Path path_12 = Path();
    path_12.moveTo(size.width * 0.4010044, size.height * 0.006129000);
    path_12.lineTo(size.width * 0.4010044, size.height * 0.2815484);
    path_12.cubicTo(
        size.width * 0.4108835,
        size.height * 0.2650968,
        size.width * 0.4441365,
        size.height * 0.2555806,
        size.width * 0.5014056,
        size.height * 0.2531935);
    path_12.lineTo(size.width * 0.5014056, size.height * 0.0003547903);
    path_12.cubicTo(
        size.width * 0.4658635,
        size.height * 0.001096726,
        size.width * 0.4324096,
        size.height * 0.003032210,
        size.width * 0.4010044,
        size.height * 0.006161258);
    path_12.lineTo(size.width * 0.4010044, size.height * 0.006129000);
    path_12.close();
    return (path_12, keyPosition);
  }

  static (Path, int) path13(Size size) {
    int keyPosition = 4;

    Path path_13 = Path();
    path_13.moveTo(size.width * 0.2684743, size.height * 0.02958052);
    path_13.cubicTo(
        size.width * 0.1161851,
        size.height * 0.07145161,
        size.width * 0.03996040,
        size.height * 0.1577097,
        size.width * 0.03971944,
        size.height * 0.2886129);
    path_13.lineTo(size.width * 0.3982735, size.height * 0.2886129);
    path_13.cubicTo(
        size.width * 0.3987554,
        size.height * 0.2861290,
        size.width * 0.3996791,
        size.height * 0.2837742,
        size.width * 0.4010446,
        size.height * 0.2815484);
    path_13.lineTo(size.width * 0.4010446, size.height * 0.006128903);
    path_13.cubicTo(
        size.width * 0.3518478,
        size.height * 0.01103213,
        size.width * 0.3076711,
        size.height * 0.01883858,
        size.width * 0.2685145,
        size.height * 0.02958052);
    path_13.lineTo(size.width * 0.2684743, size.height * 0.02958052);
    path_13.close();
    return (path_13, keyPosition);
  }

  final List<Color>? colorsOfPaths;
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.save();

    Path path_1 = path0(size).$1;
    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.red;//colorsOfPaths?[0]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_1, paint_2_fill);

    Path path_2 = path3(size).$1;
    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = colorsOfPaths?[1]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_2, paint_3_fill);

    Path path_3 = path12(size).$1;
    Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    paint_12_fill.color = colorsOfPaths?[2]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_3, paint_12_fill);

    Path path_4 = path13(size).$1;
    Paint paint_13_fill = Paint()..style = PaintingStyle.fill;
    paint_13_fill.color = colorsOfPaths?[3]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_4, paint_13_fill);

    Path path_5 = path4(size).$1;
    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = colorsOfPaths?[4]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_5, paint_4_fill);

    Path path_6 = path2(size).$1;
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = colorsOfPaths?[5]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_6, paint_0_fill);

    Path path_7 = path5(size).$1;
    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = colorsOfPaths?[6]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_7, paint_5_fill);

    Path path_8 = path6(size).$1;
    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = colorsOfPaths?[7]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_8, paint_6_fill);

    Path path_9 = path7(size).$1;
    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = colorsOfPaths?[8]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_9, paint_7_fill);

    Path path_10 = path8(size).$1;
    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = colorsOfPaths?[9]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_10, paint_8_fill);

    Path path_11 = path9(size).$1;
    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = colorsOfPaths?[10]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_11, paint_9_fill);

    Path path_12 = path10(size).$1;
    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = colorsOfPaths?[11]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_12, paint_10_fill);

    Path path_13 = path11(size).$1;
    Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    paint_11_fill.color = colorsOfPaths?[12]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_13, paint_11_fill);

    Path path_14 = path1(size).$1;
    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = colorsOfPaths?[13]??AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_14, paint_1_fill);

    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  static int? indexOfPointInside(Offset point, Size size) {
    if  (path0(size).$1.contains(point)) {
      return path0(size).$2;
    }
    else if (path1(size).$1.contains(point)) {
      return path1(size).$2;
    }
    else if (path2(size).$1.contains(point)) {
      return path2(size).$2;
    }
    else if (path3(size).$1.contains(point)) {
      return path3(size).$2;
    }
    else if (path4(size).$1.contains(point)) {
      return path4(size).$2;
    }
    else if (path5(size).$1.contains(point)) {
      return path5(size).$2;
    }
    else if (path6(size).$1.contains(point)) {
      return path6(size).$2;
    }
    else if (path7(size).$1.contains(point)) {
      return path7(size).$2;
    }
    else if (path8(size).$1.contains(point)) {
      return path8(size).$2;
    }
    else if (path9(size).$1.contains(point)) {
      return path9(size).$2;
    }
    else if (path10(size).$1.contains(point)) {
      return path10(size).$2;
    }
    else if (path11(size).$1.contains(point)) {
      return path11(size).$2;
    }
    else if (path12(size).$1.contains(point)) {
      return path12(size).$2;
    }
    else if (path13(size).$1.contains(point)) {
      return path13(size).$2;
    }
    else{
      return null;
    }
  }
}
