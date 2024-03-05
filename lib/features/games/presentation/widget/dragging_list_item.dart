import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final String photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: SvgPicture.asset(
              photoProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
