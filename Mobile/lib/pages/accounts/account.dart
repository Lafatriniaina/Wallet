import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/components/custom_bar.dart';
import 'package:front/pages/accounts/transaction_curve.dart';
import 'package:front/pages/home/home_screen.dart';
import 'package:front/widgets/navigation_drawer.dart';

class DetailsAccount extends StatelessWidget {
  const DetailsAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          drawer: const DrawerNavigation(),
          backgroundColor: const Color.fromARGB(255, 238, 237, 242),
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
                  margin: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
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
          body: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TransactionCurve(),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            width: double.infinity,
            height: 80,
            child: const CustomBottomBar(
              selectedIndex: 3,
            ),
          ),
        ),
      ],
    );
  }
}
