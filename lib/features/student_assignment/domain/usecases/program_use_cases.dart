import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_data_test.dart';
import '../repositories/repository_student_assignment.dart';

class ParentAssignmentUseCases {
  final ParentAssignmentRepository repository;

  ParentAssignmentUseCases(this.repository);

  Future<Either<Failure, MainDataTestsModel>> call({required int idProgram}) async {
    return await repository.assignmentDataRepository(idProgram: idProgram);
  }
}