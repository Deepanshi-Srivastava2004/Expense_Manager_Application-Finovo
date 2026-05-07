import 'package:flutter/material.dart';

class MonthHeader extends StatelessWidget {
  const MonthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'April 2026',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          '-1500.00₹',
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
