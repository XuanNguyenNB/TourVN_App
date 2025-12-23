/// App-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'TourVN';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int defaultPageSize = 20;

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Cache
  static const Duration cacheValidity = Duration(hours: 1);

  // Image
  static const int maxImageSizeBytes = 1024 * 1024; // 1MB
  static const int maxReviewPhotos = 5;
  static const int maxTourPhotos = 10;
}
