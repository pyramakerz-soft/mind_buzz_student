import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/widgets/stroke_text.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../click_the_sound/pages/click_the_sound_game.dart';

class ItemCardWidget extends StatelessWidget {
  final void Function()? onTap;
  final GameImagesModel body;
  final int index;
  final int id;

  const ItemCardWidget(
      {Key? key,
      required this.body,
      this.onTap,
      required this.index,
      required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      // Data is the value this Draggable stores.
      data: id,

      feedback: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child:  CachedNetworkImage(
            imageUrl:body.image!,
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) =>
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
            // height: ,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl:body.image!,
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(),
              ),
              errorWidget: (context, url, error) =>
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
              // height: ,
            ),
          ),
        ),
      ),
    );
  }
}
