import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MonthlyBudgets extends StatelessWidget {
  const MonthlyBudgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Budgets mentuels",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 185,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MonthlBudgetsState(
                      expenseCategory: "Boissons et nourritures",
                      iconData: Icons.local_drink_rounded,
                      iconsColors: Colors.purple[900]!,
                      backgroundIconsColor: Colors.purple[50]!,
                      percentage: 0.8,
                      fillColor: Colors.purple[50]!,
                      progressColor: Colors.purple,
                    ),
                    MonthlBudgetsState(
                      expenseCategory: "Eléctricité",
                      iconData: Icons.electric_bolt_rounded,
                      iconsColors: Colors.green[900]!,
                      backgroundIconsColor: Colors.green[50]!,
                      percentage: 0.8,
                      fillColor: Colors.green[50]!,
                      progressColor: Colors.green,
                    ),
                    MonthlBudgetsState(
                      expenseCategory: "carburants",
                      iconData: Icons.gas_meter_outlined,
                      iconsColors: Colors.yellow[900]!,
                      backgroundIconsColor: Colors.yellow[50]!,
                      percentage: 0.8,
                      fillColor: Colors.yellow[50]!,
                      progressColor: Colors.yellow,
                    ),
                    MonthlBudgetsState(
                      expenseCategory: "Frais de scolarité",
                      iconData: Icons.school_outlined,
                      iconsColors: Colors.orange[900]!,
                      backgroundIconsColor: Colors.orange[50]!,
                      percentage: 0.8,
                      fillColor: Colors.orange[50]!,
                      progressColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlBudgetsState extends StatelessWidget {
  final String expenseCategory;
  final IconData iconData;
  final Color iconsColors;
  final Color backgroundIconsColor;
  final double percentage;
  final Color fillColor;
  final Color progressColor;

  const MonthlBudgetsState({
    super.key,
    required this.expenseCategory,
    required this.iconData,
    required this.iconsColors,
    required this.backgroundIconsColor,
    required this.percentage,
    required this.fillColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 175,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.8,
            blurRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: backgroundIconsColor,
                  ),
                  child: Icon(
                    iconData,
                    size: 40,
                    color: iconsColors,
                  ),
                ),
                Container(
                  width: 200,
                  height: 60,
                  margin: const EdgeInsets.only(left: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expenseCategory,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "lorem",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: LinearPercentIndicator(
              width: 300,
              animation: true,
              lineHeight: 25,
              percent: percentage,
              center: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Text("${(percentage * 100).toStringAsFixed(1)}%"),
              ),
              backgroundColor: fillColor,
              progressColor: progressColor,
              barRadius: const Radius.circular(60),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: iconsColors,
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
