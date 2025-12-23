/// Firebase collection and field name constants
class FirebaseConstants {
  FirebaseConstants._();

  // Collections
  static const String usersCollection = 'users';
  static const String locationsCollection = 'locations';
  static const String articlesCollection = 'articles';
  static const String toursCollection = 'tours';
  static const String moodsCollection = 'moods';

  // Subcollections
  static const String reviewsSubcollection = 'reviews';
  static const String savedLocationsSubcollection = 'savedLocations';
  static const String inquiriesSubcollection = 'inquiries';

  // Storage paths
  static const String userAvatarsPath = 'avatars';
  static const String reviewPhotosPath = 'reviews';
  static const String tourPhotosPath = 'tours';
  static const String kycDocumentsPath = 'kyc';
}
