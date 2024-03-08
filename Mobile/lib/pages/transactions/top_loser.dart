// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:front/services/transaction_service.dart';

class TopLosers extends StatefulWidget {
  const TopLosers({Key? key}) : super(key: key);

  @override
  _TopLosersState createState() => _TopLosersState();
}

class _TopLosersState extends State<TopLosers> {
  final TransactionService _transactionService = TransactionService();
  List<dynamic>? _topLosers;

  @override
  void initState() {
    super.initState();
    _fetchTopLosers();
  }

  Future<void> _fetchTopLosers() async {
    try {
      double userId = 13;
      List<dynamic> topLosers =
          await _transactionService.fetchTopLosers(userId);
      setState(() {
        _topLosers = topLosers;
      });
    } catch (e) {
      print("Erreur lors de la récupération des meilleurs perdants : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              bottom: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Les meilleurs profits",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 360,
                  color: Colors.red[500],
                ),
                Expanded(
                  child: _topLosers == null
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: _topLosers!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _topLosers![index]['transaction_type'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _topLosers![index]
                                            ['category__category_name'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "Montants",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${_topLosers![index]['total']} MGA",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
