import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/login/presentation/bloc/login_cubit.dart';
import 'core/theme_text.dart';
import 'features/games/presentation/bloc/game1/game_one_bloc.dart';
import 'features/home/presentation/page/home_screen.dart';
import 'features/intro_screen_app/presentation/page/intro_page_app.dart';
import 'features/loading_intro/presentation/bloc/loading_cubit.dart';
import 'features/loading_intro/presentation/page/loading_screen.dart';
import 'core/injection/injection_container.dart' as di;
import 'features/login/presentation/page/login_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GameOneBloc>(create: (_) => di.sl<GameOneBloc>()),
        ],
        child: BlocProvider(
            create: (_) => LoadingCubit(),
            child: MaterialApp(
              title: 'Mind buzz2',
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightTheme,
              home:  BlocProvider(create: (_) => LoginCubit(), child:const HomeScreen()),
            )));
  }
}
