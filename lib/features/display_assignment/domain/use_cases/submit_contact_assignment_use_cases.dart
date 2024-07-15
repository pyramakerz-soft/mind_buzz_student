import 'package:based_of_eng_game/src_model/export_models.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../repositories/repositories_contact_assignment.dart';

class SubmitContactAssignmentUseCases {
  final ProgramContactAssignmentRepository repository;

  SubmitContactAssignmentUseCases(this.repository);

  Future<Either<Failure, String>> call(
      {required int testId, required int mistakeCount, required int stars}) async {
    return await repository.submitAssignmentContactDataRepository(
        testId: testId, mistakeCount: mistakeCount, stars:stars);
  }
}
