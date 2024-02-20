import 'package:flutter/material.dart';

class TransactionCurve extends StatelessWidget {
  const TransactionCurve({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(
            left: 20,
            bottom: 20,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Comptes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Comptes principals",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 170,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: double.infinity,
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 68, 117),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Row(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
