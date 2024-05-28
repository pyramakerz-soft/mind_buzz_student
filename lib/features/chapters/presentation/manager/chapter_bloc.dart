import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/lesson_model.dart';
import '../../domain/entities/sub_chapter_model.dart';
import '../../domain/use_cases/chapter_use_cases.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final LessonUseCases programUserUseCases;

  ChapterBloc({required this.programUserUseCases}) : super(GetLessonInitial()) {
    on<ChapterEvent>((event, emit) async {
      log('event##:$event');
      if (event is GetUnitRequest) {
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage =
            await programUserUseCases(programId: event.programId);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }
}


ChapterState _eitherLoadedOrErrorState(
    Either<Failure, List<LessonModel>> failureOrTrivia,
    ) {
  return failureOrTrivia.fold(
        (failure) => GetProgramsErrorInitial(message: _mapFailureToMessage(failure)),
        (data) =>data.isNotEmpty? GetProgramsCompleteInitial(
        data: handlingDataOfChapters(lessons:data)):EmptyState(),
  );
}

List<ChapterModel> handlingDataOfChapters({required List<LessonModel> lessons}){
  Map<int, List<LessonModel>>listOfData =  groupBy(lessons, (LessonModel obj) => (obj.chapter?.id??0));
  List<ChapterModel> dataOfChapters = [];
  lessons.forEach((lesson) {
    dataOfChapters.add(
        ChapterModel(
          id: lesson.id,
          lessonId: lesson.id,
          name: lesson.name,
          number: lesson.number,
          star: lesson.stars,
          levelImg: AppImages.lessonImg,
          isGame: false,
          isLetter: true
        ),
    );
    lesson.games?.asMap().forEach((i,game) {
      dataOfChapters.add(
        ChapterModel(
            id: game.id,
            lessonId: game.lessonId,
            name: 'Lesson ${i + 1}',
            number: i + 1,
            star: game.stars,
            levelImg: AppImages.imageCloseLesson,
            isGame: true,
            isLetter: false,
        ),
      );
    });

  });

  // listOfData.forEach((key, value) {
  //   List<LessonModel> lessonsData= lessons.where((element) => (element.chapter?.id??0) == key ).toList();
  //   dataOfChapters.add(ChapterModel(
  //     id: lessonsData.first.chapter?.id,
  //     name: lessonsData.first.chapter?.name,
  //     number: lessonsData.first.chapter?.number,
  //     isChapter:true,
  //     isOpen: true,
  //     levelImg: AppImages.imageChapter,
  //   ));
  //   lessonsData.sort((a, b) => a.number?.compareTo(b.number??0)??0);
  //   for(LessonModel x in lessonsData){
  //     dataOfChapters.add(ChapterModel(
  //       id: x.id,
  //       name: x.name,
  //       number: x.number,
  //       isLesson:(x.type == null||x.type == 'Review'),
  //       isCheckPoint:x.type == 'Checkpoint',
  //       isOpen: x.stars!=null || x.stars!=0,
  //       isAssessment:x.type == 'Assessment',
  //       star: x.stars,
  //       levelImg: (x.type == null||x.type == 'Review')?AppImages.imageCloseLesson:x.type == 'Checkpoint'?AppImages.imageCheckpointPart:AppImages.imageAssessmentPart,
  //     ));
  //   }
  // });

  return dataOfChapters;
}


String _mapFailureToMessage(Failure failure) {

  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case LoginFailure:
      return Login_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case ReLoginFailure:
      return RELOGIN_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}