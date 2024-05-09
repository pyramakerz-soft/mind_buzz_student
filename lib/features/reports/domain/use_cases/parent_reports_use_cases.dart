import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';
import '../repositories/repository_parent_reports.dart';

class ParentReportsUseCases {
  final ParentReportsRepository repository;

  ParentReportsUseCases(this.repository);

  Future<Either<Failure, MainDataTestsModel>> call({String? date}) async {
    return await repository.reportsDataRepository(date: date);
  }
}