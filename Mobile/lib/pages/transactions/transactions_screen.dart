import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/components/custom_bar.dart';
import 'package:front/pages/transactions/chart_module/average_transaction_analytics.dart';
import 'package:front/pages/transactions/funds_distributions.dart';
import 'package:front/pages/transactions/new_transaction_form.dart';
import 'package:front/pages/transactions/top_gainer.dart';
import 'package:front/pages/transactions/top_loser.dart';
import 'package:front/widgets/navigation_drawer.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          drawer: const DrawerNavigation(),
          backgroundColor: const Color.fromARGB(255, 245, 245, 248),
          appBar: AppBar(
            toolbarHeight: 90,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 130,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.notifications_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: SvgPicture.asset(
                                'assets/menu.svg',
                                semanticsLabel: 'Filter',
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const NewTransaction(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const AverageTransactionAnalytics(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const TopGainers(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const TopLosers(),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 50,
                  ),
                  child: const FundsDistributions(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            width: double.infinity,
            height: 80,
            child: const CustomBottomBar(
              selectedIndex: 2,
            ),
          ),
        ),
      ],
    );
  }
}
