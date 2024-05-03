import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_color.dart';
import '../../core/parent_assets.dart';

class NavigationBarSingleElement extends StatelessWidget {
  final bool current;
  final String selectedIcon;
  final String icon;
  final String title;
  const NavigationBarSingleElement({Key? key, this.current = false,
  required this.title , required this.icon , required this.selectedIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return current
        ? Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              selectedIcon,
            ),
          )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: size.height * 0.013),
            )
          ],
        );
  }
}
