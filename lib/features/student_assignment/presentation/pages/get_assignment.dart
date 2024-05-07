import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/app_color.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../domain/entities/tests_types_model.dart';
import '../manager/bloc/get_assignment_bloc.dart';
import '../widgets/card_of_details_assignment.dart';

class GetAssignmentScreen extends StatelessWidget {
  final String programName;
  final int programId;

  const GetAssignmentScreen(
      {Key? key, required this.programName, required this.programId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColor.lightGreyColor,
                offset: Offset(1, 1.0),
                blurRadius: 5.0,
              )
            ]),
            child: Column(
              children: [
                AppBar(
                  leadingWidth: 52,
                  backgroundColor: Colors.white,
                  leading: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.42),
                            color: AppColor.whiteRed),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  title: Text(
                    programName,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          // height: 0,
                          // letterSpacing: 0.44,
                          fontSize: 22,
                        ),
                  ),
                  actions: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        child: Container(
                          // width: 10,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.42),
                              color: AppColor.whiteRed),
                          child: Icon(Icons.filter_alt_outlined, color: Colors.black45.withOpacity(.2),),
                        ),
                      ),
                    ),
                    // 24.pw,
                  ],
                ),
              ],
            ),
          ),
        ),
        body: BlocProvider<GetAssignmentBloc>(
            create: (_) => di.sl<GetAssignmentBloc>()
              ..add(GetAssignmentRequest(programId: programId)),
            child: BlocConsumer<GetAssignmentBloc, GetAssignmentState>(
                listener: (context, state) {
              if (state is GetProgramsErrorInitial) {
                if (state.message == RELOGIN_FAILURE_MESSAGE) {
                  Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                } else {
                  final snackBar = SnackBar(
                    content: Text(state.message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else if (state is LogOutLoadingState) {
                Navigator.of(context).pop();
              }
            }, builder: (context, state) {
              if (state is GetProgramsLoadingInitial) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is GetProgramsCompleteInitial) {
                return ListView(
                    children: List.generate(
                        state.data.tests?.length??0,
                        (index) => Column(
                          children: [
                            10.ph,

                            CardOfDetailsOfAssignment(
                                  data: state.data.tests?[index]??TestModel(),
                              dataOfTypesOfTest: (state.data.tests?[index].type==null)?TestsTypesModel():state.data.testTypes?.where((element) => element.id== (state.data.tests?[index].type??0)).first??TestsTypesModel(),
                                ),
                            5.ph,

                          ],
                        )));
              } else {
                return const SizedBox();
              }
            })));
  }
}
