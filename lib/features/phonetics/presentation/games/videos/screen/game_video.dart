import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

class gameVideo extends StatefulWidget {
  final GameModel currentDataGame;
  gameVideo({required this.currentDataGame});
  @override
  State<StatefulWidget> createState() {
    return _gameVideo();
  }
}

class _gameVideo extends State<gameVideo> {
  late VideoPlayerController _controller;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Duration _currentTime = Duration.zero;
  int currentStateOfGame = 0;
  double currentStateOfGameSec = 0;
  double currentStateOfGameSec1 = 0;
  @override
  void initState() {
    super.initState();
    try {
      print('widget.currentDataGame.video:${widget.currentDataGame.video}');
      _controller = VideoPlayerController.networkUrl(
          Uri.parse( widget.currentDataGame.video ?? ''))
        ..initialize().then((_) {
          // _controller.setLooping(true);
          _controller.play();
          setState(() {});
          Duration countOfSuc = _controller.value.duration;
          currentStateOfGameSec = countOfSuc.inSeconds / 3;
          // currentStateOfGameSec = 10;

          setState(() {
            print("currentStateOfGameSec:${currentStateOfGameSec}");

            print("countOfSuc:${countOfSuc}");
          });
          _controller.addListener(() {
            print("countOfSuc:${_controller.value.position.inSeconds}");

            if ((_controller.value.position.inSeconds) >=
                (currentStateOfGameSec * (currentStateOfGame + 1))) {
              print('addListener');
              print('$_currentTime , $currentStateOfGame');
              setState(() {
                _currentTime = _controller.value.position;
                currentStateOfGame = currentStateOfGame + 1;

              });
            }
            print('addListener:$currentStateOfGame');
            context
                .read<CurrentGamePhoneticsCubit>()
                .addStarToStudent(
              stateOfCountOfCorrectAnswer:currentStateOfGame,
              mainCountOfQuestion: 3,
            );
            if(currentStateOfGame==3){
              Navigator.of(context).pop();
            }

          });
        });
    } catch (e) {
      print('error:$e');
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      await _controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await _controller.dispose();
    } else {
      print('state:$state');
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          await _controller.dispose();
          return true;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImagesPhonetics.loadingVideo),
                      fit: BoxFit.fill)),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller, ),

              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void activate() {
    super.activate();
    print('activate');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
// gameVideo({required BuildContext context, }) {
//   double width = MediaQuery.of(context).size.width;
//   final stopAction = context.select((Game1Provider value) => value.stopAction);
//   return SizedBox();
// }
// import 'package:flutter/material.dart';

class VideoRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static final VideoRouteObserver _instance = VideoRouteObserver._internal();

  factory VideoRouteObserver() => _instance;

  VideoRouteObserver._internal();

  void _handleRouteChange(
      PageRoute<dynamic>? previousRoute, PageRoute<dynamic>? currentRoute) {
    // Check if the previous route is leaving the screen
    final bool isLeavingScreen =
        previousRoute?.isCurrent == true && currentRoute?.isCurrent == false;

    // If the previous route is leaving the screen, stop the video
    if (isLeavingScreen) {
      // Add code here to stop the video
    }
  }
}
