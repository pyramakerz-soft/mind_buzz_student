import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../page/home_parent_screen.dart';
import '../page/home_screen.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/utils.dart';

PreferredSizeWidget switchBar(
    {required BuildContext context, required int isStudent}) {
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
        leadingWidth: 52,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: Navigator.canPop(context),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.42),
                  color: AppColor.whiteRed),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          isStudent == 1 ? 'Student Account' : 'Parent Account',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                // height: 0,
                // letterSpacing: 0.44,
                fontSize: 22,
              ),
        ),
        actions: [
          ToggleSwitch(
              minWidth: 35.0,
              cornerRadius: 8.0,
              minHeight: 35,
              activeBgColors: const [
                [AppColor.darkBlueColor],
                [AppColor.darkBlueColor]
              ],
              inactiveBgColor: AppColor.lightGreyColor,
              // inactiveFgColor: Colors.white,
              initialLabelIndex: isStudent,
              totalSwitches: 2,
              radiusStyle: true,
              onToggle: (index) {
                context.read<WhoAmICubit>().addToSelected(newIndex: index ?? 0);
              },
              customWidgets: [
                SvgPicture.asset(isStudent == 0
                    ? AppSvgImages.iconSelectedParent
                    : AppSvgImages.iconUnSelectedParent),
                SvgPicture.asset(isStudent == 1
                    ? AppSvgImages.iconSelectedStudent
                    : AppSvgImages.iconUnSelectedStudent),
              ]),
          24.pw,
        ],
      ),
    ),
  );
}
