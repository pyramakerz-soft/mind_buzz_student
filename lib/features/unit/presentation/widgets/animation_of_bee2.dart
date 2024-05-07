import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../manager/cubit/animation_unit_cubit.dart';

class AnimationOfBee2 extends StatelessWidget {
  const AnimationOfBee2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: GestureDetector(onTap: () {
          context.read<AnimationUnitCubit>().animationBee1Avatar();
        }, child: BlocBuilder<AnimationUnitCubit, AnimationUnitInitial>(
          builder: (context, state) {
            return state.beeArtboard1 == null
                ? Image.asset(AppImages.iconUnitBee)
                : Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 3),
                    child: Transform.flip(
                      flipX: true,
                      child: Rive(
                        artboard: state.beeArtboard1!,
                        // fit: BoxFit.fitHeight,
                        useArtboardSize: true,
                      ),
                    ));
          },
        )));
  }
}
