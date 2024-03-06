import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/assets_images.dart';
import '../bloc/game1/game_one_bloc.dart';
import '../bloc/general_game/game_cubit.dart';
import '../widget/star_animation/add_to_cart_animation.dart';
import '../widget/star_animation/add_to_cart_icon.dart';

class Game1SoundAndAddToBox extends StatefulWidget {
  const Game1SoundAndAddToBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Game1SoundAndAddToBox();
  }
}

class _Game1SoundAndAddToBox extends State<Game1SoundAndAddToBox>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context
        .read<GameCubit>()
        .saveStateGameTime(newScreenOpenTime: DateTime.now());
    context.read<GameOneBloc>().controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    context.read<GameOneBloc>().animation = CurvedAnimation(
        parent: context.read<GameOneBloc>().controller,
        curve: Curves.easeInOut);

    context.read<GameOneBloc>().controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<GameCubit>().beeTalkOfCongratulation();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      di.sl<GameOneBloc>()..add(GetGameData(showOffline: true));
    });
    super.initState();
  }

  final Container body = Container(
    color: Colors.transparent,
    child: SvgPicture.asset(
      AppImages.iconStar,
      height: 30,
      width: 30,
    ),
  );

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey, Container) runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    final countOfFingers =
        context.watch<GameCubit>().state.touchPositions.length;
    return BlocProvider(
        create: (context) =>
            di.sl<GameOneBloc>()..add(GetGameData(showOffline: true)),
        child:
            BlocConsumer<GameOneBloc, GameOneState>(listener: (context, state) {
          if (state is LoadedGame) {
            context
                .read<GameOneBloc>()
                .handlingDataGame(gameData: state.gameData, state: state);
            context
                .read<GameCubit>()
                .saveCurrentGameData(gameData: state.gameData);
          }
        }, builder: (context, state) {
          if (state is LoadedGame) {
            final countOfRepeatQuestion = state.newCountOfRepeatQuestion;
            final cardsLetters = state.cardsLetters;
            final currentDataGame = state.gameData.data;
            final numOfLetterRepeat =
                state.gameData.data?.game?.numOfLetterRepeat ?? 0;

            return SizedBox();
          } else if (state is LoadingGame) {
            return const CupertinoActivityIndicator();
          } else if (state is ErrorGame) {
            return Text(state.message);
          } else {
            return SizedBox();
          }
        }));
  }
}
