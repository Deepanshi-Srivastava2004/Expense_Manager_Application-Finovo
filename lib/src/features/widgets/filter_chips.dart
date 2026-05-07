import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip(title: 'All', isSelected: true, color: const Color(0xFF20E070)),
        const SizedBox(width: 10),
        _chip(title: 'Income'),
        const SizedBox(width: 10),
        _chip(title: 'Expense'),

        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F2E),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white10),
          ),
          child: const Row(
            children: [
              Icon(Icons.tune, color: Colors.white70, size: 18),
              SizedBox(width: 8),
              Text('Filters', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chip({
    required String title,
    bool isSelected = false,
    Color color = const Color(0xFF1A1F2E),
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
