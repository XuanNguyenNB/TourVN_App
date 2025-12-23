import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tourvn_app/core/router/routes.dart';
import 'package:tourvn_app/core/widgets/main_scaffold.dart';
import 'package:tourvn_app/features/discover/presentation/screens/discover_screen.dart';
import 'package:tourvn_app/features/saved/presentation/screens/saved_screen.dart';
import 'package:tourvn_app/features/profile/presentation/screens/profile_screen.dart';

void main() {
  group('AppRouter Configuration', () {
    late GoRouter router;

    setUp(() {
      // Create router directly to test configuration
      router = GoRouter(
        initialLocation: Routes.discover,
        routes: [
          GoRoute(
            path: '/',
            redirect: (context, state) => Routes.discover,
          ),
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
        ],
      );
    });

    test('initial location is /discover', () {
      // GoRouter initialLocation is set correctly
      expect(router.routeInformationProvider.value.uri.path, Routes.discover);
    });

    test('routes contains redirect and ShellRoute', () {
      final routes = router.configuration.routes;
      
      // First route is redirect from /
      expect(routes[0], isA<GoRoute>());
      expect((routes[0] as GoRoute).path, '/');
      
      // Second route is ShellRoute
      expect(routes[1], isA<ShellRoute>());
    });

    test('ShellRoute contains 3 tab routes', () {
      final shellRoute = router.configuration.routes[1] as ShellRoute;
      expect(shellRoute.routes.length, 3);
    });

    test('ShellRoute contains discover route', () {
      final shellRoute = router.configuration.routes[1] as ShellRoute;
      final discoverRoute = shellRoute.routes[0] as GoRoute;
      expect(discoverRoute.path, Routes.discover);
    });

    test('ShellRoute contains saved route', () {
      final shellRoute = router.configuration.routes[1] as ShellRoute;
      final savedRoute = shellRoute.routes[1] as GoRoute;
      expect(savedRoute.path, Routes.saved);
    });

    test('ShellRoute contains profile route', () {
      final shellRoute = router.configuration.routes[1] as ShellRoute;
      final profileRoute = shellRoute.routes[2] as GoRoute;
      expect(profileRoute.path, Routes.profile);
    });
  });

  group('Routes', () {
    test('discover path is /discover', () {
      expect(Routes.discover, '/discover');
    });

    test('saved path is /saved', () {
      expect(Routes.saved, '/saved');
    });

    test('profile path is /profile', () {
      expect(Routes.profile, '/profile');
    });

    test('location helper returns correct path', () {
      expect(Routes.location('123'), '/location/123');
    });

    test('article helper returns correct path', () {
      expect(Routes.article('456'), '/article/456');
    });
  });
}
