import 'package:flutter/material.dart';

class FloatingInputBar extends StatelessWidget {
  const FloatingInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF141926),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'e.g., 150 groceries',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Color(0xFF2B3245),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
