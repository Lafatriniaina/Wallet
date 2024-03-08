// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:front/services/transaction_service.dart';

class TopGainers extends StatefulWidget {
  const TopGainers({Key? key}) : super(key: key);

  @override
  _TopGainersState createState() => _TopGainersState();
}

class _TopGainersState extends State<TopGainers> {
  final TransactionService _transactionService = TransactionService();
  List<dynamic>? _topGainers;

  @override
  void initState() {
    super.initState();
    _fetchTopGainers();
  }

  Future<void> _fetchTopGainers() async {
    try {
      double userId = 13;
      List<dynamic> topGainers =
          await _transactionService.fetchTopGainers(userId);
      setState(() {
        _topGainers = topGainers;
      });
    } catch (e) {
      print("Erreur lors de la récupération des meilleurs gagnants : $e");
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
                  color: Colors.green[500],
                ),
                Expanded(
                  child: _topGainers == null
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: _topGainers!.length,
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
                                        _topGainers![index]['transaction_type'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _topGainers![index]
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
                                        "${_topGainers![index]['total']} MGA",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
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
