import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),

        border: Border.all(color: AppColors.border, width: 1),
      ),

      child: Column(
        children: [
          // TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Spending by Category", style: AppTextStyles.heading3),

              Text(
                "View All",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // FAKE DONUT PLACEHOLDER
          Container(
            width: 260,
            height: 260,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryGreen, width: 24),
            ),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Spent",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "₹2850",
                    style: AppTextStyles.heading2.copyWith(fontSize: 42),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
