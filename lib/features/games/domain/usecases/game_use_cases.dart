import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/based_game_model.dart';
import '../repositories/repositories_game.dart';

class GameUseCases {
  final GameRepository repository;

  GameUseCases(this.repository);

  Future<Either<Failure, BasedGameModel>> call(bool stayLogin) async {
    return await repository.getGameDataRepository(index:1, showLocal: true);
  }
}