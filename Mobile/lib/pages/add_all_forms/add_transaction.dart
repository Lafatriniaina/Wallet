import 'package:flutter/material.dart';
import 'package:front/utils/dialog_util_transaction.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Nouvelle transaction",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {
                DialogTransactionUtils.openTransactionFormDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
