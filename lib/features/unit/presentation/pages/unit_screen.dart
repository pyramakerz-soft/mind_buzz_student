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

  const UnitScreen({Key? key, required this.programId, required this.programName}) : super(key: key);

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
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                             // alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.bgChooseWhoAmI,
                                  color: AppColor.skyBlueColor,
                                  width: MediaQuery.of(context).size.width -70,
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
                                    height: 160,
                                    width: 160,
                                    child: RiveAnimation.asset(
                                      AppAnimation.cloudRive,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 25,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(9),
                                              alignment: Alignment.center,
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: AppColor.darkBlueColor),
                                              child: SvgPicture.asset(
                                                AppSvgImages.iconHome,
                                                fit: BoxFit.fill,
                                              ))),
                                      16.pw,
                                      Text(
                                        programName,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              color: AppColor.darkBlueColor,
                                              fontSize: 35,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: AppTheme.getFontFamily5(),
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
                    Positioned(
                        bottom: -15,
                        left: -50,
                        child: Transform.rotate(
                          angle: 0.25,
                          child: SizedBox(
                             height: 130,
                             width: 140,
                            child: RiveAnimation.asset(
                              AppAnimation.beeRive,
                            ),
                          ),
                        )
                        // Image.asset(
                        //   AppImages.halfBee,
                        //   height: 150,
                        // ),
                        )
                  ],
                ),
              
                //     Container(
                //       height: 160,
                //       width: MediaQuery.of(context).size.width,
                //       decoration: const BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(AppImages.imageAppBarOfUnits),
                //               fit: BoxFit.fill)),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 22),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             GestureDetector(
                //                 onTap: () {
                //                   Navigator.of(context).pop();
                //                 },
                //                 child: Container(
                //                     padding: const EdgeInsets.all(10),
                //                     height: 45,
                //                     width: 45,
                //                     alignment: Alignment.center,
                //                     decoration: const BoxDecoration(
                //                         shape: BoxShape.circle,
                //                         color: AppColor.darkBlueColor3),
                //                     child: SvgPicture.asset(
                //                       AppSvgImages.iconHome,
                //                       fit: BoxFit.fill,
                //                       color: Colors.white,
                //                     ))),
                //             Text(
                //               programName,
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .titleMedium
                //                   ?.copyWith(
                //                       fontSize: 20, fontWeight: FontWeight.w700),
                //             ),
                //             const SizedBox(
                //               width: 45,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
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
              top: 200,
              child: BlocProvider<GetUnitBloc>(
                  create: (_) => di.sl<GetUnitBloc>()..add(GetUnitRequest(programId: int.parse(programId))),
                  child: BlocConsumer<GetUnitBloc, GetUnitState>(listener: (context, state) {
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
                          // Stack(
                          //   alignment: Alignment.topCenter,
                          //   clipBehavior: Clip.none,
                          //   children: [
                          //     SizedBox(
                          //       // alignment: Alignment.center,
                          //       width: MediaQuery.of(context).size.width,
                          //       height: 100,
                          //       child: Stack(
                          //         alignment: Alignment.center,
                          //         children: [
                          //           Positioned(
                          //             left: MediaQuery.of(context).size.width -
                          //                 60,
                          //             top: 21,
                          //             child: Container(
                          //               width: 6.39,
                          //               height: 100,
                          //               clipBehavior: Clip.antiAlias,
                          //               decoration: const BoxDecoration(),
                          //               child: Stack(
                          //                 children: [
                          //                   Positioned(
                          //                     left: -9,
                          //                     top: 0,
                          //                     child: Container(
                          //                       width: 15,
                          //                       height: 58,
                          //                       decoration: const BoxDecoration(
                          //                           color: AppColor.redColor),
                          //                     ),
                          //                   ),
                          //                   Positioned(
                          //                     left: 0,
                          //                     top: 26.90,
                          //                     child: Transform(
                          //                       transform: Matrix4.identity()
                          //                         ..translate(0.0, 0.0)
                          //                         ..rotateZ(-0.79),
                          //                       child: Container(
                          //                         width: 19.65,
                          //                         height: 19.65,
                          //                         decoration:
                          //                             const BoxDecoration(
                          //                                 color: Colors.white),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //           Container(
                          //             width: MediaQuery.of(context).size.width -
                          //                 120,
                          //             height: 58,
                          //             padding: const EdgeInsets.only(
                          //               top: 11,
                          //               left: 20,
                          //               right: 14,
                          //               bottom: 11,
                          //             ),
                          //             decoration: const BoxDecoration(
                          //                 color: Color(0xFFD1232A)),
                          //             child: const Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               children: [
                          //                 Text(
                          //                   'Continue from previous',
                          //                   style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 18,
                          //                     fontFamily: 'Poppins',
                          //                     fontWeight: FontWeight.w700,
                          //                     height: 0,
                          //                     letterSpacing: 0.36,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           const Positioned(
                          //             left: -12,
                          //             child: AnimationOfBee4(),
                          //           )
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // 20.ph,
                          24.ph,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width - 5,
                            //height: MediaQuery.of(context).size.height-(20+100+(MediaQuery.of(context).size.height / 6)+160),
                            height: MediaQuery.of(context).size.height - (120 + (MediaQuery.of(context).size.height / 6) + 140),
                            child: ListView(
                              children: List.generate(state.data.length, (index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Utils.navigateTo(
                                              BlocProvider(
                                                  create: (_) => JourneyBarCubit(),
                                                  child: ChaptersScreen(
                                                    programId: state.data[index].id.toString(),
                                                    unitsCount: state.data.length,
                                                    unitsIndex: index + 1,
                                                    // programName:
                                                    //     state.data[index].name ?? '',
                                                  )),
                                              context);
                                        },
                                        child: Align(
                                          alignment: (index == 0) || index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
                                          child: Transform.flip(
                                            flipX: (index == 0) || index % 2 == 0 ? false : true,
                                            child: SizedBox(
                                              height: (width * 0.2692307692307692),
                                              width: width,
                                              child: CustomPaint(
                                                  size: Size(width, (width * 0.2692307692307692).toDouble()),
                                                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                                  painter: RPSCustomPainter(currentColor: DefaultUnitData.fullDataOfCardColor.random()),
                                                  child: Transform.flip(
                                                    flipX: (index == 0) || index % 2 == 0 ? false : true,
                                                    child: Center(
                                                      child: Container(
                                                        width: width,
                                                        //newly added
                                                        height: 32,
                                                        // alignment: Alignment.center,
                                                        padding: EdgeInsets.only(top: 10, left: (index == 0) || index % 2 == 0 ? 0 : 30, right: (index == 0) || index % 2 == 0 ? 30 : 0),
                                                        child: Text(
                                                          state.data[index].name ?? '',
                                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                                color: AppColor.white,
                                                                fontSize: 17,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                          textAlign: TextAlign.center,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
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
