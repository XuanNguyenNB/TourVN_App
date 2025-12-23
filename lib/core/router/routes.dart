/// Route path constants for the TourVN app.
/// 
/// Use these constants instead of hardcoding route strings.
abstract class Routes {
  // Main navigation routes (inside ShellRoute)
  static const String discover = '/discover';
  static const String saved = '/saved';
  static const String profile = '/profile';

  // Auth routes
  static const String login = '/login';
  static const String register = '/register';

  // Detail routes (outside ShellRoute - full screen)
  static const String locationDetail = '/location/:id';
  static const String articleDetail = '/article/:id';
  static const String guideProfile = '/guide/:id';

  // Guide management routes
  static const String guideRegistration = '/guide-registration';
  static const String tourDetail = '/tour/:id';

  // Helper methods for parameterized routes
  static String location(String id) => '/location/$id';
  static String article(String id) => '/article/$id';
  static String guide(String id) => '/guide/$id';
  static String tour(String id) => '/tour/$id';
}
