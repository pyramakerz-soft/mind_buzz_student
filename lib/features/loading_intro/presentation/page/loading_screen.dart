import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../games/presentation/bloc/general_game/game_cubit.dart';
import '../../../games/presentation/page/general_game.dart';
import '../../../intro_screen/presentation/bloc/intro_cubit.dart';
import '../../../intro_screen/presentation/page/intro_screen.dart';
import '../bloc/loading_cubit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreen();
  }
}

class _LoadingScreen extends State<LoadingScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // context.read<ChooseAvatarProvider>().getTheBackGround();
    waitAndGoToChooseAvatar();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  waitAndGoToChooseAvatar() async {
    await Future.delayed(const Duration(seconds: 1));
    Utils.navigateTo(
        BlocProvider(create: (_) => IntroCubit(), child: const IntroScreen()),
        context);

    // Utils.navigateTo(
    //     BlocProvider(
    //         create: (_) => GameCubit(avatarGame: AppImages.imageAvatar2),
    //         child: Builder(builder: (context) {
    //           context.read<GameCubit>().startRiveAnimation();
    //           return BlocBuilder<GameCubit,
    //               GameState>(builder: (context, state) {
    //             return const GeneralGame();
    //           });
    //         })
    //
    //
    //     ),
    //     context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<LoadingCubit, Artboard?>(
                  builder: (context, state) => state != null
                      ? Rive(
                          artboard: state,
                          fit: BoxFit.fill,
                        )
                      : const SizedBox()),
            )
          ],
        ),
      ),
    );
  }
}
