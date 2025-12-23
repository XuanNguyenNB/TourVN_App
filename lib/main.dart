// Flutter SDK
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// External packages (alphabetical)
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports
import 'package:tourvn_app/app.dart';
import 'package:tourvn_app/core/services/firebase_emulator_service.dart';
import 'package:tourvn_app/firebase_options.dart';

/// Set to true to connect to Firebase Emulators in debug mode.
/// Run `firebase emulators:start` before launching the app.
const bool useEmulators = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('✅ Firebase initialized successfully');
    
    // Connect to emulators if enabled (debug mode only)
    if (useEmulators && kDebugMode) {
      await FirebaseEmulatorService.connectToEmulators();
    }
  } catch (e) {
    debugPrint('❌ Firebase initialization failed: $e');
    runApp(const FirebaseErrorApp());
    return;
  }
  
  runApp(const ProviderScope(child: TourVNApp()));
}

class FirebaseErrorApp extends StatelessWidget {
  const FirebaseErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text(
                'Firebase initialization failed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Please check your configuration and try again.'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => main(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

