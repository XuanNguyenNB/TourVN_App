import 'package:intl/intl.dart';

/// Utility class for formatting values in Vietnamese locale.
abstract class Formatters {
  /// Format date in Vietnamese format: dd/MM/yyyy
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'vi').format(date);
  }

  /// Format date with time: dd/MM/yyyy HH:mm
  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm', 'vi').format(date);
  }

  /// Format currency in VND: 1.000.000 ₫
  static String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  /// Format distance for display
  /// Returns human-readable format like "30 phút" or "2h lái xe"
  static String formatDistance(double distanceKm) {
    if (distanceKm < 1) {
      return '${(distanceKm * 1000).round()} m';
    } else if (distanceKm < 50) {
      // Assume average speed of 40km/h in city
      final minutes = (distanceKm / 40 * 60).round();
      if (minutes < 60) {
        return '$minutes phút';
      } else {
        final hours = minutes ~/ 60;
        final remainingMinutes = minutes % 60;
        if (remainingMinutes == 0) {
          return '${hours}h lái xe';
        }
        return '${hours}h${remainingMinutes}p lái xe';
      }
    } else {
      return '${distanceKm.round()} km';
    }
  }

  /// Format rating with one decimal place
  static String formatRating(double rating) {
    return rating.toStringAsFixed(1);
  }

  /// Format review count with abbreviation for large numbers
  static String formatReviewCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 1000000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
  }
}
