import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';

import 'assets_images.dart';
import 'assets_sound.dart';

class Utils {
  static void navigateTo(Widget screen, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static void navigateAndRemoveUntilTo(Widget child, BuildContext context,
          {bool rootNavigator = false}) async =>
      Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => child,
          ),
          (route) => false);

  static void navigateToAndReplacement(Widget child, BuildContext context) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => child));

  static void showCustomBottomSheet(
    Widget child,
    BuildContext context,
  ) =>
      showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: child,
        ),
      );

  static stateOfCurrentStar({required int count}) {
    switch (count) {
      case 0:
        return AppImages.iconEmptyStar;
      case 1:
        return AppImages.iconStarLayer1;
      case 2:
        return AppImages.iconStarLayer2;
      case 3:
        return AppImages.iconStarLayer3;
      case 4:
        return AppImages.iconStarLayer4;
      case 5:
        return AppImages.iconStar;
    }
  }

  static isLargeScreen({required BuildContext context}) {
    return MediaQuery.of(context).size.shortestSide > 700;
  }

}
