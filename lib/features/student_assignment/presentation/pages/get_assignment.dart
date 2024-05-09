import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/app_color.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/parent_assets.dart';
import '../../../../core/utils.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../reports/presentation/manager/cubit/filter_reports_cubit.dart';
import '../../domain/entities/tests_types_model.dart';
import '../manager/index_of_switch_cubit.dart';
import '../manager/bloc/get_assignment_bloc.dart';
import '../manager/bottom_cubit/bottom_cubit.dart';
import '../widgets/bottom_sheet_select_day.dart';
import '../widgets/card_of_details_assignment.dart';
import '../widgets/filter_bottom_sheet_get_assignment.dart';
import '../widgets/switch_button.dart';
import '../../../reports/presentation/pages/get_reports.dart';

class GetAssignmentScreen extends StatelessWidget {
  final String programName;
  final int programId;

  const GetAssignmentScreen(
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
            context.read<BottomCubit>().submitListAssignmentTypes(
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
                                        );
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
                    child: const SwitchButton()),
                if (indexOfSwitchCubit == 0) ...{
                  if (state is GetProgramsLoadingInitial) ...{
                    const Center(child: CupertinoActivityIndicator())
                  } else if (state is GetProgramsCompleteInitial) ...{
                    Column(
                        children: List.generate(
                            state.data.tests?.length ?? 0,
                            (index) => Column(
                                  children: [
                                    10.ph,
                                    CardOfDetailsOfAssignment(
                                      data: state.data.tests?[index] ??
                                          TestModel(),
                                      dataOfTypesOfTest:
                                          (state.data.tests?[index].type ==
                                                  null)
                                              ? TestsTypesModel()
                                              : state.data.testTypes
                                                      ?.where((element) =>
                                                          element.id ==
                                                          (state
                                                                  .data
                                                                  .tests?[index]
                                                                  .type ??
                                                              0))
                                                      .first ??
                                                  TestsTypesModel(),
                                    ),
                                    5.ph,
                                  ],
                                )))
                  } else ...{
                    const SizedBox()
                  }
                } else ...{
                  BlocProvider(
                      create: (_) => FilterReportsCubit(),
                      child: GetReportsScreen())
                }
              ]));
        }));
  }
}
