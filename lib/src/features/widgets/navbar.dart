import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNavBar(),
    );
  }
}

// Navbar widget
class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090C14),

      // 👇 Empty body for now
      body: const SizedBox(),

      // 👇 Custom Premium Navbar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 12),

        decoration: BoxDecoration(
          color: const Color(0xFF141926),
          borderRadius: BorderRadius.circular(32),

          border: Border.all(color: Colors.white10),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(icon: Icons.home_rounded, index: 0),

            _navItem(icon: Icons.history, index: 1),

            _navItem(icon: Icons.account_balance_wallet_outlined, index: 2),

            _navItem(icon: Icons.show_chart_rounded, index: 3),

            _navItem(icon: Icons.settings_outlined, index: 4),
          ],
        ),
      ),
    );
  }

  Widget _navItem({required IconData icon, required int index}) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: isSelected ? const Color(0xFF20E070) : Colors.grey.shade500,
          ),

          const SizedBox(height: 6),

          AnimatedContainer(
            duration: const Duration(milliseconds: 250),

            height: 3,
            width: isSelected ? 40 : 0,

            decoration: BoxDecoration(
              color: const Color(0xFF20E070),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
