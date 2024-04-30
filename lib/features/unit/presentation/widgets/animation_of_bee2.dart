import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_svg_images.dart';
import '../manager/cubit/animation_unit_cubit.dart';

class AnimationOfBee2 extends StatelessWidget{
  const AnimationOfBee2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: 100,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
              bottom: 50,
              left: 0,
              child: BlocBuilder<AnimationUnitCubit,
                  AnimationUnitInitial>(
                builder: (context, state) {
                  return state.treeArtboard == null
                      ? GestureDetector(
                      onTap: () {
                        context
                            .read<AnimationUnitCubit>()
                            .animationTreeAvatar();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 125, left: 19),
                        child: SvgPicture.asset(
                          AppSvgImages.iconTree,
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                      ))
                      : SizedBox(
                    height: 300,
                    width: 300,
                    child: Rive(
                      artboard: state.treeArtboard!,
                      fit: BoxFit.fill,
                      useArtboardSize: true,
                    ),
                  );
                },
              )),
        ]));
  }

}