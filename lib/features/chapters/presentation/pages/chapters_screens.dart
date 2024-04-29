import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/utils.dart';
import '../../../math_book1/presentation/manager/current_game_cubit.dart';
import '../../../math_book1/presentation/screen/my_home_page_book1.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/image_details.dart';
import '../manager/chapter_bloc.dart';
import '../widgets/dotted_line_painter.dart';
import '../widgets/item_of_sub_body.dart';
import '../widgets/item_of_title.dart';
import '../widgets/level_map.dart';
import '../widgets/level_map_parameters.dart';

class ChaptersScreen extends StatelessWidget {
  final String programId;
  final String programName;

  ChaptersScreen(
      {Key? key, required this.programId, required this.programName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bgChapters))),
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
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
                        'Chapters',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.darkBlueColor3),
                              child: SvgPicture.asset(
                                AppSvgImages.iconAnalysis,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ),
              ),
              BlocProvider<ChapterBloc>(
                  create: (_) => di.sl<ChapterBloc>()
                    ..add(
                        GetUnitRequest(programId: int.parse(programId))),
                  child: BlocConsumer<ChapterBloc, ChapterState>(
                      listener: (context, state) {
                    log('state:$state');
                  }, builder: (context, state) {
                    if (state is GetProgramsCompleteInitial) {
                      return Expanded(
                        child: LevelMap(
                          backgroundColor: Colors.transparent,
                          onTapLevel: (index) {
                            if (state.data[index].isOpen == true) {
                              Utils.navigateTo(
                                  BlocProvider(
                                      create: (_) => CurrentGameCubit(),
                                      child: MyHomePageBook1(
                                        lessonId: "${state.data[index].id}",
                                      )),
                                  context);
                            }
                          },
                          levelMapParams: LevelMapParams(
                            levelCount: state.data.length,
                            currentLevel: state.data
                                    .where((element) => element.isOpen == true)
                                    .toList()
                                    .isEmpty
                                ? 1
                                : state.data
                                    .where((element) => element.isOpen == true)
                                    .toList()
                                    .length
                                    .toDouble(),
                            pathColor: Colors.black,
                            levelsImages: state.data.reversed
                                .map((e) => ImageParams(
                                    path: e.levelImg!,
                                    size: Size(100, 100),
                                    bodyWidget: ItemOfSubBody(chapterData: e),
                                    title: ItemOfTitle(chapterData: e)))
                                .toList(),
                          ),
                        ),
                      );
                    } else if (state is GetProgramsLoadingInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  })),
            ]),
            Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.halfBee,
                      width: 110,
                    ),
                    // 100.ph
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
