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
    {required BuildContext context,  String? title}) {
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
      child: Column(
        children: [
          AppBar(
            leadingWidth: 52,
            backgroundColor: Colors.white,
            leading: (Navigator.canPop(context))
                ? Container(
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
                  )
                : null,
            title: Text(
              context.watch<WhoAmICubit>().state == 1 ? 'Student Account' : title ?? 'Parent Account',
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
                  initialLabelIndex: context.watch<WhoAmICubit>().state,
                  totalSwitches: 2,
                  radiusStyle: true,
                  onToggle: (index) {
                    context
                        .read<WhoAmICubit>()
                        .addToSelected(newIndex: index ?? 0);
                  },
                  customWidgets: [
                    SvgPicture.asset(context.watch<WhoAmICubit>().state == 0
                        ? AppSvgImages.iconSelectedParent
                        : AppSvgImages.iconUnSelectedParent),
                    SvgPicture.asset(context.watch<WhoAmICubit>().state == 1
                        ? AppSvgImages.iconSelectedStudent
                        : AppSvgImages.iconUnSelectedStudent),
                  ]),
              24.pw,
            ],
          ),
        ],
      ),
    ),
  );
}


PreferredSizeWidget customAppBar(
    {required BuildContext context, required String title, Widget? action, IconData? backIcon}) {
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
      child: Column(
        children: [
          AppBar(
            leadingWidth: 52,
            backgroundColor: Colors.white,
            leading: (Navigator.canPop(context))
                ? Container(
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
                  child:  Icon(backIcon ?? Icons.arrow_back),
                ),
              ),
            )
                : null,
            title: Row(
              children: [
                Text(title ,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    // height: 0,
                    // letterSpacing: 0.44,
                    fontSize: 22,
                  ),
                ),
                Spacer(),
                action?? 0.pw,
              ],
            ),

          ),
        ],
      ),
    ),
  );
}
