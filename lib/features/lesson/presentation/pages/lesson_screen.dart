import 'dart:developer';

import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/vars.dart';
import '../manager/lesson_bloc.dart';
import '../widgets/lesson_item.dart';

class LessonScreen extends StatelessWidget {
  final String programId;
  final String programName;

  const LessonScreen(
      {Key? key, required this.programId, required this.programName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WIDTH = (MediaQuery.of(context).size.width);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
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
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.darkBlueColor3),
                            child: SvgPicture.asset(
                              AppImages.iconHome,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ))),
                    Text(
                      'Lessons',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.darkBlueColor3),
                            child: SvgPicture.asset(
                              AppImages.iconAnalysis,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            )))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - (140 + 120),
              child: BlocProvider<LessonBloc>(
                  create: (_) => di.sl<LessonBloc>()
                    ..add(GetUnitRequest(programId: int.parse(programId))),
                  child: BlocConsumer<LessonBloc, LessonState>(
                      listener: (context, state) {
                    log('state:$state');
                  }, builder: (context, state) {
                    if (state is GetProgramsCompleteInitial) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          20.ph,
                          ...List.generate(state.data.length, (index) {
                            return SizedBox(
                              height: (WIDTH * 0.2622107969151671),
                              width: WIDTH - 50,
                              child: CustomPaint(
                                  size: Size(WIDTH - 50, (WIDTH).toDouble()),
                                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                  painter: LessonItemPainter(
                                      currentColor: DefaultUnitData
                                          .fullDataOfCardColor
                                          .random()),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...List.generate(
                                          DefaultChapterData
                                                  .getTheNumberOfChapter(
                                                      number: index + 1)
                                              .length,
                                          (index2) => SvgPicture.asset(
                                              DefaultChapterData
                                                  .getTheNumberOfChapter(
                                                      number:
                                                          index + 1)[index2])),
                                      SizedBox(
                                        width: (WIDTH / 2) + 50,
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
                                      ),
                                    ],
                                  )),
                            );
                          }),
                        ],
                      );
                    } else if (state is GetProgramsLoadingInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox();
                    }
                  })),
            ),
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImages.iconPartLesson1),
                  SvgPicture.asset(AppImages.iconPartLesson2),
                ],
              ),
            )
          ],
        ));
  }
}
