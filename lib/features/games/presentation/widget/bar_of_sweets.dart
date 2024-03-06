import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_images.dart';
import '../../domain/entities/data_game_model.dart';

class BarOfSweets extends StatelessWidget {
  final int? countOfRepeatQuestion;
  final DataGameModel? currentDataGame;
  const BarOfSweets({Key? key, required this.countOfRepeatQuestion, required this.currentDataGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final countOfMain = currentDataGame?.game?.numOfTrials ?? 0;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset(
          AppImages.iconCoverOfSweet,
          width: (countOfMain * (21)) + 10,
          height: 30,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: (countOfMain * (21)) + 10,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                    int.parse("$countOfRepeatQuestion"),
                    (index) => Row(
                          children: [
                            5.pw,
                            Image.asset(
                              AppImages.imageHeart,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        )),
                ...List.generate(
                    int.parse("${countOfMain - (int.parse("$countOfRepeatQuestion"))}"),
                    (index) => Row(
                          children: [
                            5.pw,
                            Image.asset(
                              AppImages.imageSolidHeart,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ))
              ]),
        )
      ],
    );
  }
}
