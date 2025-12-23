import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

/// Service to connect Firebase services to local emulators in debug mode.
/// 
/// Call [connectToEmulators] after Firebase.initializeApp() in main.dart
/// to enable local development with Firebase Emulators.
class FirebaseEmulatorService {
  /// Default emulator host for different platforms
  static String get _emulatorHost {
    if (kIsWeb) {
      return 'localhost';
    }
    // Android emulator uses 10.0.2.2 to reach host machine
    // iOS simulator and desktop use localhost
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '10.0.2.2';
    }
    return 'localhost';
  }

  /// Connect to Firebase Emulators in debug mode only.
  /// 
  /// Emulator ports (configured in firebase.json):
  /// - Auth: 9099
  /// - Firestore: 8080
  /// - Storage: 9199
  /// 
  /// Usage:
  /// ```dart
  /// await Firebase.initializeApp();
  /// await FirebaseEmulatorService.connectToEmulators();
  /// ```
  static Future<void> connectToEmulators() async {
    if (!kDebugMode) {
      return;
    }

    final host = _emulatorHost;
    
    try {
      // Connect Firestore to emulator
      FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
      debugPrint('🔥 Firestore emulator connected: $host:8080');

      // Connect Auth to emulator
      await FirebaseAuth.instance.useAuthEmulator(host, 9099);
      debugPrint('🔐 Auth emulator connected: $host:9099');

      // Connect Storage to emulator
      await FirebaseStorage.instance.useStorageEmulator(host, 9199);
      debugPrint('📦 Storage emulator connected: $host:9199');

      debugPrint('✅ All Firebase emulators connected successfully');
    } catch (e) {
      debugPrint('⚠️ Failed to connect to emulators: $e');
      debugPrint('💡 Make sure emulators are running: firebase emulators:start');
    }
  }
}
