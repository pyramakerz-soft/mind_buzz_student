import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_svg_images.dart';
import 'package:mind_buzz_refactor/features/home/presentation/widgets/indicator.dart';

class CirclePieChart extends StatefulWidget {
  final Map<String, num> data;
  final Function(String? key) onSectionTouch;
  final Function() onReset;

  const CirclePieChart(
      {Key? key,
      required this.data,
      required this.onSectionTouch,
      required this.onReset})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CirclePieChartState();
}

class _CirclePieChartState extends State<CirclePieChart> {
  int touchedIndex = -1;
  String? selectedSection;
  final colors = const [
    AppColor.redColor4,
    AppColor.darkBlueColor,
    AppColor.resetText
  ];
  @override
  Widget build(BuildContext context) {
    final isEmpty = widget.data.entries.every((e) => e.value == 0);
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SvgPicture.asset(
                      AppSvgImages.emptyPieChart,
                      color: const Color(0xFFD9D9D9),
                    ),
                  )
                : PieChart(
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
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                            final touchedKey =
                                widget.data.keys.elementAt(touchedIndex);

                            if (touchedKey != selectedSection) {
                              selectedSection = touchedKey;
                              widget.onSectionTouch(selectedSection);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                if (selectedSection == null) return;
                widget.onReset();
                setState(() {
                  selectedSection = null;
                });
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.42),
                      border: Border.all(
                        color: AppColor.greyColor,
                      )),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppSvgImages.resetIcon),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Reset'),
                    ],
                  )),
            ),
            const SizedBox(height: 5),
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
                    percentage: widget.data[key]?.toDouble(),
                    percentageColor: colors[index],
                    isSquare: true,
                  ),
                );
              }).toList(),
            ),
          ],
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
      final isEmpty = entry.value == 0;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isSelected ? 70.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: isEmpty
            ? AppColor.greyColor
            : isDefault
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
