import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final String image;

  const StarWidget({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 10,
      width: 10,
    );
  }
}
