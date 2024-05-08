import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/features/login/presentation/cubit/login_cubit.dart';
import 'core/theme_text.dart';
import 'features/chapters/presentation/pages/chapters_screens.dart';
import 'features/loading_intro/presentation/bloc/loading_cubit.dart';
import 'core/injection/injection_container.dart' as di;
import 'features/loading_intro/presentation/page/screen1.dart';
import 'features/login/presentation/bloc/login_data_bloc.dart';
import 'features/student_assignment/presentation/manager/bottom_cubit/bottom_cubit.dart';
import 'features/who_am_i/presentation/manager/who_am_i_cubit.dart';
import 'features/who_am_i/presentation/pages/who_am_i_screen.dart';

Future<void> setPreferredOrientationLandscape() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> setPreferredOrientationPortrait() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientationPortrait();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginDataBloc>(create: (_) => di.sl<LoginDataBloc>()),
          BlocProvider(
            create: (_) => LoginCubit(),
          ),
          BlocProvider(
            create: (_) => WhoAmICubit(),
          ),
          BlocProvider(
            create: (_) => BottomCubit(),
          ),
        ],
        child: BlocProvider(
            create: (_) => LoadingCubit(),
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_ , child) {
               return MaterialApp(
                  title: 'Mind buzz2',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme().lightTheme,
                  home: const Screens1(),
                  // home: const HomeScreen(),

                  // home: ChaptersScreen(
                  //   programId: '1',
                  //   programName: '',
                  // ),
                );
              },
            )));
  }
}
