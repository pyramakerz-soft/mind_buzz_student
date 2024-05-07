import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../manager/cubit/animation_unit_cubit.dart';

class AnimationOfBee3 extends StatelessWidget {
  const AnimationOfBee3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        width: 75,
        child: GestureDetector(
            onTap: () {
              context.read<AnimationUnitCubit>().animationBeeWithWaterAvatar();
            },
            child: Stack(children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BlocBuilder<AnimationUnitCubit, AnimationUnitInitial>(
                    builder: (context, state) {
                      return state.beeWaterArtboard == null
                          ? Image.asset(
                              AppImages.iconWaterBee,
                              height: 120,
                              // fit: BoxFit.fill,
                            )
                          : Rive(
                              artboard: state.beeWaterArtboard!,
                              // fit: BoxFit.fitHeight,
                              useArtboardSize: true,
                            );
                    },
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    AppImages.iconFlowers,
                    height: 50,
                  ))
            ])));
  }
}
