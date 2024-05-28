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
  final double? width;
  final double? height;
  const SingleElement(
      {Key? key,
      required this.onTap,
      required this.background,
      required this.selected,
      required this.image,
      this.height,
      this.width,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: (){
      },
      child: Container(
        width: width??(MediaQuery.of(context).size.width - (130 + 50 + 130)) / 6,
        height: height??120.h,
        padding: EdgeInsets.only(bottom: index%2 == 0 ? 30:0),
        child: Stack(
          children: [
            Image.asset(
              background,
              width: width==null?(MediaQuery.of(context).size.width - (130 + 50 + 130)) / 6:((width??1)+20),
              height: height == null?120.h:((height??1)+20),
              color: selected ? AppColor.selectedColor : null,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: width??(MediaQuery.of(context).size.width - (130 + 50 + 130)) / 7,
                height: height??100.h,
                // height: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
