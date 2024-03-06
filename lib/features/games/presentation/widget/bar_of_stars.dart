import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../domain/entities/data_game_model.dart';
import '../../domain/entities/game_letters_model.dart';
import 'star_animation/add_to_cart_icon.dart';

class BarOfStars extends StatelessWidget {
  const BarOfStars({Key? key, required this.cartKey, required this.cardsLetters,required this.currentDataGame}) : super(key: key);
  final GlobalKey<CartIconKey> cartKey;
  final List<GameLettersModel> cardsLetters;
  final DataGameModel? currentDataGame;
  @override
  Widget build(BuildContext context) {

    final gameLetters = currentDataGame?.gameLetters ?? [];
    return AddToCartIcon(
        key: cartKey,
        badgeOptions: BadgeOptions(
          active: false,
          width: ((gameLetters.length) * (28)) + 10,
          height: 30,
        ),
        icon: Stack(
          alignment: Alignment.centerRight,
          children: [
            Image.asset(
              AppImages.iconCoverOfStar,
              width: ((gameLetters.length) * (32)) + 10,
              height: 30,
              fit: BoxFit.fitWidth,
            ),
            Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...List.generate(
                      int.parse('${gameLetters.length}'),
                      (index) => Row(
                            children: [
                                SvgPicture.asset(
                              Utils.stateOfCurrentStar(count: cardsLetters
                                  .where((element) =>
                              element.letter ==
                                  gameLetters[index].letter &&
                                  element.hide == true)
                                  .toList().length),
                                  // AppImages.iconStar,
                                  height: 20,
                                  width: 20,
                                ),
                              7.pw,
                            ],
                          )),
                ]),
          ],
        ));
  }
}
