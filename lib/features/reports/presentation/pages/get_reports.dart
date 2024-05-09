import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/parent_assets.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/reports_bloc.dart';
import '../manager/cubit/filter_reports_cubit.dart';
import '../widgets/card_report.dart';
import '../../../student_assignment/presentation/widgets/item_selected.dart';
import '../widgets/main_data.dart';

class GetReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedType = context.watch<FilterReportsCubit>().state.selectedType;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocProvider<ReportsBloc>(
            create: (_) => di.sl<ReportsBloc>()..add(GetReportsRequest()),
            child: BlocConsumer<ReportsBloc, ReportsState>(
                listener: (context, state) {
              if (state is GetReportsErrorInitial) {
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
              // return SizedBox();
              if (state is GetReportsLoadingInitial) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is GetReportsCompleteInitial) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.ph,
                    Text(
                      'Total Progress',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                // height: 0,
                                // letterSpacing: 0.44,
                                fontSize: 18,
                              ),
                    ),
                    SizedBox(
                      // aspectRatio: 1.70,
                      height: 250,
                      width: MediaQuery.of(context).size.width - 30,
                      child: LineChart(
                        mainData(context, state.data.getDataOfFlSpot()),
                      ),
                    ),
                    5.ph,
                    Divider(
                      height: 1,
                      color: AppColor.lightGreyColor5.withOpacity(.3),
                    ),
                    10.ph,
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            state.data.testTypes?.length ?? 0,
                            (index) => Row(
                                  children: [
                                    ItemSelected(
                                      itemId:
                                          "${state.data.testTypes?[index].id ?? 0}",
                                      title:
                                          "${state.data.testTypes?[index].name ?? 0}",
                                      currentItemSelected:
                                          "${state.data.testTypes?[index].id ?? 0}" ==
                                                  selectedType
                                              ? true
                                              : false,
                                      onTap: () {
                                        context
                                            .read<FilterReportsCubit>()
                                            .submitNewType(
                                                newType:
                                                    "${state.data.testTypes?[index].id ?? 0}");
                                      },
                                    ),
                                    5.pw,
                                  ],
                                )),
                      ),
                    ),
                    10.ph,
                    Column(
                      children: List.generate(
                          state.data.progress?.length ?? 0,
                          (index) => Column(
                                children: [
                                  CardReport(
                                      // isPassed: false,
                                      data: state.data.progress?[index] ??
                                          TestModel()),
                                  10.ph
                                ],
                              )),
                    )
                  ],
                );
              } else {
                return SizedBox();
              }
            })));
  }
}
