import 'package:flutter/material.dart';

import '../models/transaction_model.dart';
import '../widgets/filter_chips.dart';
import '../widgets/floating_input_bar.dart';
import '../widgets/history_search_bar.dart';
import '../widgets/month_header.dart';
import '../widgets/transaction_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel(
        title: 'Groceries',
        date: 'Apr 23, 2026',
        amount: 150,
        isIncome: false,
        icon: 'cart',
      ),
      TransactionModel(
        title: 'Weekly groceries',
        date: 'Apr 20, 2026',
        amount: 150,
        isIncome: false,
        icon: 'cart',
      ),
      TransactionModel(
        title: 'Monthly rent',
        date: 'Apr 01, 2026',
        amount: 150,
        isIncome: false,
        icon: 'home',
      ),
      TransactionModel(
        title: 'Gas refill',
        date: 'Apr 18, 2026',
        amount: 150,
        isIncome: false,
        icon: 'car',
      ),
      TransactionModel(
        title: 'Dinner with friends',
        date: 'Apr 15, 2026',
        amount: 150,
        isIncome: false,
        icon: 'food',
      ),
      TransactionModel(
        title: 'Movie tickets',
        date: 'Apr 12, 2026',
        amount: 150,
        isIncome: false,
        icon: 'movie',
      ),
      TransactionModel(
        title: 'Monthly salary',
        date: 'Apr 10, 2026',
        amount: 15000,
        isIncome: true,
        icon: 'wallet',
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF090C14),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HistorySearchBar(),

              const SizedBox(height: 20),

              const FilterChips(),

              const SizedBox(height: 26),

              const MonthHeader(),

              const SizedBox(height: 24),

              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(transaction: transactions[index]);
                  },
                ),
              ),

              const SizedBox(height: 10),

              const FloatingInputBar(),
            ],
          ),
        ),
      ),
    );
  }
}
