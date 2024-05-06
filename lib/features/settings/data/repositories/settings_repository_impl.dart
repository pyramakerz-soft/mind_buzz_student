import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_setting.dart';
import '../datasources/data_source_remotely_of_settings.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final DataSourceRemotelyOfSettings remoteDataSource;
  final NetworkInfo networkInfo;

  SettingsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

}
