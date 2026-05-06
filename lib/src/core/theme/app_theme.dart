import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Inter',

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryGreen,
      surface: AppColors.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.muted,
      type: BottomNavigationBarType.fixed,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,

      hintStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),

      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.primaryGreen,
          width: 1,
        ),
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.elevated,
      contentTextStyle: const TextStyle(
        color: AppColors.textPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}