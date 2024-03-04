import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/assets_images.dart';
import '../bloc/intro_cubit.dart';

class ButtonStartGame extends StatefulWidget {
  const ButtonStartGame({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ButtonStartGame();
  }
}

class _ButtonStartGame extends State<ButtonStartGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    const double _height = 64 - _shadowHeight;

    final showTheButton =
        context.select((IntroCubit value) => value.showTheButton);
    return Visibility(
      visible: showTheButton,
      child: SizedBox(
        width: MediaQuery.of(context).size.width-100,

        child: GestureDetector(
          onTapUp: (_) {
            setState(() {
              _position = 4;
            });
          },
          onTapDown: (_) {
            setState(() {
              _position = 0;
            });
          },
          onTapCancel: () {
            setState(() {
              _position = 4;
            });
          },
          onTap: () async {
            _controller.forward();
            await Future.delayed(const Duration(milliseconds: 500));
            // Utils.navigateAndRemoveUntilTo(
            //     ChangeNotifierProvider<ChooseAvatarProvider>(
            //         create:(_)=> ChooseAvatarProvider(),
            //         builder: (context, child){
            //           context.read<ChooseAvatarProvider>().getTheBackGround();
            //           return child!;
            //         },
            //         child: const ChooseAvatarScreen()),
            //     context);
          },
          child: SizedBox(
            height: _height + _shadowHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: _height,
                    width: 200,
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  bottom: _position,
                  width: 200,
                  duration: const Duration(milliseconds: 70),
                  child: Container(
                    height: _height,
                    width: 200,
                    // padding: EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.buttonImage),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Let's Start",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
