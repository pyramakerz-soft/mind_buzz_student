

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_color.dart';

class DragTargetWidget extends StatelessWidget {
  final String title;
  const DragTargetWidget({Key? key, required this.title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 0.17.sh,
      width: 75.0,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(12.r),
          color:
          AppColor.dragContainerColor,
          border: Border.all(
              width: 2,
              color:
              AppColor.strokeColor)),
      child: Center(
        child: Text(
           title,
          style: TextStyle(
              color:
              AppColor.darkBlueColor,
              fontSize: 0.04.sw,
              fontWeight:
              FontWeight.w900),
        ),
      ),
    );
  }
}
