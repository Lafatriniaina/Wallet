// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AccountSpending extends StatefulWidget {
  const AccountSpending({super.key});

  @override
  _AccountSpendingState createState() => _AccountSpendingState();
}

class _AccountSpendingState extends State<AccountSpending> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 350,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Votre compte de dépense",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CustomPercentIndicator(),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomChartTypeElement(
                      index: 0,
                      selectedIndex: selectedIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: Colors.yellow,
                      categories: "lorem ipsum",
                    ),
                    CustomChartTypeElement(
                      index: 1,
                      selectedIndex: selectedIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: Colors.green,
                      categories: "lorem ipsum",
                    ),
                    CustomChartTypeElement(
                      index: 2,
                      selectedIndex: selectedIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: Colors.blue,
                      categories: "lorem ipsum",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomChartTypeElement(
                      index: 3,
                      selectedIndex: selectedIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: Colors.blue[700]!,
                      categories: "lorem ipsum",
                    ),
                    CustomChartTypeElement(
                      selectedIndex: selectedIndex,
                      index: 4,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      color: Colors.purple,
                      categories: "lorem ipsum",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15,
      percent: 0.4,
      center: const Text(
        "40 hours",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.yellow,
      progressColor: Colors.red,
    );
  }
}

class CustomChartTypeElement extends StatefulWidget {
  final Color color;
  final String categories;
  final Function(int) onSelect;
  final int index;
  final int selectedIndex;

  const CustomChartTypeElement({
    super.key,
    required this.color,
    required this.categories,
    required this.onSelect,
    required this.index,
    required this.selectedIndex,
  });

  @override
  _CustomChartTypeElementState createState() => _CustomChartTypeElementState();
}

class _CustomChartTypeElementState extends State<CustomChartTypeElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: widget.index == widget.selectedIndex
              ? widget.color
              : Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: widget.color,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text(
            widget.categories,
            style: TextStyle(
                color: widget.index == widget.selectedIndex
                    ? Colors.white
                    : widget.color),
          ),
        ),
      ),
    );
  }
}
