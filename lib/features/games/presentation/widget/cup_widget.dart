import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/vars.dart';
import '../../domain/entities/data_game_model.dart';
import '../../domain/entities/game_letters_model.dart';

class CupWidget extends StatelessWidget {
  final String image;
  final List<GameLettersModel> cardsLetters;
  final DataGameModel? currentDataGame;
  const CupWidget({Key? key, required this.image, required this.cardsLetters, this.currentDataGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cardsLetters =
    //     context.select((Game1Provider value) => value.cardsLetters);
    //
    // final currentDataGame =
    //     context.select((Game1Provider value) => value.currentGameData?.data);
    final numOfLetterRepeat = currentDataGame?.game?.numOfLetterRepeat ?? 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/6,
            width: MediaQuery.of(context).size.width/8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...List.generate(
                  numOfLetterRepeat,
                  (index) => Visibility(
                    visible: cardsLetters
                            .where((element) =>
                                element.hide == true &&
                                (element.letter ?? '') == image)
                            .toList()
                            .length ==
                        (index+1),
                    child: SvgPicture.asset(
                      PaperImages.paper[index],
                      width: MediaQuery.of(context).size.width/8-20,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                // 15.ph
              ],
            ),
          ),
          SvgPicture.asset(
            AppImages.iconCup,
            width: MediaQuery.of(context).size.width/8,
            fit: BoxFit.fitWidth,
          ),
          Text(
            image,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 50, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
