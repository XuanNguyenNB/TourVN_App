import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tourvn_app/core/router/routes.dart';
import 'package:tourvn_app/core/theme/app_colors.dart';

/// Main scaffold with bottom navigation bar.
///
/// This widget is used as the shell for the main navigation routes
/// (Discover, Saved, Profile) using go_router's ShellRoute pattern.
class MainScaffold extends StatelessWidget {
  /// The child widget to display in the body.
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
