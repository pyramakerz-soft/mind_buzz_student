import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/utils.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/vars.dart';
import '../../../chapters/domain/entities/chapter_model.dart';
import '../../../math_book1/entities/passed_data.dart';
import '../../../math_book1/manager/current_game_cubit.dart';
import '../../../math_book1/manager/inherited_widget_game.dart';
import '../../../math_book1/mathematical_transactions/presentation/pages/mathematical_transactions_screen.dart';
import '../../../math_book1/screen/my_home_page_book1.dart';
import '../manager/lesson_bloc.dart';
import '../widgets/lesson_item.dart';
import '../widgets/lock_lesson_item.dart';

class LessonScreen extends StatefulWidget {

  final String programId;
  final String programName;
  const LessonScreen(
      {Key? key, required this.programId, required this.programName})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LessonScreen();
  }
}

class _LessonScreen extends State<LessonScreen>{

  String sharedData = '';

  void updateData(String newData) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        sharedData = newData;
      });
    });
  }
  List<ChapterModel> chapters = [
    ChapterModel(isOpen: true),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
    ChapterModel(isOpen: false),
  ];
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: MediaQuery.of(context).size.height - (140 + 120),
              child: BlocProvider<LessonBloc>(
                  create: (_) => di.sl<LessonBloc>()
                    ..add(GetUnitRequest(programId: int.parse(widget.programId))),
                  child: BlocConsumer<LessonBloc, LessonState>(
                      listener: (context, state) {
                    log('state:$state');
                  }, builder: (context, state) {
                    if (state is GetProgramsCompleteInitial) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.ph,
                            ...List.generate(state.data.length, (index) {
                              return SizedBox(
                                height: (width * 0.2622107969151671),
                                width: width - 50,
                                child: GestureDetector(
                                  onTap: (){
                                    if(chapters[index].isOpen==true){
                                      Utils.navigateTo(BlocProvider(
                                          create: (_) => CurrentGameCubit(),
                                          child:  DataContainer(
                                                    data: sharedData,
                                                    updateData: updateData,
                                                    child:const MyHomePageBook1(
                                                question: MathematicalTransactionsScreen(),)
                                              )), context);
                                    }
                                  },
                                  child: Stack(
                                    clipBehavior : Clip.none,
                                    children: [

                                      Column(
                                        children: [

                                          CustomPaint(
                                              size: Size(width - 50, 100),
                                              painter:chapters[index].isOpen==true? LessonItemPainter():LockLessonItemPainter(),
                                              child: SizedBox(
                                                height: 90,
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
                                                                    index + 1)[index2],
                                                                  height: 45,
                                                                )),
                                                    10.pw,
                                                    SizedBox(
                                                      width: (width / 2)+30 ,
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
                                                    40.pw
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                      Positioned(
                                        top:-25,

                                        child: Row(
                                          children: [
                                            Container(
                                              // height: 50,
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                child: Transform.rotate(
                                                    angle: (-10) *
                                                        3.141592653589793 /
                                                        180,
                                                    // Rotate 45 degrees in radians
                                                    child: Image.asset(
                                                      chapters[index].isOpen==true?AppImages.imageStar:AppImages.imageEmptyStar,
                                                      height: 20,
                                                    ))),
                                            Image.asset(
                                              chapters[index].isOpen==true?AppImages.imageStar:AppImages.imageEmptyStar,
                                              height: 20,
                                            ),
                                            Container(
                                              // height: 50,
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                child: Transform.rotate(
                                                    angle: (10) *
                                                        3.141592653589793 /
                                                        180,
                                                    // Rotate 45 degrees in radians
                                                    child: Image.asset(
                                                      chapters[index].isOpen==true?AppImages.imageStar:AppImages.imageEmptyStar,
                                                      height: 20,
                                                    ))),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    } else if (state is GetProgramsLoadingInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  })),
            ),
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppSvgImages.iconPartLesson1),
                  SvgPicture.asset(AppSvgImages.iconPartLesson2),
                ],
              ),
            )
          ],
        ));
  }
}
