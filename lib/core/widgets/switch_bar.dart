import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../features/home/presentation/page/home_parent_screen.dart';
import '../../features/home/presentation/page/home_screen.dart';
import '../app_color.dart';
import '../assets_svg_images.dart';
import '../utils.dart';

PreferredSizeWidget switchBar(
    {required BuildContext context, required bool isStudent}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColor.lightGreyColor,
          offset: Offset(1, 1.0),
          blurRadius: 5.0,
        )
      ]),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          isStudent == true?'Student Account':'Parent Account',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.lightGreyColor),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {

                    if(isStudent==true){
                      Utils.navigateAndRemoveUntilTo(const HomeParentScreen(), context);

                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isStudent != true
                            ? AppColor.darkBlueColor
                            : AppColor.lightGreyColor),
                    padding: const EdgeInsets.all(9),
                    child: SvgPicture.asset(isStudent!=true?AppSvgImages.iconSelectedParent:AppSvgImages.iconUnSelectedParent),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(isStudent!=true){
                      Utils.navigateAndRemoveUntilTo(const HomeScreen(), context);

                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isStudent == true
                            ? AppColor.darkBlueColor
                            : AppColor.lightGreyColor),
                    padding: const EdgeInsets.all(9),
                    child: SvgPicture.asset(isStudent == true?AppSvgImages.iconSelectedStudent:AppSvgImages.iconUnSelectedStudent),
                  ),
                ),
              ],
            ),
          ),
          24.pw,
        ],
      ),
    ),
  );
}
