import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tourvn_app/core/router/routes.dart';
import 'package:tourvn_app/core/widgets/main_scaffold.dart';
import 'package:tourvn_app/core/theme/app_colors.dart';

void main() {
  group('MainScaffold', () {
    testWidgets('renders bottom navigation with 3 items', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.discover),
        ),
      );

      // Find BottomNavigationBar
      final bottomNav = find.byType(BottomNavigationBar);
      expect(bottomNav, findsOneWidget);

      // Verify 3 items
      final bottomNavWidget = tester.widget<BottomNavigationBar>(bottomNav);
      expect(bottomNavWidget.items.length, 3);
    });

    testWidgets('displays correct Vietnamese labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.discover),
        ),
      );

      expect(find.text('Khám phá'), findsOneWidget);
      expect(find.text('Đã lưu'), findsOneWidget);
      expect(find.text('Hồ sơ'), findsOneWidget);
    });

    testWidgets('highlights first tab (Discover) when on /discover', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.discover),
        ),
      );

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, 0);
    });

    testWidgets('highlights second tab (Saved) when on /saved', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.saved),
        ),
      );

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, 1);
    });

    testWidgets('highlights third tab (Profile) when on /profile', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.profile),
        ),
      );

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, 2);
    });

    testWidgets('uses AppColors.primary for selected item', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.discover),
        ),
      );

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.selectedItemColor, AppColors.primary);
    });

    testWidgets('uses AppColors.textSecondary for unselected items', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: _createTestRouter(Routes.discover),
        ),
      );

      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.unselectedItemColor, AppColors.textSecondary);
    });

    testWidgets('tapping Saved tab navigates to /saved', (tester) async {
      final router = _createTestRouter(Routes.discover);
      await tester.pumpWidget(
        MaterialApp.router(routerConfig: router),
      );

      // Tap Saved tab
      await tester.tap(find.text('Đã lưu'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(router.routerDelegate.currentConfiguration.uri.path, Routes.saved);
    });

    testWidgets('tapping Profile tab navigates to /profile', (tester) async {
      final router = _createTestRouter(Routes.discover);
      await tester.pumpWidget(
        MaterialApp.router(routerConfig: router),
      );

      // Tap Profile tab
      await tester.tap(find.text('Hồ sơ'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(router.routerDelegate.currentConfiguration.uri.path, Routes.profile);
    });

    testWidgets('tapping Discover tab navigates to /discover', (tester) async {
      final router = _createTestRouter(Routes.saved);
      await tester.pumpWidget(
        MaterialApp.router(routerConfig: router),
      );

      // Tap Discover tab
      await tester.tap(find.text('Khám phá'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(router.routerDelegate.currentConfiguration.uri.path, Routes.discover);
    });
  });
}

/// Creates a test router with MainScaffold shell for the given initial location.
GoRouter _createTestRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: Routes.discover,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: _TestScreen(title: 'Discover'),
            ),
          ),
          GoRoute(
            path: Routes.saved,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: _TestScreen(title: 'Saved'),
            ),
          ),
          GoRoute(
            path: Routes.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: _TestScreen(title: 'Profile'),
            ),
          ),
        ],
      ),
    ],
  );
}

/// Simple test screen widget
class _TestScreen extends StatelessWidget {
  final String title;
  const _TestScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
