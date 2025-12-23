import 'package:flutter/material.dart';

/// Vietnamese-optimized typography for TourVN
/// 
/// Key features:
/// - 1.5x line height for Vietnamese character readability
/// - Minimum 12sp font size for body text
/// - System font (no custom fonts for MVP performance)
class AppTypography {
  AppTypography._();

  /// Line height multiplier for Vietnamese text
  /// Vietnamese characters with diacritics need more vertical space
  static const double vietnameseLineHeight = 1.5;

  /// Minimum readable font size
  static const double minFontSize = 12.0;

  /// Vietnamese-optimized TextTheme
  /// All styles use 1.5x line height for proper diacritic display
  static const TextTheme textTheme = TextTheme(
    // Display styles - for hero text, large headers
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
    ),

    // Headline styles - for section headers
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
    ),

    // Title styles - for card titles, list items
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
      letterSpacing: 0.1,
    ),

    // Body styles - for paragraphs, descriptions
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: minFontSize, // 12sp minimum
      fontWeight: FontWeight.w400,
      height: vietnameseLineHeight,
      letterSpacing: 0.4,
    ),

    // Label styles - for buttons, chips, captions
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: vietnameseLineHeight,
      letterSpacing: 0.5,
    ),
  );
}
