import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/utils.dart';
import '../../../unit/presentation/manager/bloc/get_unit_bloc.dart';
import '../../../unit/presentation/manager/cubit/animation_unit_cubit.dart';
import '../../../unit/presentation/pages/unit_screen.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

class CardOfProgramParent extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final String programId;
  final String? mainImage;

  const CardOfProgramParent(
      {Key? key,
      required this.colors,
      required this.title,
      required this.programId,
      required this.mainImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.navigateTo(
            BlocProvider(
                create: (_) => AnimationUnitCubit(),
                child: UnitScreen(
                  programId: programId,
                  programName: title,
                )),
            context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - (16 * 2),
        height: MediaQuery.of(context).size.height / 5,
        decoration: ShapeDecoration(
            color: AppColor.lightGreyColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.greyColor.withOpacity(.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 5),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.50,
                    )),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: CachedNetworkImage(
                  imageUrl: mainImage ?? DefaultHomeData.image,
                  height: MediaQuery.of(context).size.height / 8,
                  errorWidget: (context, url, error) {
                    return Image.network(
                      DefaultHomeData.image,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 8,
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
