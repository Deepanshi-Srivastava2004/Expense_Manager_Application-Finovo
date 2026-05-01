import 'package:flutter/material.dart';
import '../../core/utils/input_parser.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
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

  void handleSubmit() async {
    final input = controller.text;

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
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              width: double.infinity, //FORCE FULL WIDTH
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min, //CONTENT HEIGHT
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: noteController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Note",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 20),

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
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF22C55E)
                                : const Color(0xFF171A21),
                            borderRadius: BorderRadius.circular(10),
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
                  ElevatedButton(
                    onPressed: () {
                      var box = Hive.box('transactions');

                      box.add({
                        'amount': double.tryParse(amountController.text) ?? 0,
                        'note': noteController.text,
                        'category': selectedCategory,
                        'date': DateTime.now().toString(),
                      });

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Added ₹${amountController.text} - ${noteController.text}",
                          ),
                        ),
                      );
                      amountController.clear();
                      noteController.clear();
                      controller.clear();
                      print(parsed);
                    },
                    child: Text("Add Transaction"),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "e.g. 500 pizza",
                  hintStyle: const TextStyle(color: Color(0xFF6B7280)),
                  filled: true,
                  fillColor: const Color(0xFF171A21),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: handleSubmit,
                child: const Text("Add Transaction"),
              ),
              const SizedBox(height: 16),

              // ✅ NOW Expanded is valid
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('transactions').listenable(),
                  builder: (context, box, _) {
                    if (box.isEmpty) {
                      return const Center(
                        child: Text(
                          "No transactions yet",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    final items = box.values.toList().reversed.toList();
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final date = item['date'].toString();
                        final displayDate = date.length >= 10
                            ? date.substring(0, 10)
                            : date;
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            var box = Hive.box('transactions');

                            int actualIndex =
                                box.length -
                                1 -
                                index; // Calculate actual index
                            box.deleteAt(
                              actualIndex,
                            ); // Delete the item from Hive

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Transaction deleted"),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171A21),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['note'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['category'] ?? "Other",
                                      style: const TextStyle(
                                        color: Color(0xFF22C55E),
                                        fontSize: 12,
                                      ),
                                    ),

                                    Text(
                                      displayDate,
                                      style: const TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  "₹${item['amount']}",
                                  style: const TextStyle(
                                    color: Color(0xFF22C55E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
