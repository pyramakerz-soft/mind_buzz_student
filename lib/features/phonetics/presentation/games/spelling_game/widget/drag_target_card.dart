

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_color.dart';

class DragTargetWidget extends StatelessWidget {
  const DragTargetWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return   DragTarget<int>(
      builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
          ) {
        return Container(
          height: 0.15.sh,
          width: 70.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.strokeColor),
            color: AppColor.dragContainerColor
          ),
          child: Center(
            child: Text(''),
          ),
        );
      },
      onAcceptWithDetails: (DragTargetDetails<int> details) {

      },
    );
  }
}
