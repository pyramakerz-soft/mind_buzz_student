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
import '../../../choose_assignment_reports/presentation/manager/bloc/get_assignment_bloc.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../reports/presentation/manager/cubit/filter_reports_cubit.dart';
import '../../domain/entities/main_data_test.dart';
import '../../domain/entities/tests_types_model.dart';
import '../manager/index_of_switch_cubit.dart';
import '../manager/bottom_cubit/filter_assignment_cubit.dart';
import '../widgets/bottom_sheet_select_day.dart';
import '../widgets/card_of_details_assignment.dart';
import '../widgets/filter_bottom_sheet_get_assignment.dart';
import '../widgets/switch_button.dart';
import '../../../reports/presentation/pages/get_reports.dart';

class GetAssignmentScreen extends StatelessWidget {
  final MainDataTestsModel data;

  const GetAssignmentScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final indexOfSwitchCubit =
    //     context.select((IndexOfSwitchCubit value) => value.state);

    return Column(
        children: List.generate(
            data.tests?.length ?? 0,
            (index) => Column(
                  children: [
                    10.ph,
                    CardOfDetailsOfAssignment(
                      data: data.tests?[index] ?? TestModel(),
                      dataOfTypesOfTest: (data.tests?[index].type == null)
                          ? TestsTypesModel()
                          : data.testTypes
                                  ?.where((element) =>
                                      element.id ==
                                      (data.tests?[index].type ?? 0))
                                  .first ??
                              TestsTypesModel(),
                    ),
                    5.ph,
                  ],
                )));
  }
}
