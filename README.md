# TourVN App

A mood-based tourism discovery app for Vietnam built with Flutter and Firebase.

## Getting Started

### Prerequisites

- Flutter SDK 3.x
- Firebase CLI (`npm install -g firebase-tools`)
- Android Studio / Xcode for emulators

### Installation

1. Clone the repository
2. Run `flutter pub get`
3. Ensure Firebase config files are in place:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

### Running the App

```bash
flutter run
```

## Firebase Emulators (Local Development)

Firebase Emulators allow you to develop and test locally without affecting production data.

### Setup

1. **Install Firebase CLI** (if not already installed):
   ```bash
   npm install -g firebase-tools
   firebase login
   ```

2. **Start emulators**:
   ```bash
   firebase emulators:start
   ```
   
   This starts:
   - Auth emulator on port `9099`
   - Firestore emulator on port `8080`
   - Storage emulator on port `9199`
   - Emulator UI on port `4000`

3. **Enable emulators in the app**:
   
   In `lib/main.dart`, set:
   ```dart
   const bool useEmulators = true;
   ```

4. **Access Emulator UI**:
   
   Open http://localhost:4000 to view and manage emulator data.

### Emulator Ports

| Service   | Port |
|-----------|------|
| Auth      | 9099 |
| Firestore | 8080 |
| Storage   | 9199 |
| UI        | 4000 |

### Notes

- Emulators only connect in **debug mode**
- Android emulator uses `10.0.2.2` to reach host machine (handled automatically)
- iOS simulator uses `localhost`
- Data is reset when emulators restart (unless persistence is configured)

## Project Structure

```
lib/
├── core/
│   ├── providers/       # Firebase instance providers
│   ├── services/        # Cross-cutting services
│   ├── theme/           # App theme and colors
│   └── router/          # Navigation configuration
├── features/            # Feature modules
└── main.dart            # App entry point
```

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
