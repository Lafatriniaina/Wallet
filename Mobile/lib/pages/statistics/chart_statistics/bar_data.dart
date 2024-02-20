// ignore_for_file: non_constant_identifier_names

import 'package:front/pages/statistics/chart_statistics/individual_bar.dart';

class BarData {
  final double SunAmount;
  final double MonAmount;
  final double TueAmount;
  final double WedAmount;
  final double ThuAmount;
  final double FriAmount;
  final double SatAmount;

  BarData({
    required this.SunAmount,
    required this.MonAmount,
    required this.TueAmount,
    required this.WedAmount,
    required this.ThuAmount,
    required this.FriAmount,
    required this.SatAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: SunAmount),
      IndividualBar(x: 1, y: MonAmount),
      IndividualBar(x: 2, y: TueAmount),
      IndividualBar(x: 3, y: WedAmount),
      IndividualBar(x: 4, y: ThuAmount),
      IndividualBar(x: 5, y: FriAmount),
      IndividualBar(x: 6, y: SatAmount),
    ];
  }
}
