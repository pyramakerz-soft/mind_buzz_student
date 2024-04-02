import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../core/assets_images.dart';
import '../../core/talk_tts.dart';
import 'manager/handling_lesson_cubit.dart';

class MyHomePageBook1 extends StatefulWidget {
  final Widget question;

  const MyHomePageBook1({Key? key, required this.question}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageBook1();
  }
}

class _MyHomePageBook1 extends State<MyHomePageBook1> {
  @override
  void initState() {
    super.initState();
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

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bgOfMath), fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),

                Row(
                  children: [
                    60.pw,
                    SizedBox(
                      height: 100,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 35, right: 35),
                            // width: MediaQuery.of(context).size.width/2,
                            height: 54,
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(bottom: -5,left:0,child: SvgPicture.asset(AppImages.iconBlimp)),
                          Positioned(bottom: -5,right: 0,child: SvgPicture.asset(AppImages.iconBlimp),)
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                      // await TalkTts.startTalk(text: newMessageQuestion ?? '');

                        },
                      child: Image.asset(AppImages.iconGetInstruction, height: 70,),),
                    30.pw
                  ],
                ),

              ],
            ),
            Expanded(child: widget.question),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    10.pw,
                    GestureDetector(onTap: (){},child: SvgPicture.asset(AppImages.iconGiftBox),),
                  ],
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
            10.ph
          ],
        ),
      ),
    );
  }

}