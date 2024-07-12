import 'dart:developer';

import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../phonetics/domain/entities/game_model.dart';
import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/lesson_model.dart';
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
          name: (lesson.name?.split(' ').first ?? '').toLowerCase() == 'connect'
              ? (lesson.name?.split(' ').first ?? '')
              : lesson.name,
          number: lesson.number,
          star: lesson.stars,
          levelImg: AppImages.lessonImg,
          isGame: false,
          isLetter: true),
    );
    Map<String, List<GameModel>>? mapGames = groupBy(
        lesson.games ?? [], (obj) => '${obj.gameTypes?.name}_${obj.audioFlag}');
    List<String> sortedKeys = [];
    if (lesson.name.toString().split(' ').first == BasicOfGameData.connect) {
      sortedKeys = mapGames.keys.toList()..sort(customCompareConnect);
    } else {
      sortedKeys = mapGames.keys.toList()..sort(customComparePhonetics);
    }
    Map<String, dynamic> sortedMap = {
      for (var key in sortedKeys) key: mapGames[key]
    };
    int index = 0;
    sortedMap.forEach((key, value) {
      index++;
      dataOfChapters.add(ChapterModel(
          id: value.first.id,
          lessonId: value.first.lessonId,
          isActive: value.first.isActive == 0 ? false : true,
          name: value.first.name ?? 'Game $index',
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

int customComparePhonetics(String key1, String key2) {
  int index1 =
      BasicOfGameData.customOrderOfGamesPhonetics.indexOf(key1.toLowerCase());
  int index2 =
      BasicOfGameData.customOrderOfGamesPhonetics.indexOf(key2.toLowerCase());
  return index1.compareTo(index2);
}

int customCompareConnect(String key1, String key2) {
  int index1 =
      BasicOfGameData.customOrderOfGamesConnect.indexOf(key1.toLowerCase());
  int index2 =
      BasicOfGameData.customOrderOfGamesConnect.indexOf(key2.toLowerCase());
  return index1.compareTo(index2);
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
