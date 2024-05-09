import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';

abstract class ParentReportsRepository {
  Future<Either<Failure, MainDataTestsModel>> reportsDataRepository(
      {String? date, String? selectedType});
}
