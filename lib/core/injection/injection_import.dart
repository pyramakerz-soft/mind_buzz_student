part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => GameOneBloc(getConcreteGameTrivia: sl()));
  sl.registerFactory(() => LoginDataBloc(requestLoginData: sl()));
  sl.registerFactory(() => GetUnitBloc(programUserUseCases: sl()));
  sl.registerFactory(() => LessonBloc(programUserUseCases: sl()));
  sl.registerFactory(() => ContactLessonBloc(programContactUserUseCases: sl()));
  sl.registerFactory(() => GetProgramsHomeBloc(programUserUseCases: sl(), logOutUserUseCases: sl()));

  //UseCase
  sl.registerLazySingleton(() => GameUseCases(sl()));
  sl.registerLazySingleton(() => UnitUseCases(sl()));
  sl.registerLazySingleton(() => LessonUseCases(sl()));
  sl.registerLazySingleton(() => LogOutUserUseCases(sl()));
  sl.registerLazySingleton(() => UserUseCases(sl()));
  sl.registerLazySingleton(() => ProgramUserUseCases(sl()));
  sl.registerLazySingleton(() => ContactLessonUseCases(sl()));

  //Repository
  sl.registerLazySingleton<GameRepository>(() => GameRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramRepository>(() => HomeRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramUnitRepository>(() => UnitRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramLessonRepository>(() => LessonRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramContactLessonRepository>(() => ContactLessonRepositoryImpl(
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
  sl.registerLazySingleton<DataSourceRemotelyOfUnit>(
          () => DataSourceRemotelyOfUnitImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfLesson>(
          () => DataSourceRemotelyOfLessonImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfContactLesson>(
          () => DataSourceRemotelyOfContactLessonImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => MainApiConnection());
}
