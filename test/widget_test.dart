import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tourvn_app/app.dart';

void main() {
  testWidgets('TourVNApp renders correctly with bottom navigation', (WidgetTester tester) async {
    // Build TourVNApp wrapped in ProviderScope and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: TourVNApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify bottom navigation is displayed with Vietnamese labels
    // Note: 'Khám phá' appears twice - in AppBar and BottomNav
    expect(find.text('Khám phá'), findsWidgets);
    expect(find.text('Đã lưu'), findsOneWidget);
    expect(find.text('Hồ sơ'), findsOneWidget);

    // Verify BottomNavigationBar exists
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify initial screen is Discover
    expect(find.text('Discover Screen'), findsOneWidget);
  });
}
