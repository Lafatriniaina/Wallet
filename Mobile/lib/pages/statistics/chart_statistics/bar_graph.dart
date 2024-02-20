// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/statistics/chart_statistics/bar_data.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData barDataLists = BarData(
      SunAmount: weeklySummary[0],
      MonAmount: weeklySummary[1],
      TueAmount: weeklySummary[2],
      WedAmount: weeklySummary[3],
      ThuAmount: weeklySummary[4],
      FriAmount: weeklySummary[5],
      SatAmount: weeklySummary[6],
    );

    barDataLists.initializeBarData();

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: GetBottomTitles,
            ),
          ),
        ),
        barGroups: barDataLists.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.purple,
                    width: 25,
                    borderRadius: BorderRadius.circular(2),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget GetBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "Sun",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "Mon",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "Tue",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "Wed",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "Thu",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "Thr",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "Thr",
        style: style,
      );
      break;
    default:
      text = const Text(
        "",
        style: style,
      );
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
