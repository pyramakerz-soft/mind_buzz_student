import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/theme_text.dart';
import '../manager/who_am_i_cubit.dart';

class ItemInChoose extends StatelessWidget {
  final String text;
  final String image;
  final int id;

  const ItemInChoose(
      {Key? key, required this.text, required this.image, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<WhoAmICubit>().state;
    return GestureDetector(
      onTap: () {
        context.read<WhoAmICubit>().addToSelected(newIndex: id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.lightBlueColor3,
             boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // Shadow color with opacity
            offset: Offset(0, 4), // Shadow position
            blurRadius: 14, // Shadow blur radius
          ),
        ],
            gradient: currentIndex == id
                ? AppColor.gradientColor1
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:0),
              child: Text(
                text,
                style: currentIndex == id
                    ? Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 30,
                         // fontWeight: FontWeight.w700,
                          fontFamily: AppTheme.getFontFamily5(),
                        )
                    : Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 30,
                         // fontWeight: FontWeight.w700,
                          fontFamily: AppTheme.getFontFamily5(),
                        ),
              ),
            ),
            Spacer(),
            Image.asset(
              image,
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
