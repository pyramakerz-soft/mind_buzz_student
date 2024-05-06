import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/shimmer_loading.dart';
import '../../../../core/app_color.dart';
import '../../../../core/parent_assets.dart';

class UserHeader extends StatelessWidget {
  final String name;
  final String school;
  final String? image;

  const UserHeader(
      {Key? key, required this.name, required this.school, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image ?? ParentImages.defaultUserImage,
          height: 0.08.sh,
        ),
        10.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black)),
            Text(school,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColor.lightGreyColor3)),
          ],
        ),
      ],
    );
  }
}
