import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../core/phonetics/basic_of_phonetics.dart';
import '../../../../../core/talk_tts.dart';
import '../../../domain/entities/game_model.dart';
import '../../../../phonetics/domain/use_cases/contact_lesson_use_cases.dart';

part 'contact_lesson_event.dart';
part 'contact_lesson_state.dart';

class ContactLessonBloc extends Bloc<ContactLessonEvent, ContactLessonState> {
  final ContactLessonUseCases programContactUserUseCases;

  ContactLessonBloc({required this.programContactUserUseCases})
      : super(ContactLessonInitial()) {
    on<ContactLessonEvent>((event, emit) async {
      log('event##:$event');
      if (event is GetContactLessonRequest) {
        emit(GetContactLoadingInitial());
        final failureOrDoneMessage =
            await programContactUserUseCases(programId: event.programId);
        emit(await _eitherLoadedOrErrorState(failureOrDoneMessage));
      }
      else if (event is CompleteLessonRequest) {
        emit(CompleteGameState());
      } else if (event is ThisTypeNotSupportedRequest) {
        emit(NotSupportTypeState());
      }
    });
  }
}

Future<ContactLessonState> _eitherLoadedOrErrorState(
  Either<Failure, List<GameModel>> failureOrTrivia,
) async {
  ContactLessonState tempState = failureOrTrivia.fold(
    (failure) => GetContactErrorInitial(message: _mapFailureToMessage(failure)),
    (data) => GetContactInitial(data: data),
  );
  if (tempState is GetContactInitial) {
    if(tempState.data.isNotEmpty) {
      TalkTts.startTalk(text: tempState.data.first.inst ?? '');
      TalkTts.startTalk(text: tempState.data.first.mainLetter ?? '');
    }
  }
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
