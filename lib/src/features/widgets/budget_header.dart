import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class BudgetHeader extends StatelessWidget {
  const BudgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(height: 28),

        Text(
          "Remaining Budget",
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          "₹2150",
          style: AppTextStyles.heading1.copyWith(
            fontSize: 64,
            height: 1,
            letterSpacing: -3,
          ),
        ),

        const SizedBox(height: 18),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "₹2850 ",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                ),
              ),

              TextSpan(
                text: "spent of ₹5000",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
