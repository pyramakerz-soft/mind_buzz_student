import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class ItemCardWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final void Function()? onTap;
  final String body;

  const ItemCardWidget(
      {Key? key, required this.maxWidth, required this.maxHeight, required this.body, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Container(
        width: maxWidth/3,
        height: maxHeight/3,
        // padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 36),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.87, color: Color(0xFF91D4F0)),
          ),
        ),
        alignment: Alignment.center,
        child: StrokeText(
          text: body,
          textStyle: TextStyle(
              fontSize: 50
          ),
        ),
      ),
    );
  }
}
