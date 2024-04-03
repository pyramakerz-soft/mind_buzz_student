import 'package:flame/game.dart' show GameWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/math_book1/manager/current_game_cubit.dart';
import 'package:rive/rive.dart';
import '../../../core/assets_animation.dart';
import '../../../core/assets_images.dart';
import '../../../core/widgets/main_hive_riv.dart';
import '../manager/current_game_state.dart';
import '../manager/inherited_widget_game.dart';
import '../mathematical_transactions/presentation/pages/mathematical_transactions_screen.dart';

class MyHomePageBook1 extends StatefulWidget {
  final Widget question;

  const MyHomePageBook1({Key? key, required this.question}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageBook1();
  }
}

class _MyHomePageBook1 extends State<MyHomePageBook1>
    with TickerProviderStateMixin {
  final GlobalKey _specificWidgetKey = GlobalKey();
  final GlobalKey _specificWidgetKey2 = GlobalKey();
  Offset position = Offset(1.0, 0.4);
  @override
  void initState() {
    super.initState();
    context.read<CurrentGameCubit>().rocketAnimationController =
        AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust the duration as needed
    );
    context.read<CurrentGameCubit>().rocketAnimationOffsetAnimation =
        Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: context.read<CurrentGameCubit>().rocketAnimationController,
      curve: Curves.easeInOut,
    ));

    context.read<CurrentGameCubit>().candyAnimationController =
        AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust the duration as needed
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final RenderBox renderBox2 =
    //       _specificWidgetKey2.currentContext!.findRenderObject() as RenderBox;
    //   final Offset offset2 = renderBox2.localToGlobal(Offset.zero);
    //   setState(() {
    //     position = offset2;
    //   });
    //   // Offset _widgetOffset = _specificWidgetKey2.currentContext
    //   //         ?.findRenderObject()
    //   //         ?.localToGlobal(Offset.zero) ??
    //   //     Offset.zero;
    // });
    context.read<CurrentGameCubit>().candyAnimationOffsetAnimation =
        Tween<Offset>(
      begin: const Offset(1.0, -0.4),
      end: position,
    ).animate(CurvedAnimation(
      parent: context.read<CurrentGameCubit>().candyAnimationController,
      curve: Curves.easeInOut,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? data = DataContainer.of(context)?.data;
    // getData(context: context);
    final candyAnimationController =
        context.watch<CurrentGameCubit>().state.candyAnimationController;
    final giftBoxArtboard =
        context.watch<CurrentGameCubit>().state.giftBoxArtboard;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bgOfMath), fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Row(
                      children: [
                        // 60.pw,
                        SizedBox(
                          height: 100,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 35, right: 35),
                                // width: MediaQuery.of(context).size.width/2,
                                height: 54,
                                padding: const EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add Then choose',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: -5,
                                  left: 0,
                                  child: SvgPicture.asset(AppImages.iconBlimp)),
                              Positioned(
                                bottom: -5,
                                right: 0,
                                child: SvgPicture.asset(AppImages.iconBlimp),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            context
                                .read<CurrentGameCubit>()
                                .sayInstruction(message: data ?? '');
                          },
                          child: Image.asset(
                            AppImages.iconGetInstruction,
                            height: 70,
                          ),
                        ),
                        30.pw
                      ],
                    ),
                  ],
                ),
                Expanded(child: widget.question),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    // const SizedBox(),
                  ],
                ),
                10.ph
              ],
            ),
          ),
          if (candyAnimationController == AnimationStatus.forward) ...{
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SlideTransition(
                position: context
                    .read<CurrentGameCubit>()
                    .candyAnimationOffsetAnimation,
                child: SvgPicture.asset(
                  AppImages.iconCandy,
                  // key: _specificWidgetKey2,

                  // fit: BoxFit.fill,
                  // width: 100, // Adjust the size of the image as needed
                  // height: 100,
                ),
              ),
            ),
          },
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SlideTransition(
              position: context
                  .read<CurrentGameCubit>()
                  .rocketAnimationOffsetAnimation,
              child: Image.asset(
                AppImages.imageRocket,
                key: _specificWidgetKey2,

                // fit: BoxFit.fill,
                // width: 100, // Adjust the size of the image as needed
                height: 100,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                // 10.pw,
                GestureDetector(
                    key: _specificWidgetKey,
                    onTap: () {},
                    child: BlocBuilder<CurrentGameCubit, CurrentGameInitial>(
                        builder: (context, state) =>
                            state.giftBoxArtboard != null
                                ? Rive(
                                    artboard: state.giftBoxArtboard!,
                                    // fit: BoxFit.fill,
                                    useArtboardSize: true)
                                : Row(
                                    children: [
                                      10.pw,
                                      SvgPicture.asset(AppImages.iconGiftBox),
                                    ],
                                  ))) //:SizedBox()

                // SvgPicture.asset(AppImages.iconGiftBox),
              ],
            ),
          )
        ],
      ),
    );
  }
}
