import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/pages/add_all_forms/add_salary.dart';
import 'package:front/pages/add_all_forms/add_transaction.dart';
import 'package:front/widgets/navigation_drawer.dart';

class AllFormsPage extends StatelessWidget {
  const AllFormsPage({super.key});

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
          body: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: AddTransaction(),
                ),
                AddSalary(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
