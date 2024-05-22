import 'dart:developer';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/stroke_text.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../math_book1/presentation/manager/current_game_cubit.dart';
import '../../../math_book1/presentation/screen/my_home_page_book1.dart';
import '../../../phonetics/presentation/games/click_the_sound/pages/click_the_sound_game.dart';
import '../../../phonetics/presentation/pages/phonetics_book.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/image_details.dart';
import '../manager/chapter_bloc.dart';
import '../manager/journey_bar_cubit.dart';
import '../manager/journey_bar_state.dart';
import '../widgets/dotted_line_painter.dart';
import '../widgets/item_of_sub_body.dart';
import '../widgets/item_of_title.dart';
import '../widgets/level_map.dart';
import '../widgets/level_map_parameters.dart';

class ChaptersScreen extends StatelessWidget {
  final String programId;
  final int unitsCount;
  final int unitsIndex;

  const ChaptersScreen(
      {Key? key, required this.programId, required this.unitsCount,required this.unitsIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfBar =
        context.select((JourneyBarCubit value) => value.state.totalOfBar);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgChapters), fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(children: [

              BlocProvider<ChapterBloc>(
                  create: (_) => di.sl<ChapterBloc>()
                    ..add(GetUnitRequest(programId: int.parse(programId))),
                  child: BlocConsumer<ChapterBloc, ChapterState>(
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
                    } else if (state is GetProgramsCompleteInitial) {
                      context.read<JourneyBarCubit>().updateTheBar(
                          width: MediaQuery.of(context).size.width,
                          completed: state.data
                              .where((element) =>
                                  element.isChapter != true &&
                                  element.star != null)
                              .length,
                          countOfLessons: state.data
                              .where((element) => element.isChapter != true)
                              .length);
                    }
                  }, builder: (context, state) {
                    if (state is GetProgramsCompleteInitial) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            // RichText(
                            //   text: TextSpan(
                            //     text: 'Chapter ',
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: AppColor.darkBlueColor3,
                            //       fontFamily: AppTheme.getFontFamily(),
                            //       fontSize: 20,
                            //     ),
                            //     children: <TextSpan>[
                            //       TextSpan(
                            //         text:
                            //             '${state.data.where((element) => element.isChapter == true && element.isOpen == true).length}',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: AppColor.redColor4,
                            //           fontFamily: AppTheme.getFontFamily(),
                            //           fontSize: 20,
                            //         ),
                            //       ),
                            //       TextSpan(
                            //         text:
                            //             ' of ${state.data.where((element) => element.isChapter == true).length}',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: AppColor.darkBlueColor3,
                            //           fontFamily: AppTheme.getFontFamily(),
                            //           fontSize: 20,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Expanded(
                              child: LevelMap(
                                backgroundColor: Colors.transparent,
                                onTapLevel: (index) {
                                  if (state.data.reversed.toList()[index].isLesson == true &&
                                      state.data.reversed.toList()[index].isOpen == true) {
                                  Utils.navigateTo(
                                       PhoneticsBook(
                                        lessonId: state.data.reversed.toList()[index].id!,
                                      ),
                                      context);
                                  }
                                },
                                levelMapParams: LevelMapParams(
                                  showPathShadow: false,
                                  levelCount: state.data.length,
                                  pathStrokeWidth: 1,
                                  currentLevel: state.data.reversed
                                          .where((element) =>
                                              element.isOpen == true)
                                          .toList()
                                          .isEmpty
                                      ? 1
                                      : state.data.reversed
                                          .where((element) =>
                                              element.isOpen == true)
                                          .toList()
                                          .length
                                          .toDouble(),
                                  pathColor: Colors.grey,
                                  levelsImages: state.data.reversed
                                      .map((e) => ImageParams(
                                          path: e.levelImg!,
                                          size: const Size(100, 100),
                                          bodyWidget:
                                              ItemOfSubBody(chapterData: e),
                                          title: ItemOfTitle(chapterData: e)))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    else if (state is GetProgramsLoadingInitial) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else {
                      return const SizedBox();
                    }
                  })),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
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
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColor.darkBlueColor3),
                                  child: Image.asset(
                                    AppImages.iconBackButton,
                                    fit: BoxFit.fill,
                                    color: Colors.white,
                                  ))),
                          const SizedBox(
                            width: 20,
                          ),
                          StrokeText(
                            text:  'Unit $unitsIndex of $unitsCount',
                            isDisabled: false,
                            fontSize: 0.04.sh,
                            strokeWidth: 3,
                          ),

                        ],
                      ),
                      // Stack(
                      //   alignment: Alignment.centerLeft,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width / 2,
                      //       decoration: BoxDecoration(
                      //           color: AppColor.darkBlueColor7,
                      //           borderRadius: BorderRadius.circular(15),
                      //           border:
                      //               Border.all(color: Colors.white, width: 2)),
                      //       padding: EdgeInsets.zero,
                      //       height: 20,
                      //     ),
                      //     if (numberOfBar != 0 && numberOfBar != null) ...{
                      //       Container(
                      //         width: numberOfBar,
                      //         margin: const EdgeInsets.only(left: 2),
                      //         decoration: BoxDecoration(
                      //           color: AppColor.yellowColor,
                      //           borderRadius: BorderRadius.circular(15),
                      //           // border: Border.all(color: Colors.white, width: 2)
                      //         ),
                      //         padding: EdgeInsets.zero,
                      //         height: 16,
                      //       ),
                      //     }
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ]),
            Positioned(
              left: -55,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<JourneyBarCubit, JourneyBarInitial>(
                          builder: (context, state) =>
                              state.beeWinningArtboard != null
                                  ? Transform.rotate(
                                      angle: pi / 10,
                                      child: SizedBox(
                                        width: 200,
                                        child: Rive(
                                            artboard: state.beeWinningArtboard!,
                                            useArtboardSize: true),
                                      ))
                                  : const SizedBox())
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
