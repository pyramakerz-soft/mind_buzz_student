import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/login/presentation/cubit/login_cubit.dart';
import 'core/theme_text.dart';
import 'features/chapters/presentation/pages/chapters_screens.dart';
import 'features/loading_intro/presentation/bloc/loading_cubit.dart';
import 'core/injection/injection_container.dart' as di;
import 'features/loading_intro/presentation/page/screen1.dart';
import 'features/login/presentation/bloc/login_data_bloc.dart';

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
        ],
        child: BlocProvider(
            create: (_) => LoadingCubit(),
            child: MaterialApp(
              title: 'Mind buzz2',
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightTheme,
              home: const Screens1(),
              // home:ChaptersScreen(programId: '1', programName: '',),
            )));
  }
}
