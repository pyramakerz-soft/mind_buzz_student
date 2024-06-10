// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.image,
    this.height,
  }) : super(key: key);
  final String? image;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 30.h,
            backgroundColor: Colors.white,
            backgroundImage: _isFilePath(image!)
                ? FileImage(File(image!))
                : NetworkImage(image!) as ImageProvider,
          )
        : Image.asset(
            'assets/images/default_user_image.png',
            height: height ?? 0.08.sh,
          );
  }

  bool _isFilePath(String path) {
    return File(path).existsSync();
  }
}
