import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';
import 'package:mind_buzz_refactor/core/phonetics/basic_of_every_game.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../phonetics/domain/entities/game_model.dart';
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
    (failure) =>
        GetProgramsErrorInitial(message: _mapFailureToMessage(failure)),
    (data) => data.isNotEmpty
        ? GetProgramsCompleteInitial(
            data: handlingDataOfChapters(lessons: data))
        : EmptyState(),
  );
}

List<ChapterModel> handlingDataOfChapters(
    {required List<LessonModel> lessons}) {
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
          isLetter: true),
    );
    Map<String, List<dynamic>>? mapGames = groupBy(
        lesson.games ?? [], (obj) => '${obj.gameTypeId}_${obj.audioFlag}');
    int index = 0;
    mapGames.forEach((key, value) {
      index++;
      dataOfChapters.add(ChapterModel(
          id: value.first.id,
          lessonId: value.first.lessonId,
          name: 'Game $index',
          number: index,
          star: value.first.stars,
          levelImg: AppImages.imageCloseLesson,
          isGame: true,
          isLetter: false,
          isHidden: value.first.isHidden));
    });
  });
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
