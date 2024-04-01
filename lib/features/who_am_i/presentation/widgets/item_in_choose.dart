import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.lightBlueColor3,
            gradient: currentIndex == id
                ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColor.darkBlueColor4,
                      AppColor.darkBlueColor5,
                      AppColor.darkBlueColor6
                    ],
                  )
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              text,
              style: currentIndex == id
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 22, fontWeight: FontWeight.w700)
                  : Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
            ),
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
