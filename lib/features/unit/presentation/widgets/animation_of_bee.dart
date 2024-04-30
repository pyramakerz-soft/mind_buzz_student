import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_svg_images.dart';
import '../manager/cubit/animation_unit_cubit.dart';

class AnimationOfBee extends StatelessWidget{
  const AnimationOfBee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        height: 50,
        child: GestureDetector(onTap: () {
          context
              .read<AnimationUnitCubit>()
              .animationBee1Avatar(isTwo: true);
        }, child: BlocBuilder<AnimationUnitCubit,
            AnimationUnitInitial>(
          builder: (context, state) {
            return state.beeArtboard2 == null
                ? SvgPicture.asset(AppSvgImages.iconUnitBee)
                : Container(
                margin: const EdgeInsets.only(
                    left: 0, bottom: 3),
                child: Transform.flip(
                  flipX: true,
                  child: Rive(
                    artboard: state.beeArtboard2!,
                    // fit: BoxFit.fitHeight,
                    behavior : RiveHitTestBehavior.opaque,
                    useArtboardSize: true,
                  ),
                ));
          },
        )));
  }

}