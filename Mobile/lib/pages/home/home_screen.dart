import 'package:flutter/material.dart';
import 'package:front/components/custom_bar.dart';
import 'package:front/pages/home/account_spending.dart';
import 'package:front/pages/home/money_transaction.dart';
import 'package:front/pages/home/monthly_budgets.dart';
import 'package:front/pages/home/total_budgets.dart';
import 'package:front/widgets/navigation_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Container(
                  width: 142,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white,
                        width: 70,
                        height: 40,
                        child: const Center(
                          child: Text(
                            "Manage",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 36, 163, 206),
                        width: 70,
                        height: 40,
                        child: const Center(
                          child: Text(
                            "Manage",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 244, 244, 245),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: IconButton(
                          icon: const Icon(
                            Icons.person,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/account");
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PDG entreprise',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const Text(
                                'Lafatra Niaina',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AutofillHints.addressCityAndState,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TotalBudgets(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: MoneyTransactions(),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: MonthlyBudgets(),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: AccountSpending(),
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
