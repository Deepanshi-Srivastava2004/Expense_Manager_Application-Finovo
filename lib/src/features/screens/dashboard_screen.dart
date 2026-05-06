import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Color> categoryColors = const [
    Color(0xFF3B82F6),
    Color(0xFF10B981),
    Color(0xFF4FD1E0),
    Color(0xFF818CF8),
    Color(0xFFA855F7),
    Color(0xFFEC4899),
    Color(0xFFEF4444),
  ];

  final List<IconData> categoryIcons = const [
    Icons.flash_on_rounded,
    Icons.shopping_bag_rounded,
    Icons.shopping_cart_rounded,
    Icons.flight_rounded,
    Icons.restaurant_rounded,
    Icons.movie_rounded,
    Icons.wallet_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),

      body: ValueListenableBuilder(
        valueListenable: Hive.box('transactions').listenable(),

        builder: (context, box, _) {
          final transactions = box.values.toList();

          double totalSpent = 0;

          Map<String, double> categoryTotals = {};

          for (var item in transactions) {
            final amount = (item['amount'] ?? 0).toDouble();

            final category = item['category'] ?? "Other";

            totalSpent += amount;

            categoryTotals[category] = (categoryTotals[category] ?? 0) + amount;
          }

          const totalBudget = 5000.0;

          final remaining = totalBudget - totalSpent;

          final categories = categoryTotals.entries.toList();

          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 220),

                  child: Column(
                    children: [
                      // TOP SPACE
                      const SizedBox(height: 8),

                      // REMAINING BUDGET
                      const Text(
                        "Remaining Budget",
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "₹${remaining.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          letterSpacing: -2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₹${totalSpent.toStringAsFixed(0)} ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),

                            const TextSpan(
                              text: "spent of ₹5000",
                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // CARD
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),

                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,

                            colors: [
                              Color(0xFF3A2245),
                              Color(0xFF1D2430),
                              Color(0xFF263349),
                            ],
                          ),

                          border: Border.all(
                            color: const Color(0xFF363C49),
                            width: 2,
                          ),
                        ),

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: const [
                                Text(
                                  "Spending by Category",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Color(0xFF22C55E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            SizedBox(
                              height: 220,

                              child: Stack(
                                alignment: Alignment.center,

                                children: [
                                  PieChart(
                                    PieChartData(
                                      sectionsSpace: 10,
                                      centerSpaceRadius: 62,
                                      startDegreeOffset: -90,

                                      sections: List.generate(
                                        categories.length,
                                        (index) {
                                          final item = categories[index];

                                          final percentage = totalSpent == 0
                                              ? 0
                                              : (item.value / totalSpent) * 100;

                                          return PieChartSectionData(
                                            value: percentage.toDouble(),
                                            color:
                                                categoryColors[index %
                                                    categoryColors.length],
                                            radius: 24,
                                            title: '',
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      const Text(
                                        "Total Spent",
                                        style: TextStyle(
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 14,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        "₹${totalSpent.toStringAsFixed(0)}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // CATEGORY LIST
                      ...List.generate(categories.length, (index) {
                        final item = categories[index];

                        final percentage = totalSpent == 0
                            ? 0
                            : ((item.value / totalSpent) * 100).round();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),

                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,

                                decoration: BoxDecoration(
                                  color:
                                      categoryColors[index %
                                          categoryColors.length],

                                  shape: BoxShape.circle,
                                ),

                                child: Icon(
                                  categoryIcons[index % categoryIcons.length],

                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Text(
                                  item.key,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [
                                  Text(
                                    "₹${item.value.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  const SizedBox(height: 2),

                                  Text(
                                    "$percentage%",
                                    style: const TextStyle(
                                      color: Color(0xFF9CA3AF),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              // FLOATING INPUT
            ],
          );
        },
      ),
    );
  }
}
