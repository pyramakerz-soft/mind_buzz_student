import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../domain/entities/chapter_model.dart';
part 'chapters_event.dart';
part 'chapters_state.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {

  List<ChapterModel> chapters = [
    ChapterModel(
        isOpen: true,
        isChapter: true,
        id: 1,
        levelImg: 'assets/images/intro_bee.png'),
    ChapterModel(
        isOpen: true,
        isLesson: true,
        id: 2,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 3,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 4,
        levelImg: 'assets/images/child.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 5,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isCheckPoint: true,
        id: 6,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 7,
        levelImg: 'assets/images/checkpoint_part.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 8,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isChapter: true,
        id: 9,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isAssessment: true,
        id: 10,
        levelImg: 'assets/images/lesson_part.png'),
    ChapterModel(
        isOpen: false,
        isLesson: true,
        id: 11,
        levelImg: 'assets/images/lesson_part.png'),
  ];

  ChaptersBloc() : super(ChaptersInitialState()) {
    on<ChaptersEvent>((event, emit) {

    });
    on<ChapterOffsetsEvent>((event,emit){

    });
  }




}


String _mapFailureToMessage(Failure failure) {

  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case LoginFailure:
      return Login_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
