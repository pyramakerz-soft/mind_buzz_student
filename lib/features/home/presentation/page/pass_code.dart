import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/utils.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';

import '../../../botom_navigation_bar/bottom_navigation_bar.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';

class PassCode extends StatefulWidget {
  const PassCode({Key? key}) : super(key: key);

  @override
  State<PassCode> createState() => _PassCodeState();
}

class _PassCodeState extends State<PassCode> {
  List<int> passCode = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Pin Code'),
      body: BlocConsumer<LoginDataBloc, LoginDataState>(
          listener: (context, state) {
        if (state is CreatePinCodeSuccessfully) {
          Utils.navigateAndRemoveUntilTo(BottomNavBar(), context);
        }
      }, builder: (context, state) {
        LoginDataBloc bloc = context.read<LoginDataBloc>();
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              color: AppColor.darkBlueColor,
            ),
            Container(
              height: 0.6.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.r),
                      topLeft: Radius.circular(40.r)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        6,
                        (index) => Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                height: 17,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: passCode.length > index
                                        ? AppColor.darkBlueColor
                                        : Colors.white,
                                    border: Border.all(
                                      color: AppColor.darkBlueColor,
                                    )),
                              ),
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.12.sw),
                    child: state is LoadingLoginState
                        ? const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 1.2),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 12,
                            itemBuilder: (context, i) {
                              return i == 9
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          if (i == 11)
                                            setState(() {
                                              passCode.removeLast();
                                            });
                                          else {
                                            setState(() {
                                              passCode.add(i == 10 ? 0 : i + 1);
                                            });
                                          }
                                          if (passCode.length == 6) {
                                            if (context
                                                    .read<LoginDataBloc>()
                                                    .userData
                                                    ?.parentPin ==
                                                null) {
                                              bloc.add(CreatePinCodeEvent(
                                                  pinCode: passCode
                                                      .join()
                                                      .toString()));
                                            } else if (context
                                                    .read<LoginDataBloc>()
                                                    .userData
                                                    ?.parentPin
                                                    .toString() ==
                                                passCode.join().toString()) {
                                              Utils.navigateAndRemoveUntilTo(
                                                  const BottomNavBar(), context);
                                            } else {
                                              final snackBar = const SnackBar(
                                                content: Text('Wrong Pin Code'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              setState(() {
                                                passCode.clear();
                                              });
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: 0.08.sh,
                                          width: 0.08.sh,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          child: Center(
                                              child: i == 11
                                                  ? const Icon(
                                                      Icons.close,
                                                      color: AppColor
                                                          .darkBlueColor,
                                                    )
                                                  : Text(
                                                      i == 10
                                                          ? '0'
                                                          : (i + 1).toString(),
                                                      style: TextStyle(
                                                          fontSize: 0.025.sh,
                                                          color: AppColor
                                                              .darkBlueColor),
                                                    )),
                                        ),
                                      ),
                                    );
                            }),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
