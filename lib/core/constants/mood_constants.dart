import 'package:flutter/material.dart';

import 'package:tourvn_app/core/theme/app_colors.dart';

/// Mood categories for location discovery
/// 
/// TourVN uses mood-based navigation as the primary discovery pattern.
/// Each mood has a color, icon, and labels in Vietnamese and English.
enum Mood {
  chill,
  adventure,
  food,
  beach,
  culture,
  romance,
}

/// Data associated with each mood category
class MoodData {
  final Mood mood;
  final Color color;
  final IconData icon;
  final String labelVi;
  final String labelEn;
  final String emoji;

  const MoodData({
    required this.mood,
    required this.color,
    required this.icon,
    required this.labelVi,
    required this.labelEn,
    required this.emoji,
  });
}

/// Mood data mapping for all 6 categories
const Map<Mood, MoodData> moodDataMap = {
  Mood.chill: MoodData(
    mood: Mood.chill,
    color: AppColors.moodChill,
    icon: Icons.spa_outlined,
    labelVi: 'Thư giãn',
    labelEn: 'Chill',
    emoji: '🌿',
  ),
  Mood.adventure: MoodData(
    mood: Mood.adventure,
    color: AppColors.moodAdventure,
    icon: Icons.terrain_outlined,
    labelVi: 'Phiêu lưu',
    labelEn: 'Adventure',
    emoji: '🏔️',
  ),
  Mood.food: MoodData(
    mood: Mood.food,
    color: AppColors.moodFood,
    icon: Icons.restaurant_outlined,
    labelVi: 'Ẩm thực',
    labelEn: 'Food',
    emoji: '🍜',
  ),
  Mood.beach: MoodData(
    mood: Mood.beach,
    color: AppColors.moodBeach,
    icon: Icons.beach_access_outlined,
    labelVi: 'Biển',
    labelEn: 'Beach',
    emoji: '🏖️',
  ),
  Mood.culture: MoodData(
    mood: Mood.culture,
    color: AppColors.moodCulture,
    icon: Icons.account_balance_outlined,
    labelVi: 'Văn hóa',
    labelEn: 'Culture',
    emoji: '🏛️',
  ),
  Mood.romance: MoodData(
    mood: Mood.romance,
    color: AppColors.moodRomance,
    icon: Icons.favorite_outline,
    labelVi: 'Lãng mạn',
    labelEn: 'Romance',
    emoji: '❤️',
  ),
};

/// Get mood data by mood enum
MoodData getMoodData(Mood mood) => moodDataMap[mood]!;

/// List of all moods for iteration
const List<Mood> allMoods = Mood.values;
