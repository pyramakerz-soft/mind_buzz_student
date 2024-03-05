part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  //UseCase
  sl.registerLazySingleton(() => GameUseCases(sl()));

  //Repository
  sl.registerLazySingleton<GameRepository>(
          () => GameRepositoryImpl(remoteDataSource:sl(), localDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<DataSourceLocalOfGame>(
          () => DataSourceLocalOfGameImpl());
  sl.registerLazySingleton<DataSourceRemotelyOfGame>(
          () => DataSourceRemotelyOfGameImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => MainApiConnection );

}