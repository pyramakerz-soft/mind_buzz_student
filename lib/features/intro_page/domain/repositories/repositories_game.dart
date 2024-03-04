import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/based_game_model.dart';

abstract class GameRepository {
  Future<Either<Failure, BasedGameModel>> getGameDataRepository({required int index, bool? showLocal});
}