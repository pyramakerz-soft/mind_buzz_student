part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => LoginDataBloc(requestLoginData: sl(), requestAutoUserUseCases: sl()));
  sl.registerFactory(() => GetUnitBloc(programUserUseCases: sl()));
  sl.registerFactory(() => ChapterBloc(programUserUseCases: sl()));
  sl.registerFactory(() => ContactLessonBloc(programContactUserUseCases: sl()));
  sl.registerFactory(() => GetProgramsHomeBloc(programUserUseCases: sl(), logOutUserUseCases: sl()));

  //UseCase
  sl.registerLazySingleton(() => UnitUseCases(sl()));
  sl.registerLazySingleton(() => LessonUseCases(sl()));
  sl.registerLazySingleton(() => LogOutUserUseCases(sl()));
  sl.registerLazySingleton(() => UserUseCases(sl()));
  sl.registerLazySingleton(() => AutoUserUseCases(sl()));
  sl.registerLazySingleton(() => ProgramUserUseCases(sl()));
  sl.registerLazySingleton(() => ContactLessonUseCases(sl()));

  //Repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramUnitRepository>(
      () => UnitRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramLessonRepository>(
      () => LessonRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramContactLessonRepository>(() =>
      ContactLessonRepositoryImpl(
          localRemoteDataSource: sl(),
          remoteDataSource: sl(),
          networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<DataSourceRemotelyOfProgram>(
      () => DataSourceRemotelyOfProgramImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfLogin>(
      () => DataSourceRemotelyOfLoginImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfUnit>(
      () => DataSourceRemotelyOfUnitImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfLesson>(
      () => DataSourceRemotelyOfLessonImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfContactLesson>(
      () => DataSourceRemotelyOfContactLessonImpl(dio: sl()));
  sl.registerLazySingleton<LocalDataSourceRemotelyOfContactLesson>(
      () => LocalDataSourceRemotelyOfContactLessonImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => MainApiConnection());
}
