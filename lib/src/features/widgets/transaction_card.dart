import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  IconData _getIcon(String icon) {
    switch (icon) {
      case 'cart':
        return Icons.shopping_cart_outlined;
      case 'home':
        return Icons.home_outlined;
      case 'car':
        return Icons.local_taxi_outlined;
      case 'food':
        return Icons.restaurant_outlined;
      case 'movie':
        return Icons.movie_outlined;
      default:
        return Icons.wallet_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF141926),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(_getIcon(transaction.icon), color: Colors.white),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.date,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),

          Text(
            '${transaction.isIncome ? '+' : '-'}₹${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: transaction.isIncome
                  ? Colors.greenAccent
                  : Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
