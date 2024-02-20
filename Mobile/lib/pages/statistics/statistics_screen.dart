import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/components/custom_bar.dart';
import 'package:front/pages/statistics/chart_statistics/chart_statistics.dart';
import 'package:front/pages/statistics/total_balance.dart';
import 'package:front/widgets/navigation_drawer.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

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
                  "Statistiques",
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
          body: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TotalBalance(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 50,
                  ),
                  child: ChartStatistics(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            width: double.infinity,
            height: 80,
            child: const CustomBottomBar(
              selectedIndex: 1,
            ),
          ),
        ),
      ],
    );
  }
}
