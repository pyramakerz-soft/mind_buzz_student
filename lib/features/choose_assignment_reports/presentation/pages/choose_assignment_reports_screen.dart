import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/parent_assets.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../reports/presentation/manager/cubit/filter_reports_cubit.dart';
import '../../../reports/presentation/pages/get_reports.dart';
import '../../../student_assignment/presentation/manager/bottom_cubit/filter_assignment_cubit.dart';
import '../../../student_assignment/presentation/manager/index_of_switch_cubit.dart';
import '../../../student_assignment/presentation/pages/get_assignment.dart';
import '../../../student_assignment/presentation/widgets/bottom_sheet_select_day.dart';
import '../../../student_assignment/presentation/widgets/filter_bottom_sheet_get_assignment.dart';
import '../../../student_assignment/presentation/widgets/switch_button.dart';
import '../manager/bloc/get_assignment_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

class ChooseAssignmentReportsScreen extends StatelessWidget {
  final String programName;
  final int programId;

  const ChooseAssignmentReportsScreen(
      {Key? key, required this.programName, required this.programId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final indexOfSwitchCubit =
        context.select((IndexOfSwitchCubit value) => value.state);

    return BlocProvider<GetAssignmentBloc>(
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
          } else if (state is GetProgramsCompleteInitial) {
            context.read<FilterAssignmentCubit>().submitListAssignmentTypes(
                newStatus: state.data.testTypes ?? [],
                programId: programId.toString());
          }
        }, builder: (context, state) {
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
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                // height: 0,
                                // letterSpacing: 0.44,
                                fontSize: 22,
                              ),
                        ),
                        actions: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                if (indexOfSwitchCubit == 0) {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context0) {
                                        return FilterBottomSheetGetAssignment(
                                          addFilter: (int programId,
                                                  String? status,
                                                  String? fromDate,
                                                  String? toDate,
                                                  List<String>? listOfTypes) =>
                                              context
                                                  .read<GetAssignmentBloc>()
                                                  .add(GetAssignmentRequest(
                                                      programId: programId,
                                                      status: status,
                                                      fromDate: fromDate,
                                                      toDate: toDate,
                                                      listOfTypes:
                                                          listOfTypes)),
                                          programId: programId,
                                        );
                                      });
                                } else {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (BuildContext context0) {
                                        return BottomSheetSelectDay(
                                            isFrom: true,
                                            isReport: (String? date) => context
                                                .read<GetAssignmentBloc>()
                                                .add(GetReportsRequest(
                                                    date: date)));
                                      });
                                }
                              },
                              child: Container(
                                // width: 10,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.42),
                                    color: AppColor.whiteRed),
                                child: Image.asset(
                                  (indexOfSwitchCubit == 0)
                                      ? ParentImages.imageFilter
                                      : ParentImages.imageDate,
                                  height: 16,
                                  width: 16,
                                ),
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
              body: ListView(children: [
                15.ph,
                Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: SwitchButton(
                      getAssignment: () {
                        context
                            .read<GetAssignmentBloc>()
                            .add(GetAssignmentRequest(programId: programId));
                      },
                      getReports: () {
                        context
                            .read<GetAssignmentBloc>()
                            .add(GetReportsRequest());
                      },
                    )),
                if (state is GetProgramsLoadingInitial) ...{
                  const Center(child: CupertinoActivityIndicator())
                } else if (state is GetProgramsCompleteInitial &&
                    indexOfSwitchCubit == 0) ...{
                  GetAssignmentScreen(
                    data: state.data,
                  )
                } else if (state is GetProgramsCompleteInitial &&
                    indexOfSwitchCubit == 1) ...{
                  BlocProvider(
                      create: (_) => FilterReportsCubit(),
                      child: GetReportsScreen(
                        data: state.data,
                      ))
                } else ...{
                  const SizedBox()
                }
              ]));
        }));
  }
}
