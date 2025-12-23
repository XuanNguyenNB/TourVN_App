import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:tourvn_app/core/utils/formatters.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('vi', null);
  });

  group('Formatters', () {
    group('formatDate', () {
      test('formats date in Vietnamese format dd/MM/yyyy', () {
        final date = DateTime(2025, 12, 23);
        expect(Formatters.formatDate(date), '23/12/2025');
      });
    });

    group('formatDateTime', () {
      test('formats date with time in Vietnamese format', () {
        final date = DateTime(2025, 12, 23, 14, 30);
        expect(Formatters.formatDateTime(date), '23/12/2025 14:30');
      });
    });

    group('formatCurrency', () {
      test('formats currency in VND with symbol', () {
        expect(Formatters.formatCurrency(1000000), contains('₫'));
        expect(Formatters.formatCurrency(1000000), contains('1'));
      });

      test('formats zero correctly', () {
        final result = Formatters.formatCurrency(0);
        expect(result, contains('0'));
        expect(result, contains('₫'));
      });
    });

    group('formatDistance', () {
      test('formats distance less than 1km in meters', () {
        expect(Formatters.formatDistance(0.5), '500 m');
        expect(Formatters.formatDistance(0.1), '100 m');
      });

      test('formats short distances in minutes', () {
        // 10km at 40km/h = 15 minutes
        expect(Formatters.formatDistance(10), '15 phút');
      });

      test('formats medium distances in hours and minutes', () {
        // 45km at 40km/h = 67.5 minutes = 1h7p
        final result = Formatters.formatDistance(45);
        expect(result, contains('h'));
      });

      test('formats long distances in km', () {
        expect(Formatters.formatDistance(100), '100 km');
        expect(Formatters.formatDistance(250), '250 km');
      });
    });

    group('formatRating', () {
      test('formats rating with one decimal place', () {
        expect(Formatters.formatRating(4.5), '4.5');
        expect(Formatters.formatRating(4.0), '4.0');
        expect(Formatters.formatRating(4.567), '4.6');
      });
    });

    group('formatReviewCount', () {
      test('formats small counts as-is', () {
        expect(Formatters.formatReviewCount(0), '0');
        expect(Formatters.formatReviewCount(999), '999');
      });

      test('formats thousands with K suffix', () {
        expect(Formatters.formatReviewCount(1000), '1.0K');
        expect(Formatters.formatReviewCount(1500), '1.5K');
        expect(Formatters.formatReviewCount(10000), '10.0K');
      });

      test('formats millions with M suffix', () {
        expect(Formatters.formatReviewCount(1000000), '1.0M');
        expect(Formatters.formatReviewCount(2500000), '2.5M');
      });
    });
  });
}
