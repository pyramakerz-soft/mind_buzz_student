import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/parent_assets.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../choose_assignment_reports/presentation/manager/bloc/get_assignment_bloc.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';
import '../../../student_assignment/presentation/manager/filter_assignment_cubit/filter_assignment_cubit.dart';
import '../widgets/card_report.dart';
import '../../../student_assignment/presentation/widgets/item_selected.dart';
import '../widgets/main_data.dart';

class GetReportsScreen extends StatelessWidget {
  final MainDataTestsModel data;
  final String? selectedType;

  const GetReportsScreen(
      {Key? key, required this.data, required this.selectedType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final selectedType = context.watch<FilterAssignmentCubit>().state.selectedType;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.ph,
          Text(
            'Total Progress',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  // height: 0,
                  // letterSpacing: 0.44,
                  fontSize: 18,
                ),
          ),
          if (data.getDataOfFlSpot().isNotEmpty &&
              data.getDataOfFlSpot().keys.first.isNotEmpty) ...{
            SizedBox(
              // aspectRatio: 1.70,
              height: 250,
              width: MediaQuery.of(context).size.width - 30,
              child: LineChart(
                mainData(context, data.getDataOfFlSpot()),
              ),
            ),
          } else ...{
            Container(
              alignment: Alignment.center,
              // aspectRatio: 1.70,
              height: 250,
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'There is not data to show',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          },
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
                  data.testTypes?.length ?? 0,
                  (index) => Row(
                        children: [
                          ItemSelected(
                            itemId: "${data.testTypes?[index].id ?? 0}",
                            title: "${data.testTypes?[index].name ?? 0}",
                            currentItemSelected:
                                "${data.testTypes?[index].id ?? 0}" ==
                                        selectedType
                                    ? true
                                    : false,
                            onTap: () {
                              context
                                  .read<FilterAssignmentCubit>()
                                  .submitNewType(
                                      newType:
                                          "${data.testTypes?[index].id ?? 0}");
                              // final date  = ;
                              context.read<GetAssignmentBloc>().add(
                                  GetReportsRequest(
                                      selectedType: data.testTypes?[index].id
                                          .toString()));
                            },
                          ),
                          5.pw,
                        ],
                      )),
            ),
          ),
          10.ph,
          if (data.progress?.isNotEmpty ?? false) ...{
            _buildListOfReports(context)
          } else ...{
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100.h * 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.emptyReports,
                    height: 100.h,
                  ),
                  Text(
                    'There is no reports data',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          }
        ],
      ),
    );
  }

  Widget _buildListOfReports(BuildContext context) {
    final progressData = data.progress ?? [];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: ListView.separated(
        itemCount: progressData.length,
        itemBuilder: (context, index) {
          return CardReport(
            data: progressData[index] ?? TestModel(),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }
}
