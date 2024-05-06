import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key,required this.height,required this.width,required this.shape}) : super(key: key);
  final double height;
  final double width;
  final BoxShape shape;
  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style:  SkeletonAvatarStyle(
        width: width,
        height: height,
        shape: shape,
        borderRadius: BorderRadius.circular(14.r),
        padding:  const EdgeInsets.symmetric(
            vertical: 5.0, horizontal: 0),
      ),
    );
  }
}
