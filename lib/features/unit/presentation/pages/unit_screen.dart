import 'dart:developer';

import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:rive/rive.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/utils.dart';
import '../../../../core/vars.dart';
import '../../../chapters/presentation/manager/journey_bar_cubit.dart';
import '../../../chapters/presentation/pages/chapters_screens.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/get_unit_bloc.dart';
import '../manager/cubit/animation_unit_cubit.dart';
import '../widgets/item_of_unit.dart';

///todo:handling the performance of the screen
class UnitScreen extends StatelessWidget {
  final String programId;
  final String programName;

  const UnitScreen(
      {Key? key, required this.programId, required this.programName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) + 50;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.imageAppBarOfUnits),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.darkBlueColor3),
                                child: SvgPicture.asset(
                                  AppSvgImages.iconHome,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ))),
                        Text(
                          programName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(                                width: 45,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocProvider<GetUnitBloc>(
                    create: (_) => di.sl<GetUnitBloc>()
                      ..add(GetUnitRequest(programId: int.parse(programId))),
                    child: BlocConsumer<GetUnitBloc, GetUnitState>(
                        listener: (context, state) {
                          if (state is GetProgramsErrorInitial) {
                            if(state.message == RELOGIN_FAILURE_MESSAGE){
                              Utils.navigateAndRemoveUntilTo(LoginScreen(), context);

                            }else {
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
                          children: [
                            /// todo: handling the widget to support all sizes
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                  // alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        left:
                                            MediaQuery.of(context).size.width -
                                                60,
                                        top: 21,
                                        child: Container(
                                          width: 6.39,
                                          height: 100,

                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: -9,
                                                top: 0,
                                                child: Container(
                                                  width: 15,
                                                  height: 58,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: AppColor
                                                              .redColor),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 26.90,
                                                child: Transform(
                                                  transform: Matrix4.identity()
                                                    ..translate(0.0, 0.0)
                                                    ..rotateZ(-0.79),
                                                  child: Container(
                                                    width: 19.65,
                                                    height: 19.65,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                120,
                                        height: 58,
                                        padding: const EdgeInsets.only(
                                          top: 11,
                                          left: 20,
                                          right: 14,
                                          bottom: 11,
                                        ),
                                        decoration: const BoxDecoration(
                                            color: Color(0xFFD1232A)),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Continue from previous',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                letterSpacing: 0.36,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        child: BlocBuilder<AnimationUnitCubit,
                                                AnimationUnitInitial>(
                                            builder: (context, state) {
                                          return state.beeArtboard3==null?SizedBox():Rive(
                                            artboard: state.beeArtboard3!,
                                            // fit: BoxFit.fitHeight,
                                            useArtboardSize: true,
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            20.ph,
                            ...List.generate(state.data.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Utils.navigateTo(
                                      BlocProvider(
                                          create: (_) => JourneyBarCubit(),
                                          child:ChaptersScreen(
                                        programId:
                                            state.data[index].id.toString(),
                                        programName:
                                            state.data[index].name ?? '',
                                      )),
                                      context);
                                },
                                child: Align(
                                  alignment: (index == 0) || index % 2 == 0
                                      ? Alignment.topLeft
                                      : Alignment.topRight,
                                  child: Transform.flip(
                                    flipX: (index == 0) || index % 2 == 0
                                        ? false
                                        : true,
                                    child: SizedBox(
                                      height: (width * 0.2692307692307692),
                                      width: width,
                                      child: CustomPaint(
                                          size: Size(
                                              width,
                                              (width * 0.2692307692307692)
                                                  .toDouble()),
                                          //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                          painter: RPSCustomPainter(
                                              currentColor: DefaultUnitData
                                                  .fullDataOfCardColor
                                                  .random()),
                                          child: Transform.flip(
                                            flipX:
                                                (index == 0) || index % 2 == 0
                                                    ? false
                                                    : true,
                                            child: Center(
                                              child: Text(
                                                state.data[index].name ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        );
                      } else if (state is GetProgramsLoadingInitial) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const SizedBox();
                      }
                    })),
              ],
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    AppImages.imageLandOfUnit,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                      bottom: 40,
                      // left: 40,
                      child: SizedBox(
                          height: 50,
                          child: GestureDetector(onTap: () {
                            context
                                .read<AnimationUnitCubit>()
                                .animationBee1Avatar();
                          }, child: BlocBuilder<AnimationUnitCubit,
                              AnimationUnitInitial>(
                            builder: (context, state) {
                              return state.beeArtboard1 == null
                                  ? SvgPicture.asset(AppSvgImages.iconUnitBee)
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, bottom: 3),
                                      child: Transform.flip(
                                        flipX: true,
                                        child: Rive(
                                          artboard: state.beeArtboard1!,
                                          // fit: BoxFit.fitHeight,
                                          useArtboardSize: true,
                                        ),
                                      ));
                            },
                          )))),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: SizedBox(
                        height: 90,
                        width: 75,
                        child: GestureDetector(
                            onTap: () {
                              log('animationBeeWithWaterAvatar');
                              context
                                  .read<AnimationUnitCubit>()
                                  .animationBeeWithWaterAvatar();
                            },
                            child: Stack(children: [
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: BlocBuilder<AnimationUnitCubit,
                                      AnimationUnitInitial>(
                                    builder: (context, state) {
                                      return state.beeWaterArtboard == null
                                          ? SvgPicture.asset(
                                              AppSvgImages.iconWaterBee,
                                              // height: 50,
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
                                  child: SvgPicture.asset(
                                    AppSvgImages.iconFlowers,
                                    height: 50,
                                  ))
                            ]))),
                  ),
                  Positioned(
                    left: 0,
                    top: 10,
                    child: SizedBox(
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
                        ])),
                  ),
                  Positioned(
                      left: 20,
                      bottom: 0,
                      // left: 40,
                      child: SizedBox(
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
                                          useArtboardSize: true,
                                        ),
                                      ));
                            },
                          )))),
                ],
              ),
            )
          ],
        ));
  }
}
