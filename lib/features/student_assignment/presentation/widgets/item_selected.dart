import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';

class ItemSelected extends StatelessWidget {
  final String itemId;
  final String title;
  void Function() onTap;
  final bool currentItemSelected;

   ItemSelected(
      {Key? key,
      required this.itemId,
      required this.title,
      required this.onTap,
        required this.currentItemSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: currentItemSelected
                ? AppColor.darkBlueColor
                : AppColor.lightGreyColor),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: AppTheme.getFontFamily4(),
            color: currentItemSelected ? Colors.white:AppColor.lightGreyColor3
          ),
        ),
      ),
    );
  }
}
