import 'package:front/pages/transactions/transactions_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MoneyTransactions extends StatefulWidget {
  const MoneyTransactions({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoneyTransactionsState createState() => _MoneyTransactionsState();
}

class _MoneyTransactionsState extends State<MoneyTransactions> {
  final _dateController = TextEditingController();
  late DateTime _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yy').format(_selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateController.text = DateFormat('dd/MM/yy').format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 310,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Transactions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => selectDate(context),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Text(
                          _dateController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 250,
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
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionsPage(),
                        ),
                      );
                    },
                    child: TransactionsListsState(
                      expenseCategory: "Boissons et nourritures",
                      iconData: Icons.local_drink_rounded,
                      iconsColors: Colors.purple[900]!,
                      backgroundIconsColor: Colors.purple[50]!,
                    ),
                  ),
                  TransactionsListsState(
                    expenseCategory: "Travail",
                    iconData: Icons.work_outline_rounded,
                    iconsColors: Colors.blue[900]!,
                    backgroundIconsColor: Colors.blue[50]!,
                  ),
                  TransactionsListsState(
                    expenseCategory: "Shopping",
                    iconData: Icons.shopping_bag_rounded,
                    iconsColors: Colors.orange[900]!,
                    backgroundIconsColor: Colors.orange[50]!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsListsState extends StatelessWidget {
  final String expenseCategory;
  final IconData iconData;
  final Color iconsColors;
  final Color backgroundIconsColor;

  const TransactionsListsState({
    super.key,
    required this.expenseCategory,
    required this.iconData,
    required this.iconsColors,
    required this.backgroundIconsColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundIconsColor, // Colors.purple[50],
            ),
            child: Icon(
              iconData,
              size: 40,
              color: iconsColors, // Colors.purple[900],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expenseCategory,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "lorem",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 80,
            height: 60,
            child: Row(
              children: [
                Text(
                  "-28.25%",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.red,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
