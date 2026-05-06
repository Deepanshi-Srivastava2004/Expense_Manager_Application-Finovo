import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headlines
  static const heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -1,
  );

  static const heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Labels
  static const label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Amounts / financial numbers
  static const amount = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGreen,
    letterSpacing: -0.5,
  );

  static const negativeAmount = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.red,
    letterSpacing: -0.5,
  );

  // Buttons
  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}