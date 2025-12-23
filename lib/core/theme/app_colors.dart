import 'package:flutter/material.dart';

/// TourVN color palette
/// 
/// Primary color: #00BFA5 (Teal) - represents Vietnamese water and beaches
/// Follows Material Design 3 color system
class AppColors {
  AppColors._();

  // Primary colors - TourVN teal (represents Vietnamese water/beaches)
  static const Color primary = Color(0xFF00BFA5);
  static const Color primaryLight = Color(0xFF5DF2D6);
  static const Color primaryDark = Color(0xFF008E76);

  // Secondary colors - warm accent
  static const Color secondary = Color(0xFFFF6F00);
  static const Color secondaryLight = Color(0xFFFFA040);
  static const Color secondaryDark = Color(0xFFC43E00);

  // Mood colors (for mood chips on Discover screen)
  // 6 categories: Chill, Adventure, Food, Beach, Culture, Romance
  static const Color moodChill = Color(0xFF81C784);      // 🌿 Green - relaxation
  static const Color moodAdventure = Color(0xFFFFB74D);  // 🏔️ Orange - excitement
  static const Color moodFood = Color(0xFFE57373);       // 🍜 Red - culinary
  static const Color moodBeach = Color(0xFF4FC3F7);      // 🏖️ Light Blue - coastal
  static const Color moodCulture = Color(0xFF9575CD);    // 🏛️ Purple - heritage
  static const Color moodRomance = Color(0xFFF06292);    // ❤️ Pink - romantic

  // Semantic colors (with good contrast)
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF2196F3);

  // Neutral colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color divider = Color(0xFFE0E0E0);

  // Rating star color
  static const Color starGold = Color(0xFFFFD700);

  // AppBar colors (light style)
  static const Color appBarBackground = Color(0xFFFFFFFF);
  static const Color appBarForeground = Color(0xFF212121);
}
