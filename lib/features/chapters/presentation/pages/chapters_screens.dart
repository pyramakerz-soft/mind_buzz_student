import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';

import '../../../../core/app_color.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bgChapters))),
        child: Column(children: [
          SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.darkBlueColor3),
                          child: SvgPicture.asset(
                            AppImages.iconHome,
                            fit: BoxFit.fill,
                            color: Colors.white,
                          ))),
                  Text(
                    'Chapters',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.darkBlueColor3),
                          child: SvgPicture.asset(
                            AppImages.iconAnalysis,
                            fit: BoxFit.fill,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,

              child: Image.asset(AppImages.halfBee)),

        ]),
      ),
    );
  }
}
