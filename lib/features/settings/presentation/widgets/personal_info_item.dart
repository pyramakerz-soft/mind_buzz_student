

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';


class PersonalInfoItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final bool isPassword;
  const PersonalInfoItem({Key? key, required this.title , required this.icon , required this.value,
  this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical :10.h,horizontal: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon,height: 0.028.sh,),
          15.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColor.lightGreyColor3)),
              SizedBox(
                width: 0.7.sw,
                child: Text(value,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: isPassword ? AppColor.darkGreyText : Colors.black)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
