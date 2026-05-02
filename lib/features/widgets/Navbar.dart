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
      home: MyNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Navbar widget (Stateful because UI changes on tap)
class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  // int _selectedIndex = 0; // 👈 tracks which tab is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 👇 Body changes based on selected tab
      // body: Center(
      //   child: Text(
      //     "Selected Index: $_selectedIndex",
      //     style: const TextStyle(fontSize: 22),
      //   ),
      // ),

      // 👇 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _selectedIndex, // 👈 tells which item is active
        selectedItemColor: Colors.green, // 👈 active icon color
        unselectedItemColor: Colors.grey, // 👈 inactive icons

        showSelectedLabels: false, // 👈 hide text
        showUnselectedLabels: false,

        type: BottomNavigationBarType.fixed, // 👈 needed for >3 items

        // onTap: (index) {
        //   setState(() {
        //     _selectedIndex = index; // 👈 update selected tab
        //   });
        // },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Chart"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
