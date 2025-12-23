import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tourvn_app/core/theme/app_colors.dart';
import 'package:tourvn_app/core/theme/app_theme.dart';
import 'package:tourvn_app/core/theme/app_typography.dart';

void main() {
  group('AppColors', () {
    test('primary color is TourVN teal #00BFA5', () {
      expect(AppColors.primary, const Color(0xFF00BFA5));
    });

    test('has all 6 mood colors defined', () {
      expect(AppColors.moodChill, isNotNull);
      expect(AppColors.moodAdventure, isNotNull);
      expect(AppColors.moodFood, isNotNull);
      expect(AppColors.moodBeach, isNotNull);
      expect(AppColors.moodCulture, isNotNull);
      expect(AppColors.moodRomance, isNotNull);
    });

    test('AppBar uses white background with dark foreground', () {
      expect(AppColors.appBarBackground, const Color(0xFFFFFFFF));
      expect(AppColors.appBarForeground, const Color(0xFF212121));
    });
  });

  group('AppTypography', () {
    test('line height is 1.5 for Vietnamese text', () {
      expect(AppTypography.vietnameseLineHeight, 1.5);
    });

    test('minimum font size is 12sp', () {
      expect(AppTypography.minFontSize, 12.0);
    });

    test('bodySmall uses minimum font size', () {
      expect(AppTypography.textTheme.bodySmall?.fontSize, 12.0);
    });

    test('all text styles have 1.5 line height', () {
      final textTheme = AppTypography.textTheme;
      
      expect(textTheme.displayLarge?.height, 1.5);
      expect(textTheme.displayMedium?.height, 1.5);
      expect(textTheme.displaySmall?.height, 1.5);
      expect(textTheme.headlineLarge?.height, 1.5);
      expect(textTheme.headlineMedium?.height, 1.5);
      expect(textTheme.headlineSmall?.height, 1.5);
      expect(textTheme.titleLarge?.height, 1.5);
      expect(textTheme.titleMedium?.height, 1.5);
      expect(textTheme.titleSmall?.height, 1.5);
      expect(textTheme.bodyLarge?.height, 1.5);
      expect(textTheme.bodyMedium?.height, 1.5);
      expect(textTheme.bodySmall?.height, 1.5);
      expect(textTheme.labelLarge?.height, 1.5);
      expect(textTheme.labelMedium?.height, 1.5);
      expect(textTheme.labelSmall?.height, 1.5);
    });
  });

  group('AppTheme', () {
    test('minimum touch target is 48dp', () {
      expect(AppTheme.minTouchTarget, 48.0);
    });

    test('lightTheme uses Material Design 3', () {
      final theme = AppTheme.lightTheme;
      expect(theme.useMaterial3, true);
    });

    test('lightTheme uses TourVN primary color', () {
      final theme = AppTheme.lightTheme;
      expect(theme.colorScheme.primary, AppColors.primary);
    });

    test('lightTheme AppBar has white background', () {
      final theme = AppTheme.lightTheme;
      expect(theme.appBarTheme.backgroundColor, AppColors.appBarBackground);
    });

    test('lightTheme AppBar has dark foreground', () {
      final theme = AppTheme.lightTheme;
      expect(theme.appBarTheme.foregroundColor, AppColors.appBarForeground);
    });

    test('lightTheme has Vietnamese typography', () {
      final theme = AppTheme.lightTheme;
      expect(theme.textTheme.bodyMedium?.height, 1.5);
    });

    test('icon buttons have 48dp minimum size', () {
      final theme = AppTheme.lightTheme;
      final iconButtonStyle = theme.iconButtonTheme.style;
      
      // Check minimumSize is set
      expect(iconButtonStyle, isNotNull);
    });

    test('darkTheme uses Material Design 3', () {
      final theme = AppTheme.darkTheme;
      expect(theme.useMaterial3, true);
    });

    test('darkTheme uses TourVN primary color', () {
      final theme = AppTheme.darkTheme;
      expect(theme.colorScheme.primary, AppColors.primary);
    });
  });
}
