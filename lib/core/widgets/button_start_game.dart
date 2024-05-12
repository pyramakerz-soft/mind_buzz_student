import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import '../../features/login/presentation/cubit/login_state.dart';
import '../injection/injection_container.dart' as di;
import '../../features/login/presentation/cubit/login_cubit.dart';

class ButtonLogin extends StatefulWidget {
  final void Function() dataFunction;
  final String title;
  final double width;
  final bool? disableAnimation;
  final bool? playButton;
  const ButtonLogin(
      {Key? key,
      this.disableAnimation,
      required this.dataFunction,
      required this.title,
      this.playButton ,
      required this.width})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ButtonLogin();
  }
}

class _ButtonLogin extends State<ButtonLogin>
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

  @override
  Widget build(BuildContext context) {
    const double height = 64 - _shadowHeight;

    return SizedBox(
        // width: MediaQuery.of(context).size.width - 100,
        child: GestureDetector(
      onTapUp: (_) {
        if (widget.disableAnimation != true) {
          context.read<LoginCubit>().updateThePositionOfButton(newPosition: 4);
        }
      },
      onTapDown: (_) {
        if (widget.disableAnimation != true) {
          context.read<LoginCubit>().updateThePositionOfButton(newPosition: 0);
        }
      },
      onTapCancel: () {
        if (widget.disableAnimation != true) {
          context.read<LoginCubit>().updateThePositionOfButton(newPosition: 4);
        }
      },
      onTap: () async {
        if (widget.disableAnimation != true) {
          _controller.forward();
        }
        widget.dataFunction();
      },
      child: SizedBox(
        height: height + _shadowHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: height,
                width: widget.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: (widget.playButton==true)?AppColor.darkBlueColor.withOpacity(.5):AppColor.lightGreyColor8,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            BlocBuilder<LoginCubit, LoginStateInitial>(builder: (context, state) {
              return AnimatedPositioned(
                curve: Curves.easeIn,
                bottom: double.parse("${state.position??0}"),
                width: widget.width,
                duration: const Duration(milliseconds: 70),
                child: Container(
                  height: height,
                  width: widget.width,
                  // padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage(AppImages.buttonImage),
                    //     fit: BoxFit.fitWidth),
                    color: (widget.playButton==true)?AppColor.darkBlueColor:AppColor.lightGreyColor8,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.50,
                        ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    ));
  }
}
