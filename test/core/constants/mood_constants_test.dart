import 'package:flutter_test/flutter_test.dart';

import 'package:tourvn_app/core/constants/mood_constants.dart';
import 'package:tourvn_app/core/theme/app_colors.dart';

void main() {
  group('Mood enum', () {
    test('has exactly 6 categories', () {
      expect(Mood.values.length, 6);
    });

    test('contains all required moods', () {
      expect(Mood.values, contains(Mood.chill));
      expect(Mood.values, contains(Mood.adventure));
      expect(Mood.values, contains(Mood.food));
      expect(Mood.values, contains(Mood.beach));
      expect(Mood.values, contains(Mood.culture));
      expect(Mood.values, contains(Mood.romance));
    });
  });

  group('MoodData', () {
    test('all moods have data in moodDataMap', () {
      for (final mood in Mood.values) {
        expect(moodDataMap.containsKey(mood), true,
            reason: '$mood should have data in moodDataMap');
      }
    });

    test('getMoodData returns correct data for each mood', () {
      for (final mood in Mood.values) {
        final data = getMoodData(mood);
        expect(data.mood, mood);
        expect(data.color, isNotNull);
        expect(data.icon, isNotNull);
        expect(data.labelVi, isNotEmpty);
        expect(data.labelEn, isNotEmpty);
        expect(data.emoji, isNotEmpty);
      }
    });
  });

  group('Mood colors match AppColors', () {
    test('chill mood uses moodChill color', () {
      expect(getMoodData(Mood.chill).color, AppColors.moodChill);
    });

    test('adventure mood uses moodAdventure color', () {
      expect(getMoodData(Mood.adventure).color, AppColors.moodAdventure);
    });

    test('food mood uses moodFood color', () {
      expect(getMoodData(Mood.food).color, AppColors.moodFood);
    });

    test('beach mood uses moodBeach color', () {
      expect(getMoodData(Mood.beach).color, AppColors.moodBeach);
    });

    test('culture mood uses moodCulture color', () {
      expect(getMoodData(Mood.culture).color, AppColors.moodCulture);
    });

    test('romance mood uses moodRomance color', () {
      expect(getMoodData(Mood.romance).color, AppColors.moodRomance);
    });
  });

  group('Vietnamese labels', () {
    test('chill has correct Vietnamese label', () {
      expect(getMoodData(Mood.chill).labelVi, 'Thư giãn');
    });

    test('adventure has correct Vietnamese label', () {
      expect(getMoodData(Mood.adventure).labelVi, 'Phiêu lưu');
    });

    test('food has correct Vietnamese label', () {
      expect(getMoodData(Mood.food).labelVi, 'Ẩm thực');
    });

    test('beach has correct Vietnamese label', () {
      expect(getMoodData(Mood.beach).labelVi, 'Biển');
    });

    test('culture has correct Vietnamese label', () {
      expect(getMoodData(Mood.culture).labelVi, 'Văn hóa');
    });

    test('romance has correct Vietnamese label', () {
      expect(getMoodData(Mood.romance).labelVi, 'Lãng mạn');
    });
  });

  group('allMoods list', () {
    test('contains all mood values', () {
      expect(allMoods, Mood.values);
    });

    test('has 6 items', () {
      expect(allMoods.length, 6);
    });
  });
}
