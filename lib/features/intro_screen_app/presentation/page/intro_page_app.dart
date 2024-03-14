import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/assets_images.dart';

class IntroScreenApp extends StatefulWidget {
  const IntroScreenApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreenApp();
  }
}

class _IntroScreenApp extends State<IntroScreenApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            AppColor.lightBlueColor2,
            AppColor.lightBlueColor8,
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              AppImages.imageSkyIntroApp,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Image.asset(
              AppImages.mindBuzzImage,
              width: MediaQuery.of(context).size.width/1.3,
            ),
          ),
          Center(
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(-(200 * (1 - _animation.value)),0 ),
                    child: Opacity(
                        opacity: _animation.value,
                        child: Image.asset(AppImages.imageIntroBee)),
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              AppImages.imageGardenIntroApp,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
      // child: Stack(
      //   children: [
      //     Image.asset(
      //       AppImages.imageScreen1,
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //       fit: BoxFit.fill,
      //     ),
      //     Center(
      //       child: AnimatedBuilder(
      //           animation: _animation,
      //           builder: (context, child) {
      //             return Transform.translate(
      //               offset: Offset(-(200 * (1 - _animation.value)),0 ),
      //               child: Opacity(
      //                   opacity: _animation.value,
      //                   child: Image.asset(AppImages.introBee)),
      //             );
      //           }),
      //     )
      //   ],
      // ),
    );
  }
}
