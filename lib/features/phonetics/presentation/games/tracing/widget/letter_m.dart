import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class FlipBookPainterLetterM extends CustomPainter {
  final List<Color?>? colorsOfPaths;

  FlipBookPainterLetterM({required this.colorsOfPaths});
  static (Path, int) path0(Size size) {
    int keyPosition = 2;

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0003160974,size.height*0.2025316);
    path_0.cubicTo(size.width*0.0006055711,size.height*0.2705907,size.width*0.0009476763,size.height*0.3401688,size.width*0.0009476763,size.height*0.3834599);
    path_0.lineTo(size.width*0.0009476763,size.height*0.4050633);
    path_0.lineTo(size.width*0.2456318,size.height*0.4050633);
    path_0.cubicTo(size.width*0.2465792,size.height*0.4025738,size.width*0.2475792,size.height*0.4000844,size.width*0.2486318,size.height*0.3976371);
    path_0.lineTo(size.width*0.2486318,size.height*0.2025316);
    path_0.lineTo(size.width*0.0003160974,size.height*0.2025316);
    path_0.close();
    return (path_0 as Path, keyPosition as int);
  }

  static (Path, int) path2(Size size) {
    int keyPosition = 1;

    Path path_2 = Path();
    path_2.moveTo(size.width*0.2486316,size.height*0.04594937);
    path_2.cubicTo(size.width*0.2350526,size.height*0.05852321,size.width*0.2219474,size.height*0.07358650,size.width*0.2092368,size.height*0.09122363);
    path_2.lineTo(size.width*0.2092368,size.height*0.07886076);
    path_2.cubicTo(size.width*0.2082632,size.height*0.03400844,size.width*0.1861053,0,size.width*0.1591053,0);
    path_2.lineTo(size.width*0.05013158,0);
    path_2.cubicTo(size.width*0.02218421,0,0,size.height*0.03556962,0,size.height*0.08037975);
    path_2.cubicTo(0,size.height*0.1154852,size.width*0.0001578947,size.height*0.1586920,size.width*0.0003157895,size.height*0.2025316);
    path_2.lineTo(size.width*0.2486316,size.height*0.2025316);
    path_2.lineTo(size.width*0.2486316,size.height*0.04594937);
    path_2.close();
    return (path_2 as Path, keyPosition as int);
  }
  static (Path, int) path3(Size size) {
    int keyPosition = 3;

    Path path_3 = Path();
    path_3.moveTo(size.width*0.0009739921,size.height*0.6075949);
    path_3.lineTo(size.width*0.2266318,size.height*0.6075949);
    path_3.lineTo(size.width*0.2266318,size.height*0.5086920);
    path_3.cubicTo(size.width*0.2266318,size.height*0.4808439,size.width*0.2295266,size.height*0.4638397,size.width*0.2314476,size.height*0.4545570);
    path_3.lineTo(size.width*0.2324213,size.height*0.4514768);
    path_3.lineTo(size.width*0.2333950,size.height*0.4483966);
    path_3.cubicTo(size.width*0.2361582,size.height*0.4338819,size.width*0.2403161,size.height*0.4190717,size.width*0.2456845,size.height*0.4050633);
    path_3.lineTo(size.width*0.0009739921,size.height*0.4050633);
    path_3.lineTo(size.width*0.0009739921,size.height*0.6075949);
    path_3.close();
    return (path_3 as Path, keyPosition as int);
  }
  static (Path, int) path4(Size size) {
    int keyPosition = 4;

    Path path_4 = Path();
    path_4.moveTo(size.width*0.2266318,size.height*0.6075949);
    path_4.lineTo(size.width*0.0009739921,size.height*0.6075949);
    path_4.lineTo(size.width*0.0009739921,size.height*0.8101266);
    path_4.lineTo(size.width*0.2266318,size.height*0.8101266);
    path_4.lineTo(size.width*0.2266318,size.height*0.6075949);
    path_4.close();
    return (path_4 as Path, keyPosition as int);
  }
  static (Path, int) path5(Size size) {
    int keyPosition = 5;

    Path path_5 = Path();
    path_5.moveTo(size.width*0.0009739921,size.height*0.9084388);
    path_5.cubicTo(size.width*0.0009739921,size.height*0.9532911,size.width*0.02315821,size.height*0.9888186,size.width*0.05113184,size.height*0.9888186);
    path_5.lineTo(size.width*0.1765003,size.height*0.9888186);
    path_5.cubicTo(size.width*0.2044739,size.height*0.9888186,size.width*0.2266318,size.height*0.9532489,size.width*0.2266318,size.height*0.9084388);
    path_5.lineTo(size.width*0.2266318,size.height*0.8016878);
    path_5.lineTo(size.width*0.0009739921,size.height*0.8016878);
    path_5.lineTo(size.width*0.0009739921,size.height*0.9084388);
    path_5.close();
    return (path_5 as Path, keyPosition as int);
  }
  static (Path, int) path14(Size size) {
    int keyPosition = 6;

    Path path_14 = Path();
    path_14.moveTo(size.width*0.3558421,0);
    path_14.cubicTo(size.width*0.3169474,0,size.width*0.2814737,size.height*0.01556962,size.width*0.2486584,size.height*0.04594937);
    path_14.lineTo(size.width*0.2486584,size.height*0.3976371);
    path_14.cubicTo(size.width*0.2640526,size.height*0.3613502,size.width*0.2878947,size.height*0.3324051,size.width*0.3172895,size.height*0.3324051);
    path_14.cubicTo(size.width*0.3503421,size.height*0.3324051,size.width*0.3684474,size.height*0.3647679,size.width*0.3781316,size.height*0.4050211);
    path_14.lineTo(size.width*0.4374474,size.height*0.4050211);
    path_14.lineTo(size.width*0.4374474,size.height*0.02177215);
    path_14.cubicTo(size.width*0.4119737,size.height*0.007552743,size.width*0.3845263,0,size.width*0.3558421,0);
    path_14.close();
    return (path_14 as Path, keyPosition as int);
  }
  static (Path, int) path16(Size size) {
    int keyPosition = 7;

    Path path_16 = Path();
    path_16.moveTo(size.width*0.4374474,size.height*0.02177177);
    path_16.lineTo(size.width*0.4374474,size.height*0.4050629);
    path_16.lineTo(size.width*0.5338947,size.height*0.4050629);
    path_16.lineTo(size.width*0.5338947,size.height*0.1240502);
    path_16.cubicTo(size.width*0.5076316,size.height*0.07751013,size.width*0.4746842,size.height*0.04253122,size.width*0.4374474,size.height*0.02177177);
    path_16.close();
    return (path_16 as Path, keyPosition as int);
  }
  static (Path, int) path6(Size size) {
    int keyPosition = 8;

    Path path_6 = Path();
    path_6.moveTo(size.width*0.3886316,size.height*0.5117722);
    path_6.lineTo(size.width*0.3886316,size.height*0.6075949);
    path_6.lineTo(size.width*0.6142895,size.height*0.6075949);
    path_6.lineTo(size.width*0.6142895,size.height*0.4932489);
    path_6.cubicTo(size.width*0.6142895,size.height*0.4746835,size.width*0.6162105,size.height*0.4515190,size.width*0.6200789,size.height*0.4345148);
    path_6.cubicTo(size.width*0.6221316,size.height*0.4245992,size.width*0.6249211,size.height*0.4146414,size.width*0.6282895,size.height*0.4051055);
    path_6.lineTo(size.width*0.3781316,size.height*0.4051055);
    path_6.cubicTo(size.width*0.3865526,size.height*0.4400422,size.width*0.3886316,size.height*0.4809283,size.width*0.3886316,size.height*0.5118143);
    path_6.lineTo(size.width*0.3886316,size.height*0.5117722);
    path_6.close();
    return (path_6 as Path, keyPosition as int);
  }
  static (Path, int) path7(Size size) {
    int keyPosition = 9;

    Path path_7 = Path();
    path_7.moveTo(size.width*0.6142895,size.height*0.6075949);
    path_7.lineTo(size.width*0.3886316,size.height*0.6075949);
    path_7.lineTo(size.width*0.3886316,size.height*0.8101266);
    path_7.lineTo(size.width*0.6142895,size.height*0.8101266);
    path_7.lineTo(size.width*0.6142895,size.height*0.6075949);
    path_7.close();
    return (path_7 as Path, keyPosition as int);
  }
  static (Path, int) path8(Size size) {
    int keyPosition = 10;

    Path path_8 = Path();
    path_8.moveTo(size.width*0.3886316,size.height*0.9069198);
    path_8.cubicTo(size.width*0.3886316,size.height*0.9517722,size.width*0.4108158,size.height*0.9872996,size.width*0.4387632,size.height*0.9872996);
    path_8.lineTo(size.width*0.5641316,size.height*0.9872996);
    path_8.cubicTo(size.width*0.5921053,size.height*0.9872996,size.width*0.6142895,size.height*0.9517300,size.width*0.6142895,size.height*0.9069198);
    path_8.lineTo(size.width*0.6142895,size.height*0.8016878);
    path_8.lineTo(size.width*0.3886316,size.height*0.8016878);
    path_8.lineTo(size.width*0.3886316,size.height*0.9069198);
    path_8.close();
    return (path_8 as Path, keyPosition as int);
  }
  static (Path, int) path17(Size size) {
    int keyPosition = 11;

    Path path_17 = Path();
    path_17.moveTo(size.width*0.6411842,size.height*0.3762869);
    path_17.lineTo(size.width*0.6411842,size.height*0.02409266);
    path_17.cubicTo(size.width*0.6147105,size.height*0.03856523,size.width*0.5902105,size.height*0.05970464,size.width*0.5670263,size.height*0.08814346);
    path_17.cubicTo(size.width*0.5564211,size.height*0.1005063,size.width*0.5467632,size.height*0.1144304,size.width*0.5371316,size.height*0.1298734);
    path_17.cubicTo(size.width*0.5360526,size.height*0.1278903,size.width*0.5349737,size.height*0.1259916,size.width*0.5338684,size.height*0.1240506);
    path_17.lineTo(size.width*0.5338684,size.height*0.4050633);
    path_17.lineTo(size.width*0.6282632,size.height*0.4050633);
    path_17.cubicTo(size.width*0.6318684,size.height*0.3948945,size.width*0.6361842,size.height*0.3851477,size.width*0.6411579,size.height*0.3762869);
    path_17.lineTo(size.width*0.6411842,size.height*0.3762869);
    path_17.close();
    return (path_17 as Path, keyPosition as int);
  }


  static (Path, int) path9(Size size) {
    int keyPosition = 12;

    Path path_9 = Path();
    path_9.moveTo(size.width*0.7386579,0);
    path_9.cubicTo(size.width*0.7029737,0,size.width*0.6708421,size.height*0.007848101,size.width*0.6411579,size.height*0.02409283);
    path_9.lineTo(size.width*0.6411579,size.height*0.2025316);
    path_9.lineTo(size.width*0.9543947,size.height*0.2025316);
    path_9.cubicTo(size.width*0.9030789,size.height*0.05763713,size.width*0.8166579,0,size.width*0.7386579,0);
    path_9.close();
    return (path_9 as Path, keyPosition as int);
  }
  static (Path, int) path10(Size size) {
    int keyPosition = 13;

    Path path_10 = Path();
    path_10.moveTo(size.width*0.6411842,size.height*0.2025316);
    path_10.lineTo(size.width*0.6411842,size.height*0.3762869);
    path_10.cubicTo(size.width*0.6555000,size.height*0.3507173,size.width*0.6751053,size.height*0.3324473,size.width*0.6981842,size.height*0.3324473);
    path_10.cubicTo(size.width*0.7130263,size.height*0.3324473,size.width*0.7444211,size.height*0.3324473,size.width*0.7618947,size.height*0.4050633);
    path_10.lineTo(size.width*0.9951579,size.height*0.4050633);
    path_10.cubicTo(size.width*0.9881316,size.height*0.3240928,size.width*0.9737632,size.height*0.2571308,size.width*0.9544211,size.height*0.2025316);
    path_10.lineTo(size.width*0.6411842,size.height*0.2025316);
    path_10.close();
    return (path_10 as Path, keyPosition as int);
  }
  static (Path, int) path11(Size size) {
    int keyPosition = 14;

    Path path_11 = Path();
    path_11.moveTo(size.width*0.9951579,size.height*0.4050633);
    path_11.lineTo(size.width*0.7618947,size.height*0.4050633);
    path_11.cubicTo(size.width*0.7693947,size.height*0.4362025,size.width*0.7743421,size.height*0.4806751,size.width*0.7743421,size.height*0.5442616);
    path_11.lineTo(size.width*0.7743421,size.height*0.6075949);
    path_11.lineTo(size.width,size.height*0.6075949);
    path_11.lineTo(size.width,size.height*0.5226160);
    path_11.cubicTo(size.width,size.height*0.4805063,size.width*0.9983158,size.height*0.4413924,size.width*0.9951579,size.height*0.4050633);
    path_11.close();
    return (path_11 as Path, keyPosition as int);
  }
  static (Path, int) path12(Size size) {
    int keyPosition = 15;

    Path path_12 = Path();
    path_12.moveTo(size.width,size.height*0.6075949);
    path_12.lineTo(size.width*0.7743421,size.height*0.6075949);
    path_12.lineTo(size.width*0.7743421,size.height*0.8101266);
    path_12.lineTo(size.width,size.height*0.8101266);
    path_12.lineTo(size.width,size.height*0.6075949);
    path_12.close();
    return (path_12 as Path, keyPosition as int);
  }
  static (Path, int) path13(Size size) {
    int keyPosition = 16;

    Path path_13 = Path();
    path_13.moveTo(size.width*0.8245000,size.height*0.9957384);
    path_13.lineTo(size.width*0.8245000,size.height*0.9972996);
    path_13.lineTo(size.width*0.9498684,size.height*0.9972996);
    path_13.cubicTo(size.width*0.9778421,size.height*0.9972996,size.width,size.height*0.9617300,size.width,size.height*0.9169198);
    path_13.lineTo(size.width,size.height*0.8101688);
    path_13.lineTo(size.width*0.7743421,size.height*0.8101688);
    path_13.lineTo(size.width*0.7743421,size.height*0.9154008);
    path_13.cubicTo(size.width*0.7743421,size.height*0.9602532,size.width*0.7965263,size.height*0.9957806,size.width*0.8245000,size.height*0.9957806);
    path_13.lineTo(size.width*0.8245000,size.height*0.9957384);
    path_13.close();
    return (path_13 as Path, keyPosition as int);
  }

  @override
  void paint(Canvas canvas, Size size) {
    (Path, int) path_1 = path0(size);
    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = colorsOfPaths?[path_1.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_1.$1,paint_0_fill);


    (Path, int) path_3 = path2(size);
    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = colorsOfPaths?[path_3.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_3.$1,paint_3_fill);

    (Path, int) path_4 = path3(size);
    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = colorsOfPaths?[path_4.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_4.$1,paint_4_fill);

    (Path, int) path_5 = path4(size);
    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = colorsOfPaths?[path_5.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_5.$1,paint_5_fill);

    (Path, int) path_7 = path5(size);
    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = colorsOfPaths?[path_7.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_7.$1,paint_7_fill);

    (Path, int) path_16 = path14(size);
    Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
    paint_16_fill.color = colorsOfPaths?[path_16.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_16.$1,paint_16_fill);


    (Path, int) path_18 = path16(size);
    Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
    paint_18_fill.color = colorsOfPaths?[path_18.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_18.$1,paint_18_fill);

    (Path, int) path_8 = path6(size);
    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = colorsOfPaths?[path_8.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_8.$1,paint_8_fill);
    //
    (Path, int) path_9 = path7(size);
    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = colorsOfPaths?[path_9.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_9.$1,paint_9_fill);
    //
    (Path, int) path_10 = path8(size);
    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = colorsOfPaths?[path_10.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_10.$1,paint_10_fill);
    //
    (Path, int) path_11 = path9(size);
    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = colorsOfPaths?[path_11.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_11.$1,paint_11_fill);
    //
    (Path, int) path_12 = path10(size);
    Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
    paint_12_fill.color = colorsOfPaths?[path_12.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_12.$1,paint_12_fill);

    //
    (Path, int) path_13 = path11(size);
    Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
    paint_13_fill.color = colorsOfPaths?[path_13.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_13.$1,paint_13_fill);
    //
    (Path, int) path_14 = path12(size);
    Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
    paint_14_fill.color = colorsOfPaths?[path_14.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_14.$1,paint_14_fill);
    //
    (Path, int) path_15 = path13(size);
    Paint paint_15_fill = Paint()..style=PaintingStyle.fill;
    paint_15_fill.color = colorsOfPaths?[path_15.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_15.$1,paint_15_fill);




    (Path, int) path_19 = path17(size);
    Paint paint_19_fill = Paint()..style=PaintingStyle.fill;
    paint_19_fill.color = colorsOfPaths?[path_19.$2-1] ?? AppColor.lightBlueColor2.withOpacity(1.0);
    canvas.drawPath(path_19.$1,paint_19_fill);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  static int? indexOfPointInside(Offset point, Size size) {
    if (path0(size).$1.contains(point)) {
      return path0(size).$2;
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
    else if (path14(size).$1.contains(point)) {
      return path14(size).$2;
    }
    else if (path16(size).$1.contains(point)) {
      return path16(size).$2;
    }
    else if (path17(size).$1.contains(point)) {
      return path17(size).$2;
    }
    else {
      return null;
    }
  }

}