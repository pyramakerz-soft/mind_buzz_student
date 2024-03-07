import 'dart:developer';
import 'dart:math' hide log;
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import '../../../../../core/assets_animation.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/game_structure.dart';
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
      } else if (event is CompleteGameData) {
        emit(
            CompleteGame(riveArtboardBeeCharacter: getTheBeeCharacterAvatar()));
      } else if (event is RestartGameData) {
        emit(LoadingGame());
        final failureOrDoneMessage =
            await getConcreteGameTrivia(event.showOffline);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      } else if (event is SubmitNewAnswerData) {
        emit(LoadingGame());
        emit(LoadedGame(
            gameData: event.gameData,
            cardsLetters:
                hideCard(cardsLetters: event.cardsLetters, index: event.index)));
      } else if (event is RequestToRestartGameData) {
        emit(RequestToRestartGame());

      }
    });
  }

  Artboard? getTheBeeCharacterAvatar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.beeCharacterRiv1).then(
        (data) async {
          try {
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');

            if (controller != null) {
              artboard.addController(controller);
              // isDance = controller.findSMI('success');
            }
            return artboard;
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }

  GameOneState _eitherLoadedOrErrorState(
    Either<Failure, BasedGameModel> failureOrTrivia,
  ) {
    return failureOrTrivia.fold(
      (failure) => ErrorGame(message: _mapFailureToMessage(failure)),
      (newGameData) => LoadedGame(
          gameData: newGameData,
          cardsLetters: handlingDataGame(
              gameData: newGameData.data?.game?.gameLetters ?? [])),
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

  List<GameLettersModel> handlingDataGame(
      {required List<GameLettersModel>? gameData}) {
    List<GameLettersModel> cardsLetters = (gameData ?? []);
    cardsLetters.shuffle(Random());
    return cardsLetters;
  }

  correctAnswer(
      {required Function soundOfSuccess,
      required Function makeRandomVisibleLetterNull,
      required Function soundOfStar,
      required Function getNewRandomVisibleLetter,
      required Function saveResultOfClose,
      required Function hideCard,
      required List<GameLettersModel> cardsLetters,
      bool? dontPlayTheSound}) async {
    hideCard();

    if (dontPlayTheSound != true) {
      await soundOfSuccess();
    }
    makeRandomVisibleLetterNull();
    if (dontPlayTheSound != true) {
      soundOfStar();
    }
    getNewRandomVisibleLetter();
    saveResultOfClose();
    if (GameStructure.checkCompleted(cardsLetters: cardsLetters) == true) {}
  }

  List<GameLettersModel> hideCard(
      {required List<GameLettersModel> cardsLetters, required int index}) {
    GameLettersModel? tempCard = cardsLetters[index];
    tempCard.hide = true;
    cardsLetters[index] = tempCard;
    return cardsLetters;
  }
}
