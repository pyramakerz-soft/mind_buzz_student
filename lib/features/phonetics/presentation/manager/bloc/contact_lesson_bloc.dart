import 'dart:developer';

import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mind_buzz_refactor/features/phonetics/domain/use_cases/game_use_cases.dart';

import '../../../../../core/assets_images_main.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import 'package:games_models/games_models.dart';
import '../../../../phonetics/domain/use_cases/contact_lesson_use_cases.dart';

part 'contact_lesson_event.dart';
part 'contact_lesson_state.dart';

class ContactLessonBloc extends Bloc<ContactLessonEvent, GetContactInitial> {
  final ContactLessonUseCases programContactUserUseCases;
  final GetGameUseCases getGameUseCases;

  ContactLessonBloc(
      {required this.programContactUserUseCases, required this.getGameUseCases})
      : super(const GetContactInitial(
            status: StateOfGetDataOfGame.contactLessonInitial)) {
    on<ContactLessonEvent>((event, emit) async {
      _getTheBackGroundLoading();
      log('event##:$event');
      if (event is GetContactLessonRequest) {
        emit(const GetContactInitial(
            status: StateOfGetDataOfGame.getContactLoadingInitial));
        final failureOrDoneMessage = await programContactUserUseCases(
            lessonId: event.lessonId, gameId: event.gameId);
        emit(await _eitherLoadedOrErrorState(
            failureOrDoneMessage, event.gameId));
      } else if (event is ThisTypeNotSupportedRequest) {
        emit(GetContactInitial(
            status: StateOfGetDataOfGame.notSupportTypeState));
      }
    });
  }
  _getTheBackGroundLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppImagesMain.loadingRiv).then(
        (data) async {
          try {
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');
            controller?.inputs.forEach((element) {
              log('element:${element.name}');
            });
            if (controller != null) {
              artboard.addController(controller);
            }
            emit(GetContactInitial(
                status: state.status, avatarArtboardLoading: artboard));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }
}

Future<GetContactInitial> _eitherLoadedOrErrorState(
    Either<Failure, List<GameModel>> failureOrTrivia, int gameId) async {
  GetContactInitial tempState = failureOrTrivia.fold(
    (failure) => GetContactInitial(
        message: _mapFailureToMessage(failure),
        status: StateOfGetDataOfGame.getContactErrorInitial),
    (data) => GetContactInitial(
        data: data, status: StateOfGetDataOfGame.doneGetDataOfGame),
  );
  return tempState;
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
