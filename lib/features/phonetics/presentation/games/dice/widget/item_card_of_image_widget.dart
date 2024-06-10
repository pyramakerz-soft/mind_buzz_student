import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/games_structure/phonetics/phonetics_color.dart';
import '../../../../../../core/widgets/stroke_text.dart';
import '../../click_the_sound/pages/click_the_sound_game.dart';

class ItemCardOfImageWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final void Function()? onTap;
  final String body;
  final bool? hide;
  final int index;
  final int countOfImages;

   ItemCardOfImageWidget(
      {Key? key,
      required this.maxWidth,
      this.hide,
      required this.maxHeight,
      required this.body,
      required this.countOfImages,
      this.onTap,
      required this.index})
      : super(key: key){

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth ,
      height: maxHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: maxWidth ,
              height: maxHeight,
              // padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 36),
              decoration: BoxDecoration(
                color: Colors.white,
                // shape: RoundedRectangleBorder(
                //   side: BorderSide(width: 2, Color(0xFF91D4F0)),
                // ),
                border: countOfImages/4==4?
                Border(
                  right:
                      (index != 3 && index != 7 && index != 11 && index != 15)
                          ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                          : const BorderSide(color: Colors.white),
                  left: (index != 0 && index != 4 && index != 8 && index != 12)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  top: (index != 0 && index != 1 && index != 2 && index != 3)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  bottom:
                      (index != 15 && index != 14 && index != 13 && index != 12)
                          ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                          : const BorderSide(color: Colors.white),
                )
                    :Border(
                  right:
                  (index != 4 && index != 9 && index != 14 && index != 19)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  left: (index != 0 && index != 5 && index != 10 && index != 15)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  top: (index != 0 && index != 1 && index != 2 && index != 3&& index != 4)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  bottom:
                  (index != 15 && index != 16 && index != 17 && index != 18&& index != 19)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                ),
              ),
              alignment: Alignment.center,
              child: (hide == true)
                  ? Container(
                      width: maxWidth ,
                      height: maxHeight,
                      color: Colors.white,
                    )
                  : CachedNetworkImage(
                      imageUrl: body,

                      // isDisabled: false,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
