import 'package:flutter/material.dart';

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [color1, color2]),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bankName,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(cardNumber, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Text(balance,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}