import 'package:based_of_eng_game/src_model/export_models.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../repositories/repositories_contact_assignment.dart';

class ContactAssignmentUseCases {
  final ProgramContactAssignmentRepository repository;

  ContactAssignmentUseCases(this.repository);

  Future<Either<Failure, List<GameFinalModel>>> call(
      {required int testId, required int programId}) async {
    return await repository.assignmentContactDataRepository(
        testId: testId, programId: programId);
  }
}
