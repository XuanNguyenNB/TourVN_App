# Project Context for AI Agents - TourVN

_This file contains critical rules and patterns that AI agents must follow when implementing code in this project. Read this BEFORE implementing any feature._

---

## Technology Stack & Versions

| Technology | Version | Purpose |
|------------|---------|---------|
| **Flutter** | 3.x (latest stable) | Cross-platform mobile framework |
| **Dart** | 3.x | Programming language |
| **Riverpod** | ^2.4.9 | State management (use `@riverpod` annotation) |
| **Firebase Core** | ^2.24.2 | Firebase initialization |
| **Firebase Auth** | ^4.16.0 | Authentication |
| **Cloud Firestore** | ^4.14.0 | Database |
| **Firebase Storage** | ^11.6.0 | File storage (images, KYC docs) |
| **Firebase Messaging** | ^14.7.9 | Push notifications |
| **go_router** | ^13.0.0 | Navigation & deep linking |
| **cached_network_image** | ^3.3.0 | Image caching |
| **google_maps_flutter** | ^2.5.0 | Maps integration |

---

## Critical Implementation Rules

### 1. Architecture Pattern: Clean Architecture + Feature-Based

```
lib/
├── core/           # Shared across all features
│   ├── constants/
│   ├── theme/
│   ├── router/
│   ├── providers/  # Firebase providers ONLY
│   ├── services/   # Cross-cutting services
│   ├── utils/
│   └── widgets/    # Shared widgets
└── features/
    └── {feature}/
        ├── data/
        │   ├── models/      # Firestore serialization
        │   └── repositories/
        ├── domain/
        │   └── entities/    # Pure Dart objects
        └── presentation/
            ├── providers/   # Feature-specific providers
            ├── screens/
            └── widgets/
```

### 2. Layer Boundaries (STRICT)

| Layer | CAN Import | CANNOT Import |
|-------|------------|---------------|
| `presentation/` | `domain/`, `core/` | `data/` directly |
| `domain/` | Nothing feature-specific | `data/`, `presentation/` |
| `data/` | `domain/` | `presentation/` |
| `core/` | External packages only | Any `features/` |

**NEVER import Firestore in presentation layer. Use repositories.**

### 3. Firestore Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Collections | `snake_case`, plural | `users`, `locations`, `tour_guides` |
| Document fields | `camelCase` | `reviewCount`, `avgRating`, `createdAt` |
| Subcollections | `snake_case`, plural | `locations/{id}/reviews` |

### 4. Dart Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Files | `snake_case.dart` | `location_repository.dart` |
| Classes | `PascalCase` | `LocationRepository` |
| Providers | `camelCase` + `Provider` | `locationRepositoryProvider` |
| Widgets | `PascalCase` | `LocationCard` |
| Private members | `_camelCase` | `_firestore` |

---

## State Management Rules (Riverpod)

### Provider Pattern
```dart
// ALWAYS use @riverpod annotation
@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository(ref.watch(firestoreProvider));
}

@riverpod
Future<List<Location>> locationsByMood(LocationsByMoodRef ref, String mood) async {
  return ref.watch(locationRepositoryProvider).getLocationsByMood(mood);
}
```

### UI Consumption
```dart
// ALWAYS use .when() for async providers
locationsByMood.when(
  loading: () => SkeletonCards(),
  error: (e, _) => ErrorWidget(message: e.toString()),
  data: (locations) => LocationGrid(locations: locations),
);
```

### Provider Organization
- One `{feature}_providers.dart` file per feature
- Core Firebase providers in `core/providers/firebase_providers.dart`

---

## Error Handling Pattern

### Repository Layer
```dart
class LocationRepository {
  Future<List<Location>> getLocationsByMood(String mood) async {
    try {
      final snapshot = await _firestore
          .collection('locations')
          .where('moods', arrayContains: mood)
          .get();
      return snapshot.docs.map((doc) => LocationModel.fromFirestore(doc).toEntity()).toList();
    } catch (e) {
      throw LocationException('Failed to fetch locations: $e');
    }
  }
}
```

**Let Riverpod AsyncValue handle loading/error states in UI. No Either/Result pattern needed.**

---

## Model/Entity Pattern

### Model (data layer) - Handles Firestore serialization
```dart
class LocationModel {
  final String id;
  final String name;
  final List<String> moods;
  
  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      id: doc.id,
      name: data['name'] ?? '',  // ALWAYS provide defaults
      moods: List<String>.from(data['moods'] ?? []),
    );
  }
  
  Map<String, dynamic> toFirestore() => {
    'name': name,
    'moods': moods,
  };
  
  Location toEntity() => Location(id: id, name: name, moods: moods);
}
```

### Entity (domain layer) - Pure Dart, NO Firebase imports
```dart
class Location {
  final String id;
  final String name;
  final List<String> moods;
  
  const Location({required this.id, required this.name, required this.moods});
}
```

---

## Authentication & Security

### Role-Based Access (Firestore user document, NOT Custom Claims)
```javascript
// User document structure
users/{uid}: {
  email: string,
  displayName: string,
  role: 'tourist' | 'guide' | 'admin',
  guideProfile: { ... } | null,
  createdAt: timestamp,
  updatedAt: timestamp
}
```

### Security Rules Pattern
```javascript
function isAuthenticated() {
  return request.auth != null;
}

function getUserRole() {
  return get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role;
}

function isAdmin() {
  return isAuthenticated() && getUserRole() == 'admin';
}
```

---

## Widget Composition Hierarchy

| Level | Responsibility | Naming |
|-------|---------------|--------|
| **Screen** | Full page, scaffold, providers | `{Name}Screen` |
| **Section** | Major UI block, may have state | `{Name}Section` |
| **Component** | Reusable, stateless preferred | Descriptive noun |

Example: `DiscoverScreen` → `MoodChipsSection` → `MoodChip`

---

## Import Organization (STRICT ORDER)

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
import 'package:tourvn_app/features/location/domain/entities/location.dart';
```

---

## Navigation (go_router)

### Shell Route for Bottom Navigation
```dart
ShellRoute(
  builder: (context, state, child) => MainScaffold(child: child),
  routes: [
    GoRoute(path: '/discover', ...),
    GoRoute(path: '/saved', ...),
    GoRoute(path: '/profile', ...),
  ],
),
// Full-screen routes outside shell
GoRoute(path: '/location/:id', ...),  // Deep link enabled
GoRoute(path: '/article/:id', ...),   // Deep link enabled
```

---

## Anti-Patterns to AVOID

- ❌ Mixing Firestore code in presentation layer
- ❌ Creating providers outside of `providers/` folder
- ❌ Using `setState` when Riverpod provider would work
- ❌ Hardcoding strings (use `core/constants/`)
- ❌ Skipping null safety checks in `fromFirestore`
- ❌ Importing features into `core/`
- ❌ Direct feature-to-feature imports

---

## Testing Requirements

- Repository tests use `mocktail` for mocking Firestore
- Test files mirror source structure in `test/`
- Mock Firebase in `test/mocks/mock_firestore.dart`

---

## Localization

- **Default language:** Vietnamese
- **Date format:** `dd/MM/yyyy` (Vietnamese locale)
- **Currency:** VND with proper formatting
- Use `core/utils/formatters.dart` for all formatting

---

## Key Business Rules

1. **Mood-based discovery** is the primary navigation pattern
2. **Denormalized data** for location cards: `reviewCount`, `avgRating` stored on location document
3. **KYC documents** are encrypted in Firebase Storage
4. **Role checking** happens via Firestore user document, not Custom Claims
5. **Reviews** are subcollections under locations: `locations/{id}/reviews`

---

**Document Version:** 1.0
**Last Updated:** 2025-12-23
**Architecture Reference:** `_bmad-output/architecture.md`
