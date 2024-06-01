import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

class SwitchTitle extends StatelessWidget{
  final String title;
  final int index;
  final int currentIndex;
  final void Function() onTap;

  const SwitchTitle({Key? key, required this.title, required this.index, required this.onTap, required this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: onTap,
    child: Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: ShapeDecoration(
        color: index == currentIndex ? AppColor.darkBlueColor:AppColor.whiteRed3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: index == currentIndex ?Colors.white:Colors.grey,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    ));
  }

}