import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

class CardOfProgram extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final String mainImage;

  const CardOfProgram(
      {Key? key,
      required this.colors,
      required this.title,
      required this.mainImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: colors,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: AppColor.greyColor.withOpacity(.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                10.ph,
                Text(title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.50,
                        )),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20)),
            child: Image.asset(
              mainImage,
              height: MediaQuery.of(context).size.height / 5,
            ),
          )
        ],
      ),
    );
  }
}
