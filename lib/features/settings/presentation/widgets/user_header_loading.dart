import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/widgets/shimmer_loading.dart';


class UserHeaderLoading extends StatelessWidget {
  const UserHeaderLoading({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

          // CustomShimmer(
          //     height: 0.08.sh, width: 0.08.sh, shape: BoxShape.circle),
        SizedBox(
          width: 10.w,
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomShimmer(
              //     height: 0.03.sh, width: 0.3.sh, shape: BoxShape.rectangle),
              SizedBox(
                height: 5.h,
              ),
              // CustomShimmer(
              //     height: 0.02.sh, width: 0.2.sh, shape: BoxShape.rectangle),
            ],
          ),
      ],
    );
  }
}
