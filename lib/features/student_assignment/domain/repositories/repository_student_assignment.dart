import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_data_test.dart';

abstract class ParentAssignmentRepository {
  Future<Either<Failure, MainDataTestsModel>> assignmentDataRepository({ int? idProgram});
}