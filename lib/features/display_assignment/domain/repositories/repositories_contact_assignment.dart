import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';

abstract class ProgramContactAssignmentRepository {
  Future<Either<Failure, List<GameFinalModel>>> assignmentContactDataRepository({required int programId, required int testId});
  Future<Either<Failure, String>> submitAssignmentContactDataRepository({required int testId, required int mistakeCount, required int stars});
}
