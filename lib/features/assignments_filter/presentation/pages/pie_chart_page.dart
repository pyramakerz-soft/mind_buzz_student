import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:games_models/games_models.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/border_manager.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_cubit.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_state.dart';
import '../../../../core/injection/injection_container.dart' as di;
import 'package:mind_buzz_refactor/features/calender/presentation/widgets/assignment_widget.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/pie_chart_design.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/switch_bar.dart';

class PieChartPage extends StatefulWidget {
  final bool isAssignment;
  const PieChartPage({super.key, required this.isAssignment});

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<PieChartCubit>()..getAssignments(),
      child: BlocListener<PieChartCubit, PieChartState>(
        listener: (context, state) {
          if (state.isError) {
            final snackBar = SnackBar(
              content: Text(state.message!),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Scaffold(
          appBar: customAppBar(
            context: context,
            title: widget.isAssignment ? 'Assignments' : 'Reports',
            action: widget.isAssignment
                ? null
                : GestureDetector(
                    onTap: () {},
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
          body: BlocBuilder<PieChartCubit, PieChartState>(
            builder: (context, state) {
              final pieChartCubit = context.read<PieChartCubit>();
              final selectedProgram = state.selectedProgram?.courseName;
              final selectedSection = state.sectionName;

              return Column(
                children: [
                  widget.isAssignment
                      ? _buildDropDownList(
                          selectedProgram, state, pieChartCubit)
                      : const SizedBox(),
                  _buildPieChartDesign(state, pieChartCubit),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state.tests.isEmpty && !state.isLoading)
                    _buildEmptyCase(),
                  if (state.isLoading) _buildLoadingCase(),
                  if (state.tests.isNotEmpty && !state.isLoading) ...[
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
          ),
        ),
      ),
    );
  }

  Widget _buildListOfAssignments(PieChartState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.tests.length,
        itemBuilder: (context, index) {
          return AssignmentWidget(
            singleTest: state.tests[index],
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
          text: widget.isAssignment
              ? selectedSection == null
                  ? 'All Assignments'
                  : '$selectedSection Assignments'
              : 'All Reports',
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
        CustomText(
          text: '${state.tests.length} tasks',
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
      data: widget.isAssignment
          ? {
              'Pending': state.percentages?.pending ?? 0,
              'Overdue': state.percentages?.overdue ?? 0,
              'Completed': state.percentages?.completed ?? 0,
            }
          : {
              '1 Star': 30,
              '2 Stars': 10,
              '3 Stars': 60,
            },
      onSectionTouch: pieChartCubit.changeStatus,
    );
  }

  Widget _buildDropDownList(String? selectedProgram, PieChartState state,
      PieChartCubit pieChartCubit) {
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
          await pieChartCubit.changeProgram(selectedCourse.programId?.toInt());
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
