import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/phonetics/assets_images_phonetics.dart';

class CupWidget extends StatelessWidget {
  final String image;

  const CupWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11),
      height: (MediaQuery.of(context)
          .size
          .height -
          (50)) /
          4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppImagesPhonetics.sortingCup,
            width: MediaQuery.of(context).size.width/12,
            fit: BoxFit.fill,
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
