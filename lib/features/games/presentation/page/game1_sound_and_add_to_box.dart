import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:rive/rive.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/assets_images.dart';
import '../../domain/entities/game_letters_model.dart';
import '../bloc/game1/game_one_bloc.dart';
import '../bloc/general_game/game_cubit.dart';
import '../widget/bar_of_stars.dart';
import '../widget/bar_of_sweets.dart';
import '../widget/cup_widget.dart';
import '../widget/item_card_widget.dart';
import '../widget/repeat_question_pop_up.dart';
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
  late DateTime screenCloseTime;

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
                .read<GameCubit>()
                .saveCurrentGameData(gameData: state.gameData);
          }}, builder: (context, state) {
          if (state is LoadedGame) {
            final countOfRepeatQuestion = state.newCountOfRepeatQuestion;
            final cardsLetters = state.cardsLetters;
            final currentDataGame = state.gameData.data;
            final numOfLetterRepeat =
                state.gameData.data?.game?.numOfLetterRepeat ?? 0;
            final stateOfGameState = context.read<GameCubit>().state;
            return Stack(
              alignment: Alignment.center,
              children: [
                AddToCartAnimation(
                    cartKey: cartKey,
                    height: 30,
                    width: 30,
                    opacity: 0.85,
                    dragAnimation: const DragToCartAnimationOptions(
                      rotation: true,
                    ),
                    jumpAnimation: const JumpAnimationOptions(),
                    createAddToCartAnimation: (runAddToCartAnimation) {
                      this.runAddToCartAnimation = runAddToCartAnimation;
                    },
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                10.ph,
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BarOfSweets(
                                        countOfRepeatQuestion: int.parse(
                                            "${countOfRepeatQuestion ?? 0}"),
                                        currentDataGame: currentDataGame,
                                      ),
                                      BarOfStars(
                                        cartKey: cartKey,
                                        cardsLetters: cardsLetters ?? [],
                                        currentDataGame: currentDataGame,
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: ((cardsLetters.length ?? 0) / 10)
                                        .ceil(),
                                    itemBuilder:
                                        (BuildContext context, int rowIndex) {
                                      int startIndex = rowIndex * 10;
                                      int? endIndex = (rowIndex + 1) * 10;
                                      endIndex =
                                          endIndex > (cardsLetters.length ?? 0)
                                              ? cardsLetters.length
                                              : endIndex;

                                      List<GameLettersModel>? rowItems =
                                          cardsLetters.sublist(
                                              startIndex, endIndex);
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: rowItems.isNotEmpty
                                            ? rowItems.asMap().entries.map(
                                                (item) {
                                                  GlobalKey key = GlobalKey();

                                                  return Row(
                                                    key: key,
                                                    children: [
                                                      item.value.hide == true
                                                          ? SizedBox(
                                                              width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      (10)) /
                                                                  13,
                                                              height: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height -
                                                                      (25)) /
                                                                  4,
                                                            )
                                                          : Draggable<List>(
                                                              onDraggableCanceled:
                                                                  (Velocity
                                                                          velocity,
                                                                      Offset
                                                                          offset) {},
                                                              onDragStarted:
                                                                  () {
                                                                if (kDebugMode) {
                                                                  print(cardsLetters[
                                                                          (startIndex +
                                                                              item.key)]
                                                                      .letter);
                                                                  print((startIndex +
                                                                      item.key));
                                                                }
                                                              },
                                                              data:
                                                                  countOfFingers >= 1
                                                                      ? []
                                                                      : [
                                                                          cardsLetters[(startIndex + item.key)]
                                                                              .letter,
                                                                          (startIndex +
                                                                              item.key)
                                                                        ],
                                                              childWhenDragging:
                                                                  SizedBox(
                                                                width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        (5)) /
                                                                    13,
                                                                height: (MediaQuery.of(context)
                                                                            .size
                                                                            .height -
                                                                        (25)) /
                                                                    4,
                                                              ),
                                                              feedback: countOfFingers >=
                                                                      1
                                                                  ? const SizedBox()
                                                                  : ItemCardWidget(
                                                                      width: (MediaQuery.of(context).size.width -
                                                                              (5)) /
                                                                          13,
                                                                      height:
                                                                          (MediaQuery.of(context).size.height - (25)) /
                                                                              4,
                                                                      body:
                                                                          Text(
                                                                        cardsLetters[(startIndex + item.key)].letter ??
                                                                            '',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .displayLarge
                                                                            ?.copyWith(
                                                                                fontSize: 50,
                                                                                fontWeight: FontWeight.w700),
                                                                      )),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: double
                                                                        .parse(
                                                                            "${(item.key) % 5 == 0.0 ? 0.0 : double.parse("${(item.key) % 4 != 0 ? ((item.key) > 5 ? (item.key - 5) : item.key) * 5 : (((item.key) > 5 ? (item.key - 5) : item.key) - 2) * 5}")}")),
                                                                child:
                                                                    ItemCardWidget(
                                                                        width: (MediaQuery.of(context).size.width -
                                                                                (5)) /
                                                                            13,
                                                                        height:
                                                                            (MediaQuery.of(context).size.height - (25)) /
                                                                                4,
                                                                        body:
                                                                            Text(
                                                                          cardsLetters[(startIndex + item.key)].letter ??
                                                                              '',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .displayLarge
                                                                              ?.copyWith(fontSize: 50, fontWeight: FontWeight.w700),
                                                                        )),
                                                              )),
                                                      if ((item.key) <
                                                          rowItems.length - 1)
                                                        const SizedBox(
                                                            width: 5),
                                                    ],
                                                  );
                                                },
                                              ).toList()
                                            : [],
                                      );
                                    }),
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                currentDataGame?.gameLetters?.length ?? 0,
                                (index) {
                              final GlobalKey widgetKey = GlobalKey();

                              return DragTarget<List>(
                                builder:
                                    (context, candidateItems, rejectedItems) {
                                  // log('candidateItems:${candidateItems}');
                                  // log('rejectedItems:${context.}');
                                  return CupWidget(
                                      key: widgetKey,
                                      image: currentDataGame
                                              ?.gameLetters?[index].letter ??
                                          '',
                                      cardsLetters: cardsLetters ?? [],
                                      currentDataGame: currentDataGame);
                                },
                                onAccept: (item) async {
                                  if (countOfFingers > 1) {
                                    return;
                                  }
                                  screenCloseTime = DateTime.now();
                                  context
                                      .read<GameCubit>()
                                      .addTheStateOfCurrentAnswer(
                                          userAnswer: item.first.toString(),
                                          correctAnswer: stateOfGameState
                                                  .randomVisibleLetter?.letter
                                                  .toString() ??
                                              '');
                                  if (item.first.toString() ==
                                          currentDataGame
                                              ?.gameLetters?[index].letter
                                              .toString() &&
                                      currentDataGame
                                              ?.gameLetters?[index].letter
                                              .toString() ==
                                          stateOfGameState
                                              .randomVisibleLetter?.letter
                                              .toString()) {
                                    // await context
                                    //     .read<Game1Provider>().tempRemoveCard(item.last);
                                    if (cardsLetters
                                            .where((element) =>
                                                element.hide == true &&
                                                (element.letter ?? '') ==
                                                    item.first.toString())
                                            .toList()
                                            .length ==
                                        (numOfLetterRepeat - 1)) {
                                      await listClick(widgetKey, body);
                                    }
                                    // await context
                                    //     .read<GameOneBloc>()
                                    //     .correctAnswer(item.last, context,
                                    //     screenCloseTime, winAction: () {
                                    //       context.read<GameOneBloc>().controller.forward(from: 0);
                                    //     },
                                    //     dontPlayTheSound:(cardsLetters
                                    //         .where((element) =>
                                    //     element.hide == true &&
                                    //         (element.letter ?? '') ==
                                    //             item.first.toString())
                                    //         .toList()
                                    //         .length ==
                                    //         (numOfLetterRepeat - 1)));
                                  } else {
                                    context.read<GameCubit>().soundOfWrong();
                                    context.read<GameCubit>().updateToWrong();
                                    context
                                        .read<GameCubit>()
                                        .updateResultData();
                                    if (countOfRepeatQuestion == 0) {
                                      context.read<GameCubit>().updateToWrong();
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        barrierColor: Colors.transparent,
                                        builder: (BuildContext context0) =>
                                            RepeatQuestionPopUp(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            context
                                                .read<GameCubit>()
                                                .updateToStop(
                                                    dontWaitDelayed: true);
                                            di.sl<GameOneBloc>()
                                              ..add(RestartGameData(
                                                  showOffline: true));
                                          },
                                        ),
                                      );
                                    } else {
                                      context.read<GameCubit>().updateToStop();
                                    }
                                  }
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    )),
              ],
            );
          } else if (state is LoadingGame) {
            return const CupertinoActivityIndicator();
          } else if (state is ErrorGame) {
            return Text(state.message);
          } else if (state is CompleteGame) {
            return SizedBox(
                height: 150,
                width: 300,
                child: AnimatedBuilder(
                    animation: context.read<GameOneBloc>().animation,
                    builder: (context, child) {
                      return Transform.translate(
                          offset: Offset(
                              0,
                              200 *
                                  (1 -
                                      context
                                          .read<GameOneBloc>()
                                          .animation
                                          .value)),
                          child: Opacity(
                              opacity:
                                  context.read<GameOneBloc>().animation.value,
                              child: state.riveArtboardBeeCharacter != null
                                  ? Rive(
                                      alignment: Alignment.center,
                                      useArtboardSize: true,
                                      artboard: state.riveArtboardBeeCharacter!,
                                      fit: BoxFit.fitWidth,
                                      clipRect: Rect.fromCenter(
                                          center: const Offset(0, 0),
                                          width: 450,
                                          height: 450),
                                      // enablePointerEvents: true                                          // .none,
                                    )
                                  : const SizedBox()));
                    }));
          } else {
            return SizedBox();
          }
        }));
  }

  listClick(GlobalKey widgetKey, Container body) async {
    context.read<GameCubit>().soundCompleteOfStar();
    await runAddToCartAnimation(widgetKey, body);
  }
}
