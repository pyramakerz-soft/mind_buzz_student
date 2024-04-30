import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_svg_images.dart';
import '../manager/cubit/animation_unit_cubit.dart';

class AnimationOfBee4 extends StatelessWidget{
  const AnimationOfBee4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationUnitCubit,
        AnimationUnitInitial>(
        builder: (context, state) {
          return state.beeArtboard3==null?SizedBox():Rive(
            artboard: state.beeArtboard3!,
            // fit: BoxFit.fitHeight,
            useArtboardSize: true,
          );
        });
  }

}