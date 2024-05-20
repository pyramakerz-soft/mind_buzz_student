import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_color.dart';

class SingleElement extends StatelessWidget {
  final VoidCallback onTap;
  final String background;
  final bool selected;
  final String image;
  final int index;
  const SingleElement(
      {Key? key,
      required this.onTap,
      required this.background,
      required this.selected,
      required this.image,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - (130 + 50 + 130)) / 6,
        height: 120.h,
        padding: EdgeInsets.only(bottom: index%2 == 0 ? 30:0),
        child: Stack(
          children: [
            Image.asset(
              background,
              width: (MediaQuery.of(context).size.width - (130 + 50 + 130)) / 6,
              height: 120.h,
              color: selected ? AppColor.selectedColor : null,
            ),
            CachedNetworkImage(
              imageUrl: image,
              width: (MediaQuery.of(context).size.width - (130 + 50 + 130)) / 6,
              height: 120.h,
              // height: ,
            ),
          ],
        ),
      ),
    );
  }
}
