import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_calender.dart';
import '../datasources/data_source_remotely_of_calender.dart';

class CalenderRepositoryImpl implements CalenderRepository {
  final DataSourceRemotelyOfCalender remoteDataSource;
  final NetworkInfo networkInfo;

  CalenderRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

}
