// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:front/pages/statistics/chart_statistics/bar_graph.dart';

class ChartStatistics extends StatefulWidget {
  const ChartStatistics({super.key});

  @override
  _ChartStatisticsState createState() => _ChartStatisticsState();
}

class _ChartStatisticsState extends State<ChartStatistics> {
  List<double> WeekSummary = [
    4.40,
    2.50,
    45.25,
    10.50,
    100.56,
    90.14,
    80.48,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.white,
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: BarGraph(
            weeklySummary: WeekSummary,
          ),
        ),
      ),
    );
  }
}
