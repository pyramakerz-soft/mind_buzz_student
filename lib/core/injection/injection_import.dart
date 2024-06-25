part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => LoginDataBloc(
      requestLoginData: sl(),
      requestAutoUserUseCases: sl(),
      updateUserDataUseCases: sl(),
      createPassCodeUseCases: sl()));
  sl.registerFactory(() => GetUnitBloc(programUserUseCases: sl()));
  // sl.registerFactory(() => CurrentGamePhoneticsCubit());
  sl.registerFactory(() => ChapterBloc(programUserUseCases: sl()));
  sl.registerFactory(() => ContactLessonBloc(
      programContactUserUseCases: sl(), getGameUseCases: sl()));
  sl.registerFactory(() =>
      GetProgramsHomeBloc(programUserUseCases: sl(), logOutUserUseCases: sl()));
  sl.registerFactory(() => NotificationsBloc());
  sl.registerFactory(() => CalenderBloc(programUserUseCases: sl()));
  sl.registerFactory(() => SettingsBloc(autoUserUseCases: sl()));
  sl.registerFactory(() => GetAssignmentBloc(
      programUserUseCases: sl(), programReportsUserUseCases: sl()));
  sl.registerFactory(() => PieChartCubit(sl()));
  // sl.registerFactory(() => ReportsBloc(programUserUseCases: sl()));

  //UseCase
  sl.registerLazySingleton(() => UnitUseCases(sl()));
  sl.registerLazySingleton(() => LessonUseCases(sl()));
  sl.registerLazySingleton(() => GameStarsUseCases(sl()));
  sl.registerLazySingleton(() => LogOutUserUseCases(sl()));
  sl.registerLazySingleton(() => UserUseCases(sl()));
  sl.registerLazySingleton(() => AutoUserUseCases(sl()));
  sl.registerLazySingleton(() => ProgramUserUseCases(sl()));
  sl.registerLazySingleton(() => ContactLessonUseCases(sl()));
  sl.registerLazySingleton(() => ParentAssignmentUseCases(sl()));
  sl.registerLazySingleton(() => ParentReportsUseCases(sl()));
  sl.registerLazySingleton(() => UpdateUserDataUseCases(sl()));
  sl.registerLazySingleton(() => GetGameUseCases(sl()));
  sl.registerLazySingleton(() => CreatePassCodeUseCases(sl()));
  sl.registerLazySingleton(() => PieChartUseCases(sl()));
  sl.registerFactory(() => EditProfileCubit(sl()));

  //Repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramUnitRepository>(
      () => UnitRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramLessonRepository>(() => LessonRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
        localRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ParentAssignmentRepository>(() =>
      ParentAssignmentRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProgramContactLessonRepository>(() =>
      ContactLessonRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<NotificationRepository>(() =>
      NotificationRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CalenderRepository>(
      () => CalenderRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ParentReportsRepository>(() =>
      ParentReportsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<EditProfileRepository>(
      () => EditProfileRepositoryImpl(sl()));
  sl.registerLazySingleton<PieChartRepository>(
      () => PieChartRepositoryImpl(sl()));

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
  sl.registerLazySingleton<DataSourceLocalOfContactLesson>(
      () => DataSourceLocalOfGameStar());
  sl.registerLazySingleton<DataSourceRemotelyOfNotification>(
      () => DataSourceRemotelyOfNotificationImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfCalender>(
      () => DataSourceRemotelyOfCalenderImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfSettings>(
      () => DataSourceRemotelyOfSettingsImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfParentAssignment>(
      () => DataSourceRemotelyOfParentAssignmentImpl(dio: sl()));
  sl.registerLazySingleton<DataSourceRemotelyOfParentReports>(
      () => DataSourceRemotelyOfParentReportsImpl(dio: sl()));
  sl.registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<PieChartRemoteDataSource>(
      () => PieChartRemoteDataSourceImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => MainApiConnection());
}
