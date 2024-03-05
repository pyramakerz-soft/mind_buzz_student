import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';

class RepeatQuestionPopUp extends StatelessWidget {
  final void Function() onTap;
  const RepeatQuestionPopUp({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [
                  AppColor.lightBlueColor5,
                  AppColor.lightBlueColor6,
                  AppColor.lightBlueColor7,
                ]),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                      color:Colors.black12
                  )
                ]
              ),
              child: Text(
                'Try again',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ));
  }
}
