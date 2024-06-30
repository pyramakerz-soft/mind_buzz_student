import 'package:flutter/material.dart';

import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/theme_text.dart';

class ItemInChooseParent extends StatelessWidget {
  final String text;
  final String image;
  final int id;
  final Function()? onItemPressed;

  const ItemInChooseParent(
      {Key? key,
      required this.text,
      required this.image,
      required this.id,
      required this.onItemPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemPressed,
      borderRadius:
          BorderRadius.circular(20), // Matches the container's border radius
      splashColor:
          Colors.blue.withOpacity(0.2), // Customize the splash color if desired
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.lightBlueColor3,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.15), // Shadow color with opacity
              offset: Offset(0, 4), // Shadow position
              blurRadius: 14, // Shadow blur radius
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            FittedBox(
              child: Text(
                text,
                style:
                    // isSelected
                    //     ? Theme.of(context).textTheme.bodySmall?.copyWith(
                    //           fontSize: 30,
                    //           // fontWeight: FontWeight.w700,
                    //           fontFamily: AppTheme.getFontFamily5(),
                    //         ) :
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 30,
                          // fontWeight: FontWeight.w700,
                          fontFamily: AppTheme.getFontFamily5(),
                        ),
              ),
            ),
            const Spacer(),
            Image.asset(
              image,
              height: 112,
              width: 129,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
