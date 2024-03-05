import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/assets_images.dart';

class ItemCardWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Widget body;

  const ItemCardWidget(
      {Key? key, this.width, this.height, required this.body, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width ?? 56,
        height: height ?? 89.85,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppImages.iconBoarderOfChar, fit: BoxFit.fitWidth, width: width,height:height),
           body
          ],
        ),
      ),
    );
  }
}
