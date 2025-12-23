# Story 1.2: Clean Architecture Folder Structure

Status: done

## Story

As a **developer**,
I want **the project organized with Clean Architecture folders**,
So that **code is maintainable and follows established patterns**.

## Acceptance Criteria

1. **Given** the Flutter project **When** I create the folder structure **Then** `lib/core/` contains: `constants/`, `theme/`, `router/`, `providers/`, `services/`, `utils/`, `widgets/`

2. **Given** the folder structure is created **When** I check `lib/features/` **Then** it is ready for feature folders with example structure

3. **Given** core providers are needed **When** I check `core/providers/firebase_providers.dart` **Then** Firebase providers exist using `@riverpod` annotation

4. **Given** any Dart file is created **When** I check imports **Then** they follow the 4-section order: Dart SDK → Flutter SDK → External packages → Project imports

## Tasks / Subtasks

- [x] **Task 1: Create core folder structure** (AC: #1)
  - [x] Create `lib/core/constants/` with `app_constants.dart`
  - [x] Create `lib/core/theme/` with placeholder files
  - [x] Create `lib/core/router/` with `routes.dart`
  - [x] Create `lib/core/providers/` directory
  - [x] Create `lib/core/services/` directory
  - [x] Create `lib/core/utils/` with `formatters.dart`
  - [x] Create `lib/core/widgets/` directory
  - [x] Create `lib/core/errors/` for custom exceptions

- [x] **Task 2: Create features folder scaffold** (AC: #2)
  - [x] Create `lib/features/` directory
  - [x] Create example feature structure for `auth/` with `data/`, `domain/`, `presentation/` subdirs
  - [x] Create example feature structure for `discover/` placeholder

- [x] **Task 3: Implement Firebase providers** (AC: #3)
  - [x] Create `lib/core/providers/firebase_providers.dart`
  - [x] Add `firestoreProvider` with `@riverpod` annotation
  - [x] Add `firebaseAuthProvider` with `@riverpod` annotation
  - [x] Add `firebaseStorageProvider` with `@riverpod` annotation
  - [x] Run `dart run build_runner build` to generate `.g.dart` files

- [x] **Task 4: Add riverpod_generator dependency** (AC: #3)
  - [x] Add `riverpod_annotation: ^2.3.5` to pubspec.yaml dependencies
  - [x] Add `riverpod_generator: ^2.4.3` to dev_dependencies
  - [x] Add `build_runner: ^2.4.13` to dev_dependencies
  - [x] Run `flutter pub get`

- [x] **Task 5: Create app entry point structure** (AC: #4)
  - [x] Create `lib/app.dart` with MaterialApp + ProviderScope
  - [x] Update `lib/main.dart` to use app.dart
  - [x] Ensure all imports follow 4-section order

## Dev Notes

### Architecture Pattern: Clean Architecture + Feature-Based

```
lib/
├── main.dart                     # App entry point
├── app.dart                      # MaterialApp + ProviderScope
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── firebase_constants.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   └── app_typography.dart
│   ├── router/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   ├── providers/
│   │   └── firebase_providers.dart
│   ├── services/
│   │   ├── image_service.dart
│   │   └── location_service.dart
│   ├── utils/
│   │   ├── extensions.dart
│   │   ├── validators.dart
│   │   └── formatters.dart
│   ├── errors/
│   │   └── app_exceptions.dart
│   └── widgets/
│       ├── loading_skeleton.dart
│       ├── error_widget.dart
│       └── cached_image.dart
└── features/
    └── {feature_name}/
        ├── data/
        │   ├── models/
        │   └── repositories/
        ├── domain/
        │   └── entities/
        └── presentation/
            ├── providers/
            ├── screens/
            └── widgets/
```

### Layer Boundaries (STRICT)

| Layer | CAN Import | CANNOT Import |
|-------|------------|---------------|
| `presentation/` | `domain/`, `core/` | `data/` directly |
| `domain/` | Nothing feature-specific | `data/`, `presentation/` |
| `data/` | `domain/` | `presentation/` |
| `core/` | External packages only | Any `features/` |

### Firebase Providers Pattern

```dart
// lib/core/providers/firebase_providers.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;

@riverpod
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) => FirebaseStorage.instance;
```

### Import Organization (4-Section Order)

```dart
// 1. Dart SDK
import 'dart:async';

// 2. Flutter SDK
import 'package:flutter/material.dart';

// 3. External packages (alphabetical)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 4. Project imports - core first, then features (alphabetical)
import 'package:tourvn_app/core/theme/app_theme.dart';
import 'package:tourvn_app/features/auth/domain/entities/user.dart';
```

### Project Structure Notes

- **Existing files to preserve**: `lib/main.dart` exists with Firebase init - extend, don't replace
- **Story 1-1 completed**: Firebase is configured and working
- **Package name**: `tourvn_app` (use in all imports)

### Dependencies Required

Add to `pubspec.yaml`:

```yaml
dependencies:
  # Already present from story 1-1
  flutter_riverpod: ^2.4.9
  firebase_core: ^2.24.2
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  firebase_storage: ^11.6.0
  
  # Add for code generation
  riverpod_annotation: ^2.3.3

dev_dependencies:
  # Add for code generation
  riverpod_generator: ^2.3.9
  build_runner: ^2.4.7
```

### Anti-Patterns to AVOID

- ❌ Creating providers outside of `providers/` folder
- ❌ Importing `features/` into `core/`
- ❌ Direct feature-to-feature imports
- ❌ Mixing Firestore code in presentation layer
- ❌ Skipping the `.g.dart` code generation step

### File Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Files | `snake_case.dart` | `firebase_providers.dart` |
| Classes | `PascalCase` | `FirebaseProviders` |
| Providers | `camelCase` | `firestoreProvider` |

### Testing Considerations

- Create `test/` folder structure mirroring `lib/`
- Create `test/mocks/` for shared mocks
- Repository tests will use `mocktail` (add in future story)

### References

- [Source: _bmad-output/architecture.md#Project Structure & Boundaries]
- [Source: _bmad-output/architecture.md#Implementation Patterns & Consistency Rules]
- [Source: project-context.md#Architecture Pattern: Clean Architecture + Feature-Based]
- [Source: project-context.md#Import Organization (STRICT ORDER)]

## Dev Agent Record

### Agent Model Used

Claude 3.5 Sonnet (Cascade)

### Debug Log References

- `flutter pub get` - Success
- `dart run build_runner build --delete-conflicting-outputs` - Success (generated firebase_providers.g.dart)
- `flutter analyze` - 4 info warnings (deprecation in generated code, expected)
- `flutter test` - All tests passed

### Completion Notes List

- All core folders already existed from Story 1-1, added missing: `widgets/`, `routes.dart`, `formatters.dart`
- Updated `firebase_providers.dart` from manual Provider to `@riverpod` annotation
- Generated `firebase_providers.g.dart` successfully
- Created `app.dart` with TourVNApp, updated `main.dart` to use it
- Removed old MyApp/MyHomePage boilerplate from main.dart
- Updated widget_test.dart to test TourVNApp
- Features scaffold (auth, guide, location) already existed from Story 1-1

**Code Review Fixes (2025-12-23):**
- Fixed import order in main.dart to follow 4-section pattern (AC#4)
- Added `keepAlive: true` to Firebase providers to prevent disposal
- Fixed app.dart documentation (removed inaccurate ProviderScope reference)
- Added comprehensive unit tests for formatters.dart

### File List

Files created:
- `lib/app.dart` - TourVNApp root widget
- `lib/core/router/routes.dart` - Route path constants
- `lib/core/utils/formatters.dart` - Vietnamese locale formatters
- `lib/core/widgets/.gitkeep` - Widgets directory placeholder
- `lib/core/providers/firebase_providers.g.dart` - Generated providers

Files modified:
- `lib/main.dart` - Now uses TourVNApp, removed old boilerplate, fixed import order
- `lib/core/providers/firebase_providers.dart` - Updated to @Riverpod(keepAlive: true)
- `lib/app.dart` - Fixed documentation
- `pubspec.yaml` - Added riverpod_annotation, riverpod_generator, build_runner
- `test/widget_test.dart` - Updated to test TourVNApp

Files created (code review):
- `test/core/utils/formatters_test.dart` - Unit tests for formatters

### Change Log

- 2025-12-23: Story 1.2 implemented - Clean Architecture folder structure complete
- 2025-12-23: Code review fixes applied - import order, keepAlive providers, tests added
