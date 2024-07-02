import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/border_manager.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/reports_percentages.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_cubit.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_state.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/widgets/due_date_bottom_sheet.dart';
import '../../../../core/injection/injection_container.dart' as di;
import 'package:mind_buzz_refactor/features/calender/presentation/widgets/assignment_widget.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/pie_chart_design.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';

class PieChartPage extends StatelessWidget {
  final bool isAssignment;
  final int? programId;
  final String? programName;
  const PieChartPage(
      {super.key,
      required this.isAssignment,
      this.programId,
      this.programName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: isAssignment
          ? (_) => di.sl<PieChartCubit>()..getAssignments()
          : (_) => di.sl<PieChartCubit>()..getReports(programId: programId!),
      child: BlocListener<PieChartCubit, PieChartState>(
        listener: (context, state) {
          if (state.isError) {
            final snackBar = SnackBar(
              content: Text(state.message!),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Builder(builder: (context) {
          final cubit = context.read<PieChartCubit>();
          return Scaffold(
            appBar: customAppBar(
              context: context,
              title: isAssignment ? 'Assignments' : 'Reports',
              action: isAssignment
                  ? null
                  : GestureDetector(
                      onTap: () async {
                        var result = await showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (BuildContext context0) {
                              return DueDateBottomSheet(
                                isFromNow: false,
                                onReset: () {
                                  cubit.resetDate(programId!);
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                        if (result != null) {
                          cubit.getReportsByDate(
                            programId: programId!,
                            startDate:
                                result['startDate'].toString().substring(0, 10),
                            endDate:
                                result['endDate'].toString().substring(0, 10),
                          );
                        }
                      },
                      child: Container(
                        // width: 10,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.42),
                            color: AppColor.whiteRed),
                        child: Image.asset(
                          ParentImages.imageFilter,
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ),
            ),
            body: Builder(builder: (context) {
              final pieChartCubit = context.read<PieChartCubit>();

              return BlocBuilder<PieChartCubit, PieChartState>(
                builder: (context, state) {
                  final selectedSection = state.sectionName;
                  return Column(
                    children: [
                      isAssignment
                          ? _buildDropDownList(context)
                          : const SizedBox(),
                      _buildPieChartDesign(state, pieChartCubit),
                      const SizedBox(
                        height: 10,
                      ),
                      if (isAssignment
                          ? (state.tests.isEmpty && !state.isLoading)
                          : (state.progress.isEmpty && !state.isLoading))
                        _buildEmptyCase(),
                      if (state.isLoading) _buildLoadingCase(),
                      if (isAssignment
                          ? (state.tests.isNotEmpty && !state.isLoading)
                          : (state.progress.isNotEmpty &&
                              !state.isLoading)) ...[
                        _buildAssignmentsCounts(selectedSection, state),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildListOfAssignments(state),
                      ],
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              );
            }),
          );
        }),
      ),
    );
  }

  Widget _buildListOfAssignments(PieChartState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: isAssignment ? state.tests.length : state.progress.length,
        itemBuilder: (context, index) {
          return AssignmentWidget(
            isAssignment: isAssignment,
            singleTest:
                isAssignment ? state.tests[index] : state.progress[index],
          );
        },
      ),
    );
  }

  Widget _buildAssignmentsCounts(String? selectedSection, PieChartState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 20,
        ),
        CustomText(
          text: isAssignment
              ? selectedSection == null
                  ? 'All Assignments'
                  : '$selectedSection Assignments'
              : selectedSection == null
                  ? 'All Reports'
                  : '$selectedSection Assignments',
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
        CustomText(
          text: isAssignment
              ? '${state.tests.length} tasks'
              : '${state.progress.length} tasks',
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Widget _buildLoadingCase() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.darkBlueColor,
        ),
      ),
    );
  }

  Widget _buildEmptyCase() {
    return const Expanded(
      child: Center(
        child: CustomText(text: 'No Data'),
      ),
    );
  }

  Widget _buildPieChartDesign(
      PieChartState state, PieChartCubit pieChartCubit) {
    return CirclePieChart(
      data: isAssignment
          ? {
              'Overdue': state.assignmentsPercentages?.overdue ?? 0,
              'Pending': state.assignmentsPercentages?.pending ?? 0,
              'Completed': state.assignmentsPercentages?.completed ?? 0,
            }
          : {
              '1 Star': state.reportsPercentages?.oneStar ?? 0,
              '2 Stars': state.reportsPercentages?.twoStar ?? 0,
              '3 Stars': state.reportsPercentages?.threeStar ?? 0,
            },
      onSectionTouch: (String? status) {
        isAssignment
            ? pieChartCubit.changeStatus(status)
            : pieChartCubit.changeStars(programId!, status);
      },
      onReset: isAssignment
          ? () => pieChartCubit.resetStatus()
          : () => pieChartCubit.resetReports(programId!),
    );
  }

  Widget _buildDropDownList(BuildContext context) {
    final pieChartCubit = context.read<PieChartCubit>();
    final state = pieChartCubit.state;
    final selectedProgram = state.selectedProgram?.courseName;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: AppColor.darkGreyText),
        decoration: InputDecoration(
          enabledBorder: getRegularBorderStyle(),
          focusedBorder: getFocusedBorderStyle(),
          errorBorder: getErroredBorderStyle(),
          focusedErrorBorder: getErroredBorderStyle(),
        ),
        hint: const Text(
          'All Programs',
          textAlign: TextAlign.center,
        ),
        value: selectedProgram,
        onChanged: (String? newValue) async {
          final selectedCourse = state.courses
              .firstWhere((course) => course.courseName == newValue);
          pieChartCubit.changeProgram(selectedCourse.programId?.toInt());
        },
        dropdownStyleData: const DropdownStyleData(
          elevation: 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        items: state.courses.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value.courseName,
            child: Text(value.courseName ?? ''),
          );
        }).toList(),
      ),
    );
  }
}
