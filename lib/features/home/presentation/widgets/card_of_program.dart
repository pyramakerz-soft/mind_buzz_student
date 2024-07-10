import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/utils.dart';
import '../../../unit/presentation/manager/bloc/get_unit_bloc.dart';
import '../../../unit/presentation/manager/cubit/animation_unit_cubit.dart';
import '../../../unit/presentation/pages/unit_screen.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

class CardOfProgram extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final String programId;
  final bool isMob;
  final String? mainImage;

  const CardOfProgram(
      {Key? key,
      this.isMob = true,
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
        decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: colors,
            ),
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
        child: isMob
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildColumnOfPlayAndTitle(context),
                  _buildImageOfProgram(context),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageOfProgram(context),
                  _buildRowOfPlayAndTitle(context),
                ],
              ),
      ),
    );
  }

  Widget _buildColumnOfPlayAndTitle(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            10.ph,
            Text(title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.50,
                    )),
          ],
        ),
      ),
    );
  }

  Widget _buildRowOfPlayAndTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                )),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
          10.pw,
          Text(title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.50,
                  )),
        ],
      ),
    );
  }

  Widget _buildImageOfProgram(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        child: CachedNetworkImage(
            imageUrl: mainImage ?? DefaultHomeData.image,
            height: MediaQuery.of(context).size.height / 5,
            errorWidget: (context, url, error) {
              return Image.network(
                DefaultHomeData.image,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
              );
            }),
      ),
    );
  }
}
