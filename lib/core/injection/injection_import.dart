part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => GameOneBloc(getConcreteGameTrivia: sl()));
  sl.registerFactory(() => LoginDataBloc(requestLoginData: sl()));
  sl.registerFactory(() => GetProgramsHomeBloc(programUserUseCases: sl()));

  //UseCase
  sl.registerLazySingleton(() => GameUseCases(sl()));
  sl.registerLazySingleton(() => UserUseCases(sl()));
  sl.registerLazySingleton(() => ProgramUserUseCases(sl()));

  //Repository
  sl.registerLazySingleton<GameRepository>(() => GameRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramRepository>(() => HomeRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<DataSourceLocalOfGame>(
          () => DataSourceLocalOfGameImpl());
  sl.registerLazySingleton<DataSourceRemotelyOfProgram>(
          () => DataSourceRemotelyOfProgramImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfLogin>(
          () => DataSourceRemotelyOfLoginImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfGame>(
      () => DataSourceRemotelyOfGameImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => MainApiConnection());
}
