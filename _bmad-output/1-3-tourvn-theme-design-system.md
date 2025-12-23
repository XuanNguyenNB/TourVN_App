# Story 1.3: TourVN Theme & Design System

Status: done

## Story

As a **user**,
I want **the app to have a consistent, beautiful Vietnamese-friendly design**,
So that **the experience feels polished and culturally appropriate**.

## Acceptance Criteria

1. **Given** the app is launched **When** the theme is applied **Then** Material Design 3 is enabled with TourVN color scheme (Primary: #00BFA5)

2. **Given** the theme is applied **When** I view any text **Then** Vietnamese typography has 1.5x line height, minimum 12sp font

3. **Given** any interactive element **When** I check its size **Then** touch targets are minimum 48dp

4. **Given** the app is launched **When** I view the AppBar **Then** it uses white/light background with dark text

5. **Given** mood-based features are used **When** I view mood chips **Then** mood accent colors are defined (Chill 🌿, Adventure 🏔️, Food 🍜, Beach 🏖️, Culture 🏛️, Romance ❤️)

## Tasks / Subtasks

- [x] **Task 1: Update app_colors.dart with TourVN palette** (AC: #1, #5)
  - [x] Change primary color from #2E7D32 to #00BFA5 (TourVN teal)
  - [x] Update primaryLight and primaryDark variants
  - [x] Define mood accent colors: Chill, Adventure, Food, Beach, Culture, Romance
  - [x] Ensure semantic colors (success, warning, error) have good contrast

- [x] **Task 2: Create app_typography.dart** (AC: #2)
  - [x] Create Vietnamese-optimized TextTheme with 1.5x line height
  - [x] Set minimum font size to 12sp for body text
  - [x] Configure headline, title, body, and label styles
  - [x] Use system font (no custom font required for MVP)

- [x] **Task 3: Update app_theme.dart with complete theme** (AC: #1, #3, #4)
  - [x] Configure AppBar theme: white/light surface, dark text
  - [x] Set Material 3 visual density for 48dp touch targets
  - [x] Apply Vietnamese typography from app_typography.dart
  - [x] Configure component themes (buttons, cards, inputs, bottom sheets)
  - [x] Add iconTheme with appropriate sizes

- [x] **Task 4: Create mood_constants.dart** (AC: #5)
  - [x] Define Mood enum with 6 categories
  - [x] Map each mood to: color, icon, Vietnamese label, English label
  - [x] Export mood list for UI consumption

- [x] **Task 5: Update app.dart to use AppTheme** (AC: #1)
  - [x] Import AppTheme from core/theme
  - [x] Replace inline ThemeData with AppTheme.lightTheme
  - [x] Verify theme applies correctly

- [x] **Task 6: Add theme tests** (AC: #1, #2, #3)
  - [x] Test primary color is #00BFA5
  - [x] Test typography line height is 1.5
  - [x] Test minimum touch target size configuration

## Dev Notes

### TourVN Color Palette

```dart
// Primary: Teal/Turquoise - represents Vietnamese water, beaches
static const Color primary = Color(0xFF00BFA5);       // Main brand color
static const Color primaryLight = Color(0xFF5DF2D6);  // Lighter variant
static const Color primaryDark = Color(0xFF008E76);   // Darker variant

// Mood Colors (for mood chips on Discover screen)
static const Color moodChill = Color(0xFF81C784);      // 🌿 Chill - Green
static const Color moodAdventure = Color(0xFFFFB74D);  // 🏔️ Adventure - Orange
static const Color moodFood = Color(0xFFE57373);       // 🍜 Food - Red
static const Color moodBeach = Color(0xFF4FC3F7);      // 🏖️ Beach - Light Blue
static const Color moodCulture = Color(0xFF9575CD);    // 🏛️ Culture - Purple
static const Color moodRomance = Color(0xFFF06292);    // ❤️ Romance - Pink
```

### Vietnamese Typography Requirements

```dart
// Vietnamese characters need more vertical space
// Line height: 1.5 (150% of font size)
// Minimum body font: 12sp
// Recommended body font: 14sp

static const TextTheme vietnameseTextTheme = TextTheme(
  displayLarge: TextStyle(height: 1.5, fontSize: 57),
  displayMedium: TextStyle(height: 1.5, fontSize: 45),
  displaySmall: TextStyle(height: 1.5, fontSize: 36),
  headlineLarge: TextStyle(height: 1.5, fontSize: 32),
  headlineMedium: TextStyle(height: 1.5, fontSize: 28),
  headlineSmall: TextStyle(height: 1.5, fontSize: 24),
  titleLarge: TextStyle(height: 1.5, fontSize: 22),
  titleMedium: TextStyle(height: 1.5, fontSize: 16, fontWeight: FontWeight.w500),
  titleSmall: TextStyle(height: 1.5, fontSize: 14, fontWeight: FontWeight.w500),
  bodyLarge: TextStyle(height: 1.5, fontSize: 16),
  bodyMedium: TextStyle(height: 1.5, fontSize: 14),
  bodySmall: TextStyle(height: 1.5, fontSize: 12),  // Minimum 12sp
  labelLarge: TextStyle(height: 1.5, fontSize: 14, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(height: 1.5, fontSize: 12, fontWeight: FontWeight.w500),
  labelSmall: TextStyle(height: 1.5, fontSize: 11, letterSpacing: 0.5),
);
```

### AppBar Configuration (Modern Light Style)

```dart
appBarTheme: AppBarTheme(
  backgroundColor: Colors.white,         // Light background
  foregroundColor: AppColors.textPrimary, // Dark text
  elevation: 0,                           // Flat, modern look
  centerTitle: false,                     // Left-aligned (Android style)
  surfaceTintColor: Colors.transparent,   // No M3 tint
  iconTheme: IconThemeData(
    color: AppColors.textPrimary,
    size: 24,
  ),
),
```

### Touch Target Requirements (48dp minimum)

```dart
// Material 3 visual density ensures 48dp minimum
visualDensity: VisualDensity.standard,

// Icon buttons
iconButtonTheme: IconButtonThemeData(
  style: IconButton.styleFrom(
    minimumSize: const Size(48, 48),
    padding: const EdgeInsets.all(12),
  ),
),

// Text buttons
textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(
    minimumSize: const Size(48, 48),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
),
```

### Mood Constants Structure

```dart
enum Mood {
  chill,
  adventure,
  food,
  beach,
  culture,
  romance,
}

class MoodData {
  final Mood mood;
  final Color color;
  final IconData icon;
  final String labelVi;
  final String labelEn;
  
  const MoodData({...});
}

const Map<Mood, MoodData> moodDataMap = {
  Mood.chill: MoodData(
    mood: Mood.chill,
    color: AppColors.moodChill,
    icon: Icons.spa,           // or custom icon
    labelVi: 'Thư giãn',
    labelEn: 'Chill',
  ),
  // ... other moods
};
```

### Existing Files to Modify

| File | Current State | Changes Needed |
|------|---------------|----------------|
| `lib/core/theme/app_colors.dart` | Primary #2E7D32 | Change to #00BFA5, add mood colors |
| `lib/core/theme/app_theme.dart` | Basic M3 theme | Add typography, AppBar, touch targets |
| `lib/app.dart` | Inline ThemeData | Use AppTheme.lightTheme |

### Files to Create

| File | Purpose |
|------|---------|
| `lib/core/theme/app_typography.dart` | Vietnamese-optimized text styles |
| `lib/core/constants/mood_constants.dart` | Mood enum and data mapping |
| `test/core/theme/app_theme_test.dart` | Theme validation tests |

### Anti-Patterns to AVOID

- ❌ Hardcoding colors in widgets (use AppColors)
- ❌ Hardcoding text styles (use Theme.of(context).textTheme)
- ❌ Touch targets smaller than 48dp
- ❌ Font sizes below 12sp for readable text
- ❌ Custom fonts in MVP (use system font for performance)

### References

- [Source: _bmad-output/epics.md#Story 1.3: TourVN Theme & Design System]
- [Source: _bmad-output/architecture.md#Project Structure - theme/]
- [Source: project-context.md#Technology Stack - Material Design 3]
- [Material Design 3 Color System](https://m3.material.io/styles/color)
- [Material Design 3 Typography](https://m3.material.io/styles/typography)

## Dev Agent Record

### Agent Model Used

Claude 3.5 Sonnet (Cascade)

### Debug Log References

- `flutter test` - 47 tests passed
- `flutter analyze` - 4 info warnings (deprecation in generated code, expected)

### Completion Notes List

- Updated primary color from #2E7D32 to #00BFA5 (TourVN teal)
- Created Vietnamese typography with 1.5x line height for all text styles
- Configured 48dp minimum touch targets for all interactive elements
- AppBar uses white background (#FFFFFF) with dark text (#212121)
- Added 6 mood colors: Chill, Adventure, Food, Beach, Culture, Romance
- Created MoodData class with Vietnamese/English labels and icons
- Added 16 unit tests for theme validation

**Code Review Fixes (2025-12-23):**
- Fixed app.dart to use AppColors.primary and Theme.textTheme instead of hardcoded values
- Added 18 unit tests for mood_constants.dart
- Added missing button theme configurations to darkTheme for 48dp touch targets

### File List

Files created:
- `lib/core/theme/app_typography.dart` - Vietnamese-optimized text styles
- `lib/core/constants/mood_constants.dart` - Mood enum and data mapping
- `test/core/theme/app_theme_test.dart` - Theme validation tests (16 tests)
- `test/core/constants/mood_constants_test.dart` - Mood constants tests (18 tests)

Files modified:
- `lib/core/theme/app_colors.dart` - Updated primary to #00BFA5, added mood colors
- `lib/core/theme/app_theme.dart` - Complete theme with typography, AppBar, touch targets (light + dark)
- `lib/app.dart` - Uses AppTheme.lightTheme, Theme.textTheme, AppColors

### Change Log

- 2025-12-23: Story 1.3 implemented - TourVN Theme & Design System complete
- 2025-12-23: Code review fixes applied - hardcoded values removed, dark theme buttons, mood tests
