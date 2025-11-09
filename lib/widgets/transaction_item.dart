import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Text(transaction.title[0],
            style: const TextStyle(color: Colors.black87)),
      ),
      title: Text(transaction.title,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(transaction.category),
      trailing: Text(transaction.amount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: transaction.amount.startsWith('-')
                  ? Colors.red
                  : Colors.green)),
    );
  }
}