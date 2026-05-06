import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import '../widgets/chat_input.dart';

import '../../core/utils/input_parser.dart';
import '../../data/services/db_service.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final TextEditingController controller = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  final List<String> categories = [
    "Food",
    "Travel",
    "Bills",
    "Shopping",
    "Health",
    "Other",
  ];

  String selectedCategory = "Food";

  static const List<Widget> _pages = [
    DashboardScreen(),
    Center(child: Text('History')),
    Center(child: Text('Wallet')),
    Center(child: Text('Chart')),
    Center(child: Text('Settings')),
  ];

  void handleSubmit() {
    final input = controller.text.trim();

    if (input.isEmpty) return;

    final parsed = InputParser.parse(input);

    amountController.text = parsed['amount'].toString();

    noteController.text = parsed['note'];

    selectedCategory = "Food";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF171A21),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),

      transitionAnimationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
      ),

      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 42,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 24),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,

                    style: const TextStyle(color: Colors.white),

                    decoration: const InputDecoration(labelText: "Amount"),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: noteController,

                    style: const TextStyle(color: Colors.white),

                    decoration: const InputDecoration(labelText: "Note"),
                  ),

                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,

                    children: categories.map((category) {
                      final isSelected = selectedCategory == category;

                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            selectedCategory = category;
                          });
                        },

                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),

                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),

                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF22C55E)
                                : const Color(0xFF1E222B),

                            borderRadius: BorderRadius.circular(14),
                          ),

                          child: Text(
                            category,

                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        final db = DbService();

                        db.addTransaction({
                          'amount': double.tryParse(amountController.text) ?? 0,

                          'note': noteController.text,

                          'category': selectedCategory,

                          'date': DateTime.now().toString(),
                        });

                        Navigator.pop(context);

                        amountController.clear();
                        noteController.clear();
                        controller.clear();
                      },

                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),

                        child: Text("Add Transaction"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: SafeArea(
        top: false,

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),

              child: ChatInput(controller: controller, onSend: handleSubmit),
            ),

            BottomNavigationBar(
              currentIndex: _selectedIndex,

              selectedItemColor: Colors.green,

              unselectedItemColor: Colors.grey,

              showSelectedLabels: false,
              showUnselectedLabels: false,

              type: BottomNavigationBarType.fixed,

              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "History",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: "Wallet",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart),
                  label: "Chart",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
