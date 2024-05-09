import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import 'bottom_title_widgets.dart';

LineChartData mainData(BuildContext context) {
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
          getTitlesWidget:(size, meta)=> bottomTitleWidgets(size,meta , context),
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
      border: Border.all(color:  Colors.transparent),
    ),
    minX: 0,
    maxX: 12,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots:  [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 0),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
          FlSpot(13.6, 0),
          FlSpot(16.2, 4),
        ],
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
