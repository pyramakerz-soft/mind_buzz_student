import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

class ClickTheSoundGame extends StatelessWidget {
  const ClickTheSoundGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final stateOfCurrentGamePhoneticsCubit = context.watch<CurrentGamePhoneticsCubit>().state;
     return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: (15 + 50), top: 50),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.width - (130 + 50 + 130),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColorPhonetics.boarderColor, width: 5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              8,
              (index) => GestureDetector(
                onTap: (){
                  print('Clicked!');
                                        //TalkTts.startTalk(text: gameData.gameImages?[index].word ?? '');

                  },
                  child: CustomBubblePaint())),
        ),
      ),
    );
  }
}



class CustomBubblePaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(59, 59),
          painter: _BubblePainter(),
        ),
        Text("a")
      ],
    );
  }
}

class _BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Path for the first element (id="Vector")
    paint.color = Color(0xFFEEFCFF);
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    canvas.drawPath(path, paint);

    // Path for the second element (id="Vector_2")
    paint.color = Color(0xFFBEC3FC);
    path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 0.25));
    path = Path.combine(PathOperation.difference, path, path);
    canvas.drawPath(path, paint);

    // Path for the third element (id="Vector_3")
    paint.color = Color(0xFFDFD2E9);
    path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 2.25));
    canvas.drawPath(path, paint);

    // Path for the fourth element (id="Vector_4")
    paint.color = Color(0xFF0D81EA).withOpacity(0.4);
    path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 1.62789));
    path = Path.combine(PathOperation.difference, path, path);
    canvas.drawPath(path, paint);

    // Path for the fifth element (id="Vector_5")
    paint.color = Color(0xFFD2E2F9);
    path = Path()
      ..moveTo(size.width / 2, size.height / 2 - 27)
      ..lineTo(size.width / 2 - 12.5, size.height / 2 - 15)
      ..lineTo(size.width / 2, size.height / 2 + 9)
      ..close();
    canvas.drawPath(path, paint);

    // Path for the sixth element (id="Vector_6")
    paint.color = Color(0xFFD2DCF9);
    path = Path()
      ..addRect(Rect.fromLTWH(size.width * 0.87, size.height * 0.32, size.width * 0.1, size.height * 0.1));
    canvas.drawPath(path, paint);

    // Path for the seventh element (id="Vector_7")
    paint.color = Color(0xFFB4B4F9);
    path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width * 0.4, size.height * 0.6), radius: size.width * 0.15));
    canvas.drawPath(path, paint);

    // Path for the eighth element (id="Vector_8")
    paint.color = Color(0xFFD2DCF9);
    path = Path()
      ..moveTo(size.width * 0.1, size.height * 0.6)
      ..lineTo(size.width * 0.15, size.height * 0.6)
      ..lineTo(size.width * 0.1, size.height * 0.65)
      ..close();
    canvas.drawPath(path, paint);

    // Continue adding paths for the rest of the SVG elements
    // ...

    // Path for the ninth element (id="Vector_9")
    paint.color = Colors.white.withOpacity(0.6);
    path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.3)
      ..lineTo(size.width * 0.4, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.3)
      ..close();
    canvas.drawPath(path, paint);

    // Add remaining paths based on the SVG elements
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


