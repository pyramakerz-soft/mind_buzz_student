import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/indicator.dart';

class CirclePieChart extends StatefulWidget {
  final Map<String, int> data;
  final Function(String key) onSectionTouch;

  const CirclePieChart(
      {Key? key, required this.data, required this.onSectionTouch})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CirclePieChartState();
}

class _CirclePieChartState extends State<CirclePieChart> {
  int touchedIndex = -1;
  String? selectedSection;
  final colors = const [
    AppColor.darkBlueColor,
    AppColor.redColor4,
    AppColor.resetText
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                      final touchedKey =
                          widget.data.keys.elementAt(touchedIndex);
                      widget.onSectionTouch(touchedKey);
                      if (touchedKey == selectedSection) {
                        selectedSection = null;
                      } else {
                        selectedSection = touchedKey;
                      }
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 5,
                centerSpaceRadius: 30,
                sections: showingSections(),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.data.keys.map((key) {
            int index = widget.data.keys.toList().indexOf(key);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Indicator(
                color: colors[index % colors.length],
                title: key,
                percentage: widget.data[key],
                percentageColor: colors[index],
                isSquare: true,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          width: 28,
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return widget.data.entries.map((entry) {
      int index = widget.data.keys.toList().indexOf(entry.key);
      String key = entry.key;
      final isTouched = index == touchedIndex;
      final isSelected = key == selectedSection;
      final isDefault = selectedSection == null;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isSelected ? 70.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: isDefault
            ? colors[index % colors.length]
            : isSelected
                ? colors[index % colors.length]
                : colors[index % colors.length].withOpacity(0.3),
        value: entry.value.toDouble(),
        title: '',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColor.textFieldColor,
          shadows: shadows,
        ),
      );
    }).toList();
  }
}
