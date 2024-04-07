import 'package:flutter/material.dart';

import '../../../../../../core/math/main_math.dart';


class CardOfAnswer extends StatelessWidget {
  final int number;
  const CardOfAnswer({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: MainMath.colorOfCard(number: number), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
