import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/vars.dart';
import '../../../login/presentation/widgets/text_field_widget.dart';
import '../manager/bottom_cubit/bottom_cubit.dart';
import 'bottom_sheet_select_day.dart';
import 'item_selected.dart';

class FilterBottomSheetGetAssignment extends StatelessWidget {
  const FilterBottomSheetGetAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<BottomCubit>().state.selectedType;
    final selectedState = context.watch<BottomCubit>().state.selectedState;
    final testTypes = context.watch<BottomCubit>().state.testTypes;
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
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: TextFieldWidget(
                          controler: TextEditingController(),
                          readOnly: true,
                          onTap: (){
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                isScrollControlled:true,
                                builder: (BuildContext context0) {
                                  return  BottomSheetSelectDay();
                                });
                          },
                          hintText: 'From DD/MM/YY',
                          fontSize: 12,
                          borderRadius: 18,
                          borderSideColor: Colors.transparent,
                          rightWidget: const Icon(
                            Icons.calendar_month,
                            color: AppColor.lightGreyColor3,
                          )),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: TextFieldWidget(
                          controler: TextEditingController(),
                          readOnly: true,
                          onTap: (){
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                isScrollControlled:true,
                                builder: (BuildContext context0) {
                                  return  BottomSheetSelectDay();
                                });
                          },
                          hintText: 'From DD/MM/YY',
                          fontSize: 12,
                          borderRadius: 18,
                          borderSideColor: Colors.transparent,
                          rightWidget: const Icon(
                            Icons.calendar_month,
                            color: AppColor.lightGreyColor3,
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
                                .read<BottomCubit>()
                                .submitAssignmentStatus(
                                    newStatus:
                                        TestTypes.listOfTestTypes[index]);
                            print("##:${context.read<BottomCubit>().state}");
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
                        onTap: () {
                          context.read<BottomCubit>().submitAssignmentType(
                              newStatus: "${testTypes?[index].id ?? 0}");
                          print("##:${context.read<BottomCubit>().state}");
                        },
                        itemId: "${testTypes?[index].id ?? 0}",
                        title: testTypes?[index].name ?? '',
                        currentItemSelected: selectedType
                                ?.contains("${testTypes?[index].id ?? 0}") ??
                            false)),
              ),
              20.ph,
              GestureDetector(
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
