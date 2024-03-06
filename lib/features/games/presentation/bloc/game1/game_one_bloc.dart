import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/based_game_model.dart';
import '../../../domain/entities/game_letters_model.dart';
import '../../../domain/usecases/game_use_cases.dart';

part 'game_one_event.dart';
part 'game_one_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class GameOneBloc extends Bloc<GameOneEvent, GameOneState> {
  final GameUseCases getConcreteGameTrivia;

  GameOneBloc({required this.getConcreteGameTrivia}) : super(GameOneInitial()) {
    on<GameOneEvent>((event, emit) async {
      if (event is GetGameData) {
        emit(LoadingGame());
        final failureOrDoneMessage =
            await getConcreteGameTrivia(event.showOffline);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }

  GameOneState _eitherLoadedOrErrorState(
    Either<Failure, BasedGameModel> failureOrTrivia,
  ) {
    return failureOrTrivia.fold(
      (failure) => ErrorGame(message: _mapFailureToMessage(failure)),
      (newGameData) => LoadedGame(gameData: newGameData),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

  late AnimationController controller;
  late Animation<double> animation;

  handlingDataGame(
      {required BasedGameModel gameData, required LoadedGame state}) {
    state.copyWith(
        cardsLetters: gameData.data?.game?.gameLetters ?? [],
        newCountOfRepeatQuestion: (gameData.data?.game?.numOfTrials ?? 0));
  }
}
