import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_svg_images.dart';

enum EmptyScreenTypes {
  emptyAssignments,
  emptySearch,
  emptyScreen,
  genericError,
  emptyNotifications,
}

class CustomEmptyWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String? iconName;
  final Widget? actionWidget;
  final EmptyScreenTypes? emptyScreenTypes;

  const CustomEmptyWidget(
      {super.key,
      required this.title,
      this.description,
      this.iconName,
      this.actionWidget,
      this.emptyScreenTypes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (emptyScreenTypes != null)
          SvgPicture.asset(emptyScreenTypes == EmptyScreenTypes.emptySearch
              ? AppSvgImages.emptyAssignments
              : emptyScreenTypes == EmptyScreenTypes.emptyScreen
                  ? AppSvgImages.emptyAssignments
                  : emptyScreenTypes == EmptyScreenTypes.genericError
                      ? AppSvgImages.emptyAssignments
                      : emptyScreenTypes == EmptyScreenTypes.emptyAssignments
                          ? AppSvgImages.emptyAssignments
                          : emptyScreenTypes ==
                                  EmptyScreenTypes.emptyNotifications
                              ? AppSvgImages.emptyNotifications
                              : AppSvgImages.emptyAssignments)
        else
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              // color: AppColor.primary.withOpacity(.16),
              color: AppColor.darkBlueColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              iconName ?? AppSvgImages.emptyAssignments,
              color: AppColor.darkBlueColor,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            // emptyScreenTypes == EmptyScreenTypes.emptyList ? "Empty List" : title,
            title,
            style: const TextStyle(
                color: AppColor.darkBlueColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 28),
          child: Text(
            description ?? '',
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 14, color: AppColor.lightGreyColor4),
          ),
        ),
        actionWidget ?? const SizedBox(),
      ],
    );
  }
}
