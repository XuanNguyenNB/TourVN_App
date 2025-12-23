import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tourvn_app/core/router/routes.dart';
import 'package:tourvn_app/core/widgets/main_scaffold.dart';
import 'package:tourvn_app/features/discover/presentation/screens/discover_screen.dart';
import 'package:tourvn_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:tourvn_app/features/saved/presentation/screens/saved_screen.dart';

part 'app_router.g.dart';

/// App router provider using GoRouter with ShellRoute pattern.
///
/// The ShellRoute wraps the main navigation tabs (Discover, Saved, Profile)
/// in a persistent shell with bottom navigation.
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.discover,
    debugLogDiagnostics: kDebugMode,
    routes: [
      // Redirect root to discover
      GoRoute(
        path: '/',
        redirect: (context, state) => Routes.discover,
      ),
      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: Routes.discover,
            name: 'discover',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DiscoverScreen(),
            ),
          ),
          GoRoute(
            path: Routes.saved,
            name: 'saved',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SavedScreen(),
            ),
          ),
          GoRoute(
            path: Routes.profile,
            name: 'profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      // Full-screen routes (outside shell) - for future stories
      // GoRoute(path: Routes.locationDetail, ...),
      // GoRoute(path: Routes.articleDetail, ...),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );
}
