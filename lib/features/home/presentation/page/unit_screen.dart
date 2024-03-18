import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';

class UnitScreen extends StatelessWidget {
  final String programId;

  const UnitScreen({Key? key, required this.programId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.imageAppBarOfUnits),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
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
                            color: AppColor.darkBlueColor3
                          ),
                          child: SvgPicture.asset(AppImages.iconHome, fit: BoxFit.fill,color: Colors.white,))),

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
                              color: AppColor.darkBlueColor3
                          ),
                          child: SvgPicture.asset(AppImages.iconAnalysis, fit: BoxFit.fill,color: Colors.white,)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
