import 'package:flutter/material.dart';
import 'package:front/pages/transactions/chart_module/chart_transaction.dart';

class AverageTransactionAnalytics extends StatelessWidget {
  const AverageTransactionAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 560,
      decoration: BoxDecoration(
        color: Colors.white,
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
        children: [
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Solde principal",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "900.203.842 MGA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 25,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[500],
                      ),
                      child: const Center(
                        child: Text(
                          "Lorem",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "900.203.842 MGA",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 270,
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: LineChartSample2(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 160,
            child: Row(
              children: [
                CustomContainer(
                  textHeader: "Shopping",
                  primaryColor: Colors.pink[50]!,
                  secondaryColor: Colors.pink[800]!,
                  icon: Icons.shopping_bag_rounded,
                  mount: "200.000 MGA",
                ),
                CustomContainer(
                  textHeader: "Connexions",
                  primaryColor: Colors.orange[50]!,
                  secondaryColor: Colors.orange[800]!,
                  icon: Icons.signal_wifi_statusbar_null_rounded,
                  mount: "150.000 MGA",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String textHeader;
  final Color primaryColor;
  final Color secondaryColor;
  final IconData icon;
  final String mount;

  const CustomContainer({
    super.key,
    required this.textHeader,
    required this.primaryColor,
    required this.secondaryColor,
    required this.icon,
    required this.mount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor, // Colors.purple[50],
              ),
              child: Icon(
                icon,
                color: secondaryColor, // Colors.purple[800],
              ),
            ),
            Text(
              textHeader,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              mount,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 100,
              height: 25,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green[500],
              ),
              child: const Center(
                child: Text(
                  "Lorem ipsum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
