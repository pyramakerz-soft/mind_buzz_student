import 'dart:developer';

import 'package:flame/extensions.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/extensions.dart';
import '../../../../core/assets_animation.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../../core/vars.dart';
import '../../../chapters/presentation/manager/journey_bar_cubit.dart';
import '../../../chapters/presentation/pages/chapters_screens.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/get_unit_bloc.dart';
import '../widgets/animation_of_bee.dart';
import '../widgets/animation_of_bee2.dart';
import '../widgets/animation_of_bee5.dart';
import '../widgets/animation_of_tree.dart';
import '../widgets/animation_of_bee3.dart';
import '../widgets/animation_of_bee4.dart';
import '../widgets/item_of_unit.dart';

class UnitScreen extends StatelessWidget {
  final String programId;
  final String programName;

  const UnitScreen(
      {Key? key, required this.programId, required this.programName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final width = (MediaQuery.of(context).size.width / 2) + 50;
    final width = (MediaQuery.of(context).size.width / 2) - 10;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.bgChooseWhoAmI,
                                  color: AppColor.skyBlueColor,
                                  width: MediaQuery.of(context).size.width - 70,
                                ),
                                const Positioned(
                                  top: -30,
                                  left: 0,
                                  child: SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: RiveAnimation.asset(
                                      AppAnimation.cloudRive,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 170,
                                    width: 170,
                                    child: RiveAnimation.asset(
                                      AppAnimation.cloudRive,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 25,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(9),
                                                alignment: Alignment.center,
                                                height: 42,
                                                width: 42,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color:
                                                        AppColor.darkBlueColor),
                                                child: SvgPicture.asset(
                                                  AppSvgImages.iconHome,
                                                  fit: BoxFit.fill,
                                                ))),
                                      ),
                                      20.pw,
                                      Container(
                                        width: 0.65.sw,
                                        child: Text(
                                          programName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: AppColor.darkBlueColor,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w700,
                                                fontFamily:
                                                    AppTheme.getFontFamily5(),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            20.ph,
            Positioned(
              bottom: 0,
              child: Image.asset(
                AppImages.newUnitBackground,
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height / 6,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 180,
              child: BlocProvider<GetUnitBloc>(
                  create: (_) => di.sl<GetUnitBloc>()
                    ..add(GetUnitRequest(programId: int.parse(programId))),
                  child: BlocConsumer<GetUnitBloc, GetUnitState>(
                      listener: (context, state) {
                    if (state is GetProgramsErrorInitial) {
                      if (state.message == RELOGIN_FAILURE_MESSAGE) {
                        Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(state.message),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    log('state:$state');
                  }, builder: (context, state) {
                    if (state is GetProgramsCompleteInitial) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          32.ph,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width - 30,
                            //height: MediaQuery.of(context).size.height-(20+100+(MediaQuery.of(context).size.height / 6)+160),
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView(
                              children:
                                  List.generate(state.data.length, (index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          Utils.navigateTo(
                                              BlocProvider(
                                                  create: (_) =>
                                                      JourneyBarCubit(
                                                          unitId: state
                                                              .data[index].id!,
                                                          currentUnitIndex:
                                                              index,
                                                          units: state.data,
                                                          gamesStarsUseCases:
                                                              sl()),
                                                  child: ChaptersScreen(
                                                    programId: state
                                                        .data[index].id
                                                        .toString(),
                                                    unitsCount:
                                                        state.data.length,
                                                    unitsIndex: index + 1,
                                                    allUnits: state.data
                                                        .map((e) => e.id!)
                                                        .toList(),

                                                    // programName:
                                                    //     state.data[index].name ?? '',
                                                  )),
                                              context);
                                        },
                                        child: Align(
                                          alignment:
                                              (index == 0) || index % 2 == 0
                                                  ? Alignment.topLeft
                                                  : Alignment.topRight,
                                          child: Transform.flip(
                                            flipX:
                                                (index == 0) || index % 2 == 0
                                                    ? false
                                                    : true,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height:
                                                  (width * 0.2692307692307692),
                                              width: width,
                                              child: CustomPaint(
                                                  size: Size(
                                                      width,
                                                      (width *
                                                              0.2692307692307692)
                                                          .toDouble()),
                                                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                                  painter: RPSCustomPainter(
                                                      currentColor:
                                                          DefaultUnitData
                                                              .fullDataOfCardColor
                                                              .random()),
                                                  child: Center(
                                                    child: Transform.flip(
                                                      flipX: (index == 0) ||
                                                              index % 2 == 0
                                                          ? false
                                                          : true,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: width,
                                                        // alignment: Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10,
                                                                right: 10,
                                                                left: 10),
                                                        child: FittedBox(
                                                          child: Text(
                                                            state.data[index]
                                                                    .name ??
                                                                '',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.copyWith(
                                                                  color: AppColor
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    24.ph
                                  ],
                                );
                              }),
                            ),
                          )
                        ],
                      );
                    } else if (state is GetProgramsLoadingInitial) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Center(child: CupertinoActivityIndicator())],
                      );
                    } else {
                      return const SizedBox();
                    }
                  })),
            ),

            Positioned(
              top: 0.14.sh,
              left: 0,
              child: Transform.rotate(
                angle: 0.25,
                child: SizedBox(
                  height: 0.17.sh,
                  width: 0.35.sw,
                  child: RiveAnimation.asset(
                    AppAnimation.beeRive,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )

            //old
            // Positioned(
            //   bottom: 0,
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height / 6,
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     alignment: Alignment.bottomCenter,
            //     children: [
            //       Image.asset(
            //         AppImages.imageLandOfUnit,
            //         width: MediaQuery.of(context).size.width,
            //         height: MediaQuery.of(context).size.height / 6,
            //         fit: BoxFit.fill,
            //       ),
            //       const Positioned(
            //           top: 10,
            //           // left: 40,
            //           child: AnimationOfBee5()),
            //       const Positioned(
            //           bottom: 30,
            //           // left: 40,
            //           child: AnimationOfBee2()),
            //       const Positioned(
            //         right: 10,
            //         top: 10,
            //         child: AnimationOfBee3(),
            //       ),
            //       const Positioned(
            //         left: 0,
            //         top: 10,
            //         child: AnimationOfTree(),
            //       ),
            //       const Positioned(
            //           left: 20,
            //           bottom: 0,
            //           // left: 40,
            //           child: AnimationOfBee()),
            //     ],
            //   ),
            // )
          ],
        ));
  }
}
