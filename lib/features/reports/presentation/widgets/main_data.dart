import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_color.dart';
import '../../domain/entities/month_model.dart';
import 'bottom_title_widgets.dart';

LineChartData mainData(
    BuildContext context, Map<List<String>, List<FlSpot>> tprogress) {
  return LineChartData(
    gridData: const FlGridData(
      show: false,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1,
          getTitlesWidget: (size, meta) =>
              bottomTitleWidgets(size, meta, context, tprogress.keys.first),
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
      border: Border.all(color: Colors.transparent),
    ),
    minX: 0,
    maxX: double.parse("${tprogress.keys.first.length}"),
    minY: 0,
    maxY: 100,
    lineBarsData: [
      LineChartBarData(
        spots: tprogress.values.first,
        isCurved: true,
        gradient: const LinearGradient(
          colors: [AppColor.darkBlueColor, AppColor.darkBlueColor],
        ),
        barWidth: 2,
        isStrokeCapRound: false,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.darkBlueColor, Colors.white10],
          ),
        ),
      ),
    ],
  );
}
