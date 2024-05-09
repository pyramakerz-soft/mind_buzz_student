import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/parent_assets.dart';
import '../../../../core/vars.dart';
import '../../../login/presentation/widgets/text_field_widget.dart';
import '../../../student_assignment/presentation/manager/filter_assignment_cubit/filter_assignment_cubit.dart';
import 'bottom_sheet_select_day.dart';
import '../../../student_assignment/presentation/widgets/item_selected.dart';
import '../../../../core/injection/injection_container.dart' as di;

class FilterBottomSheetGetAssignment extends StatelessWidget {
  final void Function(int programId, String? status, String? fromDate,
      String? toDate, List<String>? listOfTypes) addFilter;
  final int programId;
  const FilterBottomSheetGetAssignment(
      {Key? key, required this.addFilter, required this.programId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedType =
        context.watch<FilterAssignmentCubit>().state.selectedType;
    final selectedState =
        context.watch<FilterAssignmentCubit>().state.selectedState;
    final selectedFromDate =
        context.watch<FilterAssignmentCubit>().state.selectedFromDate;
    final selectedToDate =
        context.watch<FilterAssignmentCubit>().state.selectedToDate;
    final testTypes = context.watch<FilterAssignmentCubit>().state.testTypes;
    // final programId = context.watch<BottomCubit>().state.programId;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.blackRed,
                blurRadius: 5,
                offset: Offset(0, 9),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: AppColor.whiteRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.42),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              )
            ],
          ),
        ),
        10.ph,
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height/2,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // color: Colors.white,
          // height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              Text(
                'Date',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      // height: 0,
                      // letterSpacing: 0.44,
                      fontSize: 22,
                    ),
              ),
              4.ph,
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: TextFieldWidget(
                          controler:
                              TextEditingController(text: selectedFromDate),
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context0) {
                                  return BottomSheetSelectDay(
                                    isFrom: true,
                                    currentDate: selectedFromDate != null
                                        ? DateTime.parse(selectedFromDate)
                                        : DateTime.now(),
                                  );
                                });
                          },
                          hintText: 'From DD/MM/YY',
                          fontSize: 12,
                          borderRadius: 18,
                          fillColor: AppColor.whiteBlue2,
                          borderSideColor: Colors.transparent,
                          rightWidget: Container(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              ParentImages.imageDate,
                              height: 10,
                              width: 10,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: TextFieldWidget(
                          controler:
                              TextEditingController(text: selectedToDate),
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context0) {
                                  return BottomSheetSelectDay(
                                    isFrom: false,
                                    currentDate: selectedToDate != null
                                        ? DateTime.parse(selectedToDate)
                                        : DateTime.now(),
                                  );
                                });
                          },
                          hintText: 'To DD/MM/YY',
                          fontSize: 12,
                          borderRadius: 18,
                          fillColor: AppColor.whiteBlue2,
                          borderSideColor: Colors.transparent,
                          rightWidget: Container(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              ParentImages.imageDate,
                              height: 10,
                              width: 10,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              20.ph,
              Text(
                'Assignment Status',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      // height: 0,
                      // letterSpacing: 0.44,
                      fontSize: 22,
                    ),
              ),
              16.ph,
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                    TestTypes.listOfTestTypes.length,
                    (index) => ItemSelected(
                          itemId: TestTypes.listOfTestTypes[index],
                          title: TestTypes.listOfTestTypes[index],
                          currentItemSelected: selectedState?.contains(
                                  TestTypes.listOfTestTypes[index]) ??
                              false,
                          onTap: () {
                            context
                                .read<FilterAssignmentCubit>()
                                .submitAssignmentStatus(
                                    newStatus:
                                        TestTypes.listOfTestTypes[index]);
                            print(
                                "##:${context.read<FilterAssignmentCubit>().state}");
                          },
                        )),
              ),
              20.ph,
              Text(
                'Assignments Type',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      // height: 0,
                      // letterSpacing: 0.44,
                      fontSize: 22,
                    ),
              ),
              16.ph,
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                    testTypes?.length ?? 0,
                    (index) => ItemSelected(
                        onTap: () async {
                          await context
                              .read<FilterAssignmentCubit>()
                              .submitAssignmentType(
                                  newStatus: "${testTypes?[index].id ?? 0}");
                          print(
                              "##:${context.read<FilterAssignmentCubit>().state}");
                        },
                        itemId: "${testTypes?[index].id ?? 0}",
                        title: testTypes?[index].name ?? '',
                        currentItemSelected: selectedType
                                ?.contains("${testTypes?[index].id ?? 0}") ??
                            false)),
              ),
              20.ph,
              GestureDetector(
                onTap: () {
                  addFilter(programId, selectedState, selectedFromDate,
                      selectedToDate, selectedType ?? []);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.darkBlueColor),
                  child: Text(
                    'Done',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              20.ph
            ],
          ),
        ),
      ],
    );
  }
}
