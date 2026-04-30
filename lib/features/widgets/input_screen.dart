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

  void handleSubmit() async {
    final input = controller.text;

    if (input.isEmpty) return;

    final parsed = InputParser.parse(input);

    var box = Hive.box('transactions');

    await box.add({
      'amount': parsed['amount'],
      'note': parsed['note'],
      'date': DateTime.now().toString(),
    });

    controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Added ₹${parsed['amount']} - ${parsed['note']}")),
    );
    print(parsed);
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
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            print("deleted");
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
                                      item['date'].toString().substring(0, 10),
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
