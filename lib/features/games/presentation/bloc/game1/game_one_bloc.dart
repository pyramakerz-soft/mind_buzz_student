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
      }else if (event is CompleteGameData) {
        emit(
            CompleteGame(riveArtboardBeeCharacter: getTheBeeCharacterAvatar()));
      }else if (event is RestartGameData) {
        emit(LoadingGame());
        final failureOrDoneMessage =
        await getConcreteGameTrivia(event.showOffline);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
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
              gameData: newGameData.data?.game?.gameLetters ?? []),
          newCountOfRepeatQuestion: (newGameData.data?.game?.numOfTrials ?? 0)),
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

  ///convert to pipline function
  // correctAnswer(
  //     {required int index,
  //     required DateTime countOfSeconds,
  //     required GestureTapCallback winAction,
  //     required Function() soundOfSuccess,
  //     required GestureTapCallback updateToSuccess,
  //     bool? dontPlayTheSound}) async {
  //   updateToSuccess();
  //   if (dontPlayTheSound != true) {
  //     await soundOfSuccess();
  //   }
  //   randomVisibleLetter = null;
  //   cardsLetters[index] = tempCard!;
  //   await context.read<StartGameProvider>().updateToStop();
  //   await player.stop();
  //   if (dontPlayTheSound != true) {
  //     await soundOfStar();
  //     await player1.stop();
  //   }
  //   notifyListeners();
  //
  //   randomVisibleLetter =
  //       await getRandomValueOfGame2(cardsLetters: cardsLetters);
  //   if (randomVisibleLetter != null) {
  //     await updateRandomLetter(
  //         newLetterOfSound: GetCurrent.superGetSoundBasedOnLetter(
  //             superLetter: randomVisibleLetter?.letter?.toLowerCase() ?? ''));
  //   }
  //   notifyListeners();
  //   updateResultList(
  //       context,
  //       closeScreen(
  //           screenCloseTime: countOfSeconds, screenOpenTime: screenOpenTime));
  //
  //   if (checkCompleted(cardsLetters: cardsLetters) == true) {
  //     winAction();
  //     await startAnimationOfCelebration();
  //     await Future.delayed(const Duration(seconds: 3));
  //     increaseCurrentIndex(context);
  //   }
  //   tempCard = null;
  //   notifyListeners();
  // }
}
