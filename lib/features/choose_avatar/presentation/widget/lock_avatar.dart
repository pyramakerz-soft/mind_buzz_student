import 'package:flutter/material.dart';

import '../../../../core/assets_images.dart';

class LockAvatar extends StatelessWidget{

  final String avatar;

  const LockAvatar({Key? key, required this.avatar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Opacity(
            opacity: .5,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(avatar),
                  Image.asset(AppImages.lockImage, height: MediaQuery.of(context).size.height/5,),
                ],
              ),
            )));
  }

}