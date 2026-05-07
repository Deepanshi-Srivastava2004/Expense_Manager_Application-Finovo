import 'package:flutter/material.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search transactions...',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
