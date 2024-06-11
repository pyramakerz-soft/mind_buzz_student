import 'package:flutter/material.dart';

import '../../../../../../core/games_structure/phonetics/phonetics_color.dart';

class WaveDice extends StatelessWidget {
  final String? currentAlphabet;
  final Widget? body;
  final double? width;
  final double? height;
  double widthAndHeight = 120;

  WaveDice({Key? key, this.currentAlphabet, this.body, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: AppColorPhonetics.DarkBorderColor,
          // gradient: const LinearGradient(
          //   begin: Alignment(1.00, 0.00),
          //   end: Alignment(-1, 0),
          //   colors: [AppColor.orangeColor, AppColor.lightOrangeColor2],
          // ),
          border: Border.all(width: 3, color: const Color(0xFFFFFBF8))),
      alignment: Alignment.center,
      width: width ?? widthAndHeight,
      height: height ?? widthAndHeight,
      child: body ??
          Text(
            (currentAlphabet?.toLowerCase() ?? ''),
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
    );
  }
}
