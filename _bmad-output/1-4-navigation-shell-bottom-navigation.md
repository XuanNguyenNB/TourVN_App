# Story 1.4: Navigation Shell & Bottom Navigation

Status: done

## Story

As a **tourist**,
I want **easy navigation between main app sections**,
So that **I can quickly access Discover, Saved, and Profile**.

## Acceptance Criteria

1. **Given** the app is launched **When** the main screen loads **Then** bottom navigation shows 3 tabs: Discover, Saved, Profile

2. **Given** the bottom navigation is visible **When** I tap a tab **Then** go_router ShellRoute maintains state between tabs (scroll position, filters preserved)

3. **Given** any tab is selected **When** I view the screen **Then** each tab shows placeholder content with proper styling

4. **Given** I switch between tabs **When** the transition occurs **Then** navigation transitions are smooth (no jank, 60fps)

5. **Given** the app is launched from cold start **When** measuring load time **Then** app loads in < 3 seconds (NFR1)

## Tasks / Subtasks

- [x] **Task 1: Create route constants and configuration** (AC: #1, #2)
  - [x] Create `lib/core/router/routes.dart` with route path constants
  - [x] Define route names: `/discover`, `/saved`, `/profile`
  - [x] Add route for future deep links: `/location/:id`, `/article/:id`

- [x] **Task 2: Create MainScaffold shell widget** (AC: #1, #3, #4)
  - [x] Create `lib/core/widgets/main_scaffold.dart`
  - [x] Implement BottomNavigationBar with 3 tabs
  - [x] Use AppColors and theme for consistent styling
  - [x] Icons: `explore` (Discover), `bookmark` (Saved), `person` (Profile)
  - [x] Vietnamese labels: "Khám phá", "Đã lưu", "Hồ sơ"

- [x] **Task 3: Create placeholder screens for each tab** (AC: #3)
  - [x] Create `lib/features/discover/presentation/screens/discover_screen.dart`
  - [x] Create `lib/features/saved/presentation/screens/saved_screen.dart`
  - [x] Create `lib/features/profile/presentation/screens/profile_screen.dart`
  - [x] Each shows centered text with tab name and icon
  - [x] Use AppTheme typography and colors

- [x] **Task 4: Implement go_router with ShellRoute** (AC: #2, #4)
  - [x] Create `lib/core/router/app_router.dart`
  - [x] Configure ShellRoute with MainScaffold as shell builder
  - [x] Add nested routes for each tab
  - [x] Configure state preservation between tabs
  - [x] Add redirects for root path `/` → `/discover`

- [x] **Task 5: Create router provider** (AC: #2)
  - [x] Create `lib/core/router/router_provider.dart`
  - [x] Use `@riverpod` annotation for router provider
  - [x] Export router for use in app.dart

- [x] **Task 6: Update app.dart to use go_router** (AC: #1, #4, #5)
  - [x] Import router provider
  - [x] Replace `home:` with `routerConfig:` in MaterialApp
  - [x] Remove placeholder home screen
  - [x] Verify hot reload works with router

- [x] **Task 7: Add navigation tests** (AC: #1, #2, #4)
  - [x] Test bottom navigation renders 3 tabs
  - [x] Test tab switching updates current route
  - [x] Test state preservation between tabs
  - [x] Test initial route is `/discover`

## Dev Notes

### go_router ShellRoute Pattern

The ShellRoute pattern wraps nested routes in a persistent shell (MainScaffold with bottom nav):

```dart
// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';
import '../widgets/main_scaffold.dart';
import '../../features/discover/presentation/screens/discover_screen.dart';
import '../../features/saved/presentation/screens/saved_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.discover,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: Routes.discover,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DiscoverScreen(),
            ),
          ),
          GoRoute(
            path: Routes.saved,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SavedScreen(),
            ),
          ),
          GoRoute(
            path: Routes.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      // Full-screen routes (outside shell) - for future stories
      // GoRoute(path: '/location/:id', ...),
      // GoRoute(path: '/article/:id', ...),
    ],
  );
}
```

### Route Constants

```dart
// lib/core/router/routes.dart
abstract class Routes {
  static const String discover = '/discover';
  static const String saved = '/saved';
  static const String profile = '/profile';
  
  // Deep link routes (for future stories)
  static const String locationDetail = '/location/:id';
  static const String articleDetail = '/article/:id';
}
```

### MainScaffold with Bottom Navigation

```dart
// lib/core/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/routes.dart';
import '../theme/app_colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  
  const MainScaffold({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'Đã lưu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Hồ sơ',
          ),
        ],
      ),
    );
  }
  
  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(Routes.discover)) return 0;
    if (location.startsWith(Routes.saved)) return 1;
    if (location.startsWith(Routes.profile)) return 2;
    return 0;
  }
  
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.discover);
        break;
      case 1:
        context.go(Routes.saved);
        break;
      case 2:
        context.go(Routes.profile);
        break;
    }
  }
}
```

### Placeholder Screen Pattern

```dart
// lib/features/discover/presentation/screens/discover_screen.dart
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khám phá'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Discover Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Mood-based location discovery coming soon',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
```

### Update app.dart for go_router

```dart
// lib/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class TourVNApp extends ConsumerWidget {
  const TourVNApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      title: 'TourVN',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
```

### NoTransitionPage for Smooth Tab Switching

Using `NoTransitionPage` prevents animation flicker when switching bottom nav tabs:

```dart
pageBuilder: (context, state) => const NoTransitionPage(
  child: DiscoverScreen(),
),
```

### State Preservation

The ShellRoute pattern automatically preserves state because:
1. The shell (MainScaffold) persists across route changes
2. Each tab's widget tree is built fresh but go_router manages navigation state
3. For scroll position preservation, implement `PageStorageKey` in scrollable widgets (future stories)

### Performance Considerations (NFR1: < 3s load)

- Use `NoTransitionPage` to avoid animation overhead
- Placeholder screens are lightweight
- No network calls in initial load
- Theme and router are cached via Riverpod

### Project Structure After This Story

```
lib/
├── core/
│   ├── router/
│   │   ├── app_router.dart      # GoRouter configuration with ShellRoute
│   │   ├── app_router.g.dart    # Generated Riverpod code
│   │   └── routes.dart          # Route path constants
│   ├── widgets/
│   │   └── main_scaffold.dart   # Shell with bottom navigation
│   └── ... (existing theme, providers, etc.)
├── features/
│   ├── discover/
│   │   └── presentation/
│   │       └── screens/
│   │           └── discover_screen.dart  # Placeholder
│   ├── saved/
│   │   └── presentation/
│   │       └── screens/
│   │           └── saved_screen.dart     # Placeholder
│   └── profile/
│       └── presentation/
│           └── screens/
│               └── profile_screen.dart   # Placeholder
└── app.dart  # Updated to use router
```

### Dependencies Required

Ensure `pubspec.yaml` has (should already exist from Story 1.1):
```yaml
dependencies:
  go_router: ^13.0.0
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

dev_dependencies:
  build_runner: ^2.4.7
  riverpod_generator: ^2.3.9
```

### Code Generation

After creating router provider, run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Anti-Patterns to AVOID

- ❌ Using Navigator.push instead of go_router's context.go/context.push
- ❌ Hardcoding route strings (use Routes constants)
- ❌ Using MaterialPageRoute inside ShellRoute (causes double scaffold)
- ❌ Putting business logic in MainScaffold (keep it pure navigation)
- ❌ Forgetting to run build_runner after creating @riverpod providers

### Testing Strategy

```dart
// test/core/router/app_router_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('AppRouter', () {
    test('initial location is /discover', () {
      // Test router configuration
    });
    
    test('ShellRoute contains all three tabs', () {
      // Test shell route structure
    });
  });
}

// test/core/widgets/main_scaffold_test.dart
void main() {
  group('MainScaffold', () {
    testWidgets('renders bottom navigation with 3 items', (tester) async {
      // Test bottom nav renders correctly
    });
    
    testWidgets('highlights correct tab based on route', (tester) async {
      // Test active tab highlighting
    });
  });
}
```

### References

- [Source: _bmad-output/epics.md#Story 1.4: Navigation Shell & Bottom Navigation]
- [Source: _bmad-output/architecture.md#Navigation & Routing]
- [Source: _bmad-output/architecture.md#Shell Route Configuration]
- [Source: project-context.md#Navigation (go_router)]
- [go_router Documentation](https://pub.dev/packages/go_router)
- [ShellRoute API](https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html)

### Previous Story Context (1-3)

Story 1-3 established:
- AppTheme with Material Design 3
- AppColors with primary #00BFA5
- Vietnamese typography (1.5x line height)
- 48dp touch targets
- Mood constants for future Discover screen

Use these established patterns in placeholder screens.

## Dev Agent Record

### Agent Model Used

Claude 3.5 Sonnet (Cascade)

### Debug Log References

- `flutter test` - 68 tests passed
- `dart run build_runner build` - Generated app_router.g.dart successfully

### Completion Notes List

- Implemented go_router ShellRoute pattern for bottom navigation
- Created MainScaffold with BottomNavigationBar (3 tabs with Vietnamese labels)
- Created placeholder screens for Discover, Saved, Profile
- Used NoTransitionPage for smooth tab switching (no animation jank)
- Updated app.dart to ConsumerWidget with routerConfig
- Routes.dart already existed with comprehensive route definitions
- app_router.dart updated with @riverpod provider and ShellRoute
- All 68 tests passing including 22 new navigation tests

**Code Review Fixes (2025-12-23):**
- Fixed import order: relative → package imports per project-context.md
- Changed `debugLogDiagnostics: true` → `kDebugMode` for production safety
- Added route names (`name: 'discover'`, etc.) for analytics/debugging
- Added `bottomNavigationBarTheme` to AppTheme.lightTheme for consistency

### File List

Files created:
- `lib/core/widgets/main_scaffold.dart` - Shell with bottom navigation
- `lib/features/discover/presentation/screens/discover_screen.dart` - Placeholder
- `lib/features/saved/presentation/screens/saved_screen.dart` - Placeholder
- `lib/features/profile/presentation/screens/profile_screen.dart` - Placeholder
- `test/core/router/app_router_test.dart` - Router configuration tests (12 tests)
- `test/core/widgets/main_scaffold_test.dart` - Bottom nav widget tests (10 tests)

Files modified:
- `lib/core/router/app_router.dart` - Updated with ShellRoute + @riverpod + code review fixes
- `lib/core/widgets/main_scaffold.dart` - Package imports
- `lib/core/theme/app_theme.dart` - Added bottomNavigationBarTheme
- `lib/app.dart` - ConsumerWidget with routerConfig
- `test/widget_test.dart` - Updated for new router-based app

Generated files:
- `lib/core/router/app_router.g.dart` (via build_runner)

### Change Log

- 2025-12-23: Story 1.4 implemented - Navigation Shell & Bottom Navigation complete
- 2025-12-23: Code review fixes applied - 5 issues resolved (1 HIGH, 4 MEDIUM)
