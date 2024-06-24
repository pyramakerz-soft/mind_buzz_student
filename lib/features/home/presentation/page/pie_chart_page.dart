import 'package:flutter/material.dart';
import 'package:games_models/games_models.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/border_manager.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';
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
    const programs = [
      ProgramModel(name: 'All Programs', id: 0),
      ProgramModel(name: 'Program 1', id: 1),
      ProgramModel(name: 'Program 2', id: 2),
      ProgramModel(name: 'Program 3', id: 3),
    ];
    String? _selectedProgram;
    return Scaffold(
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
      body: Column(
        children: [
          widget.isAssignment
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField<String>(
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
                    value: _selectedProgram,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedProgram =
                            newValue!; // Update the selected item
                      });
                    },
                    items: programs
                        .map<DropdownMenuItem<String>>((ProgramModel value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name ?? ''),
                      );
                    }).toList(),
                  ),
                )
              : const SizedBox(),
          CirclePieChart(
            data: widget.isAssignment
                ? {
                    'Pending': 30,
                    'Overdue': 5,
                    'Completed': 60,
                  }
                : {
                    '1 Star': 30,
                    '2 Stars': 10,
                    '3 Stars': 60,
                  },
            onSectionTouch: (sectionName) {},
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: widget.isAssignment
                ? _selectedProgram == null
                    ? 'All Assignments'
                    : _selectedProgram!
                : 'All Reports',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
