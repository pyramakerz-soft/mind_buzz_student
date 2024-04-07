import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/math/main_math.dart';
import '../manager/beads_matching_cubit.dart';

class MatchingScreen extends StatelessWidget{
  final Function() defaultActionOfSuccessAnswer;
  final Function() defaultActionOfWrongAnswer;
  Offset? firstPosition;
  Offset? secondPosition;
  MatchingScreen({Key? key, required this.defaultActionOfSuccessAnswer, required this.defaultActionOfWrongAnswer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final questionData = context.watch<BeadsMatchingCubit>().questionData;

    return CustomPaint(
        painter: ConnectionPainter(firstPosition, secondPosition),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(),
      Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: int.parse(
                    "${(questionData.control?.control ?? 1)}") *
                    50,
                // height: MediaQuery.of(context).size.height / 2,
                child: MainMath.getTheBox(
                    countOfBalls: int.parse(
                        "${questionData.control?.control ?? 0}"))),
            SizedBox(
                width: int.parse(
                    "${(questionData.control?.action ?? 1)}") *
                    50,
                // height: MediaQuery.of(context).size.height / 2,
                child: MainMath.getTheBox(
                    countOfBalls: int.parse(
                        "${questionData.control?.control ?? 0}"))),
          ],
        ),
      ),
      SizedBox(
        height: 28*9,
        child: Column(
          children: List.generate(9, (index) => GestureDetector(
            onTap: (){
              log('index:${index+1}');
            },
            child: SizedBox(
                width: int.parse(
                    "${(index+1)}") *
                    50,
                // height: 27,
                child: MainMath.getTheBox(
                    countOfBalls: int.parse(
                        "${index+1}"))),
          )),
        ),
      )

    ],));
  }

}
class ConnectionPainter extends CustomPainter {
  final Offset? firstPosition;
  final Offset? secondPosition;

  ConnectionPainter(this.firstPosition, this.secondPosition);

  @override
  void paint(Canvas canvas, Size size) {
    if (firstPosition != null && secondPosition != null) {
      final paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(firstPosition!, secondPosition!, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}