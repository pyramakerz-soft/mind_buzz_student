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
import '../../../../core/injection/injection_container.dart';
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
  final List<int> allUnits;

  const ChaptersScreen(
      {Key? key, required this.programId, required this.unitsCount,required this.unitsIndex,
      required this.allUnits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfBar =
        context.select((JourneyBarCubit value) => value.state.totalOfBar);
    return Scaffold(
      body:BlocProvider<ChapterBloc>(
        create: (_) => di.sl<ChapterBloc>()
          ..add(GetUnitRequest(programId: int.parse(programId))),
        child:  BlocBuilder<JourneyBarCubit, JourneyBarInitial>(
            builder: (context, state) {
            int unitId =  context.read<JourneyBarCubit>().unitId;
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.bgChapters), fit: BoxFit.fill)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(children: [
                    Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if(unitId == int.parse(programId)) {
                                  Navigator.of(context).pop();
                                }
                                else{
                                  context.read<JourneyBarCubit>().changeUnit(allUnits,next: false);
                                  context.read<ChapterBloc>().add(GetUnitRequest(programId: unitId));
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 45,
                                  width: 45,
                                  alignment: Alignment.center,
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColor.darkBlueColor,),
                                  child: Icon(
                                   Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ))),
                          Spacer(),
                          Text(
                            'Unit ${allUnits.indexOf(unitId) + 1} of $unitsCount',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColor.darkBlueColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppTheme.getFontFamily5(),
                            ),
                          ),
                          Spacer(),
                          if(unitId != allUnits.last)
                          GestureDetector(
                              onTap: () {
                                context.read<JourneyBarCubit>().changeUnit(allUnits,next: true);
                                context.read<ChapterBloc>().add(GetUnitRequest(programId: unitId));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 45,
                                  width: 45,
                                  alignment: Alignment.center,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColor.darkBlueColor,),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ))),



                        ],
                      ),
                    ),
                    BlocConsumer<ChapterBloc, ChapterState>(
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
                                    element.isLetter != true &&
                                    element.star != null)
                                .length,
                            countOfLessons: state.data
                                .where((element) => element.isLetter!= true)
                                .length);
                      }
                    }, builder: (context, state) {
                      if (state is GetProgramsCompleteInitial) {
                        List<ChapterModel> games = state.data.reversed.where((element) => !element.isHidden).toList();
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 50.h,
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
                                    if (games[index].isGame == true) {
                                    Utils.navigateTo(
                                         PhoneticsBook(
                                          lessonId: games[index].lessonId!,
                                           gameId: games[index].id!,
                                           firstTry: true,
                                        ),
                                        context);
                                    }
                                  },
                                  levelMapParams: LevelMapParams(
                                    showPathShadow: false,
                                    levelCount: games.length,
                                    pathStrokeWidth: 1,
                                    currentLevel: games.isEmpty
                                        ? 1
                                        : games.length
                                            .toDouble(),
                                    pathColor: Colors.grey,
                                    levelsImages: games
                                        .map((e) => ImageParams(
                                            path: e.levelImg!,
                                            size:  Size(100,
                                                (e.isGame??false)?
                                                90 : 65),
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
                    }),

                  ]),
                  Positioned(
                    left: -55,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              state.beeWinningArtboard != null
                                        ? Transform.rotate(
                                            angle: pi / 10,
                                            child: SizedBox(
                                              width: 200,
                                              child: Rive(
                                                  artboard: state.beeWinningArtboard!,
                                                  useArtboardSize: true),
                                            ))
                                        : const SizedBox()
                          ],
                        )),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
