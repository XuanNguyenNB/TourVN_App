---
stepsCompleted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
status: complete
inputDocuments:
  - "_bmad-output/prd.md"
  - "_bmad-output/analysis/product-brief-tourvn_app-2025-12-23.md"
  - "_bmad-output/analysis/brainstorming-session-2025-12-23.md"
workflowType: 'ux-design'
lastStep: 0
project_name: 'tourvn_app'
user_name: 'Nguye'
date: '2025-12-23'
---

# UX Design Specification tourvn_app

**Author:** Nguye
**Date:** 2025-12-23

---

## Executive Summary

### Project Vision

TourVN transforms Vietnamese travel discovery through mood-based navigation and AI-curated content. The core UX promise: **Open → Feel → Discover → Go** in under 60 seconds. By combining emotional filtering with verified tour guides and fresh TikTok-sourced articles, TourVN makes trip planning feel intuitive rather than overwhelming.

### Target Users

**Primary: Nguyen (The Weekend Explorer)**
- 25-year-old university student in Hanoi
- Opens app when she "doesn't know where to go"
- Wants hidden gems, not tourist traps
- Success: Finds perfect destination matching her mood AND has a great experience

**Secondary: Minh (The Local Guide)**
- 32-year-old tour guide in Da Nang
- Needs platform visibility and credibility
- May have basic tech skills - requires confidence-building UX
- Success: Quick KYC approval → First booking → Becomes app ambassador

**Operator: Admin (Solo)**
- Manages content quality and trust
- Reviews AI articles, KYC applications, reports
- Success: Efficient moderation without bottlenecks

### Key Design Challenges

1. **Mood-to-Destination Mapping** - Translating emotions into satisfying search results (constrain to 5-7 moods for technical + UX sanity)
2. **Trust Building at Scale** - Signaling credibility for AI content and unverified guides
3. **Empty State Grace with Emotional Continuity** - Mood-adjacent suggestions before trending fallbacks to keep emotional connection alive
4. **Expectation Management** - Honest content (real photos, difficulty levels) to prevent post-visit disappointment
5. **Multi-Role Experience** - Natural Tourist ↔ Guide transitions
6. **Guide Onboarding Friction** - Complex KYC flow for non-tech-savvy users needs confidence-building design
7. **Vietnamese Mobile UX** - Native-feeling typography, touch interactions, and offline-first patterns for unreliable networks

### Design Opportunities

1. **Emotion-Driven Interface** - Colors and animations reinforce selected mood throughout journey
2. **Progressive Disclosure** - Just enough to intrigue without overwhelming
3. **Trust Badges** - Clear visual hierarchy of verification signals
4. **Location-Aware Defaults** - Smart defaults reduce cognitive load
5. **Seamless Fallbacks** - Mood-adjacent suggestions → Trending keeps discovery alive
6. **Guide-as-Ambassador** - Fast, confidence-building KYC drives word-of-mouth growth
7. **Offline-First Design Patterns** - Skeleton screens, optimistic updates, graceful degradation for poor Vietnamese mobile networks

## Core User Experience

### Defining Experience

TourVN's core experience is **Mood-Based Destination Discovery**. The defining interaction loop:

1. **Feel** - User selects emotional category (Chill, Adventure, Food, etc.)
2. **Filter** - Results filtered by distance from current location
3. **Discover** - Browse cards with hero images and key details
4. **Deep Dive** - Read AI-curated articles and verified reviews
5. **Connect** - Contact verified tour guide or navigate independently

**Core Promise:** 
- **60 seconds to INTRIGUE** - From app open to "this looks perfect!"
- **3 minutes to COMMIT** - Article + reviews + photos build confidence to act

### Platform Strategy

| Attribute | Specification |
|-----------|---------------|
| **Primary Platform** | Flutter mobile (iOS 12+, Android 8+ API 26) |
| **Min Screen Size** | 4.7" (iPhone SE) - affects touch target sizing |
| **Interaction Model** | Touch-first, one-handed optimization |
| **State Management** | Riverpod - enables state restoration on app resume |
| **Secondary Platform** | React Admin Dashboard (web) |
| **Offline Strategy** | MVP: Graceful degradation with cached content display |
| **Key Permissions** | Location (when in use), Camera/Gallery (KYC, reviews) |

### Effortless Interactions

| Interaction | Target Experience |
|-------------|-------------------|
| Mood Selection | Single tap → skeleton cards immediately (< 100ms perceived) |
| Destination Browsing | 60fps infinite scroll, progressive image loading |
| Distance Display | Human-readable ("2h drive", "30min walk") |
| Article Reading | Progressive reveal, no loading walls |
| Guide Contact | One tap to reveal contact info |
| Location Navigation | One tap to open external maps |
| **App Resume** | Return to exact scroll position and mood filter - never reset state |

### Critical Success Moments

1. **First Mood Result** - Skeleton → cards appear, emotional match felt immediately
2. **Confidence Building** - Article + reviews provide enough social proof to commit (may take 2-3 minutes - that's okay)
3. **Article Quality** - If AI content feels authentic and useful, trust grows
4. **Empty State Recovery** - If fallbacks keep her engaged, she stays
5. **Guide Responsiveness** - If guides respond quickly, marketplace works
6. **Post-Trip Return** - If she opens app again next weekend, we've won

### Experience Principles

1. **🎭 Mood First, Location Second** - Emotions drive navigation, geography filters results
2. **⚡ Instant Intrigue, Patient Confidence** - First scroll delivers emotional match immediately; deep content earns commitment at user's pace
3. **🎬 Perceived Speed Over Actual Speed** - Skeleton screens + animations make waits feel faster than blank screens
4. **🤝 Trust Through Transparency** - AI labels, KYC badges, real photos - never hide content provenance
5. **🌊 Graceful Degradation** - Empty states, slow networks, denied permissions all have recovery paths
6. **📱 One-Handed Vietnamese Mobile** - Large touch targets (44x44pt min), Vietnamese typography, thumb zones prioritized

## Desired Emotional Response

### Primary Emotional Goals

**For Tourists (Nguyen):**
- **"This app gets me"** - The mood filter makes her feel understood before she even knows what she wants
- **"Worth my time"** - Every interaction delivers value, no dead ends
- **"I can trust this"** - AI content feels authentic; guide feels verified

**For Guides (Minh):**
- **"I'm legitimate now"** - KYC verification gives professional credibility
- **"The platform works"** - First inquiry validates the decision to join
- **"Building something"** - Growing profile creates professional identity

### Emotional Journey Mapping

**Tourist Journey:**
| Stage | Emotion | Design Trigger |
|-------|---------|----------------|
| App Open | Curiosity | Inviting mood icons |
| Mood Selection | Recognition | "That's exactly how I feel!" |
| Browsing | Excitement | Beautiful discovery cards |
| Reading | Trust | Authentic, honest content |
| Reviews | Validation | Social proof |
| Contact | Assurance | KYC badge, responsive guide |
| Return | Loyalty | "I want that feeling again" |

**Guide Journey:**
| Stage | Emotion | Design Trigger |
|-------|---------|----------------|
| Registration | Hope | Clear value proposition |
| KYC Upload | Confidence | Step-by-step guidance |
| Waiting | Patience | Status updates, timeframes |
| Approval | Pride | Celebration moment |
| First Inquiry | Validation | Platform works! |

### Micro-Emotions

**Cultivate:**
- Confidence → Clear expectations before commitment
- Delight → Micro-animations, celebration moments
- Trust → Transparent labeling, verification badges
- Accomplishment → "Perfect match found!" feedback
- Belonging → Vietnamese-first, local gems focus

**Prevent:**
- Confusion → Clear labels, intuitive navigation
- Anxiety → Progress indicators, immediate feedback
- Skepticism → "AI-curated" labels, real photos
- Frustration → Mood-adjacent fallbacks, never dead ends
- Exclusion → Accessible design, local language priority

### Emotional Design Principles

1. **🎯 Recognition Before Search** - Users feel understood when mood options match their vague feelings
2. **🎉 Celebrate Milestones** - Guide approval, first review, saved destination - mark achievements
3. **🛡️ Transparency Builds Trust** - Label AI content, show verification levels, display real metrics
4. **💬 Never Leave Users Hanging** - Every action gets feedback; every empty state offers next steps
5. **🌟 Delight in Details** - Subtle animations, thoughtful copy, moments that exceed expectations

## UX Pattern Analysis & Inspiration

### Inspiring Products Analysis

**Spotify - Mood-Based Discovery**
- Mood playlists as primary navigation (emotions, not just categories)
- Personalized, time-aware content recommendations
- Seamless infinite scroll with progressive loading
- AI curation that feels personal, not algorithmic

**Grab/Gojek - Vietnamese Super-App UX**
- Bottom navigation optimized for one-handed use
- Location-first with clear permission value proposition
- Trust badges and verification systems
- Vietnamese-native typography and formatting

**Pinterest - Visual Discovery**
- Image-first card design with variable heights
- One-tap save functionality (frictionless bookmarking)
- "More like this" for continuous discovery
- Visual hierarchy prioritizing photos over text

**Airbnb - Trust & Booking UX**
- Immersive, swipeable photo galleries
- Review summaries with extracted themes
- Host verification with clear trust hierarchy
- Honest expectation setting (difficulty, amenities)

**Xiaohongshu (Little Red Book) - Authentic Content Feel**
- Discovery feed feels like tips from friends, not algorithms
- Real photos with honest captions, not polished marketing
- Save collections organized by user, shareable
- **Key insight:** TourVN AI articles should feel like Xiaohongshu posts - authentic, personal, "from a friend who just visited"

**Google Maps - Contextual Navigation**
- Bottom sheets for location details (keeps context visible)
- Slide-up action sheets instead of full-page navigation
- User never feels "lost" in navigation stack

### Transferable UX Patterns

**Navigation:**
- Mood chips as horizontal scrollable primary filter (Spotify-inspired)
- Role-aware bottom navigation (same structure, different content):
  - **Tourist:** Discover / Saved / Profile
  - **Guide:** Tours / Inquiries / Profile
- Profile tab as role switcher (keeps navigation simple)
- Pull-to-refresh for destination lists

**Interaction:**
- One-tap save with heart icon, no confirmation (Pinterest)
- Swipeable photo galleries (Airbnb)
- Skeleton → Image → Text loading sequence
- **Contextual bottom sheets** for details (Google Maps) - slide-up instead of full navigation

**Visual:**
- Card-based discovery with hero images (Pinterest)
- Badge system: Verified ✓, AI-curated 🤖, Trending 🔥 (Grab/Airbnb)
- Distance as compact pills: "2h drive", "30min" (Google Maps)
- Xiaohongshu-style authentic content presentation for AI articles

### Anti-Patterns to Avoid

1. **Login Wall Before Value** - Show browse first, login only for save/contact actions
2. **Permission Spam** - Request location/camera just-in-time, not on first launch
3. **Hidden AI Provenance** - Always label AI-generated content transparently
4. **Dead-End Empty States** - Every "no results" must offer next steps
5. **Complex Filter Hierarchy** - Mood → Distance only, no province/district drilling
6. **Tiny Touch Targets** - Minimum 44x44pt, Vietnamese text needs extra padding
7. **Role-Confused Navigation** - Guides shouldn't dig through tourist UI to find their dashboard
8. **Onboarding Preference Overload** - Skip explicit preference surveys for MVP; use implicit behavior

### Design Inspiration Strategy

**Adopt Directly:**
- Bottom navigation pattern (familiar to Vietnamese users via Grab)
- One-tap save interaction (proven by Pinterest)
- Skeleton loading states (industry standard)
- Badge-based trust signals (Grab/Airbnb verified patterns)
- Contextual bottom sheets for details (Google Maps pattern, native Flutter support)

**Adapt for TourVN:**
- Spotify mood playlists → TourVN mood categories (travel-specific emotions)
- Pinterest masonry → Simpler card grid (travel photos need consistent aspect ratios)
- Airbnb reviews → Simpler rating display (MVP scope)
- Xiaohongshu authentic feel → AI articles styled as "friend tips" not "algorithm outputs"
- Role-aware nav → Same bottom nav structure, content changes based on Tourist/Guide role

**Avoid:**
- Airbnb's complex booking flow (MVP uses contact exchange only)
- Pinterest's infinite variations (stick to 5-7 moods max)
- Spotify's algorithm complexity (simple distance + mood filtering for MVP)
- Onboarding preference surveys (collect behavior implicitly instead)

### First-Time User Flow Target

**Install → Open → Browse in < 3 taps:**
1. App opens → Home screen with mood selection visible
2. (Optional) Skip login prompt or quick social login
3. Tap mood → See destinations immediately

No login wall. No preference survey. Value delivered instantly.

## Design System Foundation

### Design System Choice

**Selected:** Material Design 3 with Custom TourVN Theme

Material Design 3 provides the foundation with TourVN-specific customizations for brand differentiation and Vietnamese mobile UX optimization.

### Rationale for Selection

1. **Development Speed** - Built-in Flutter components reduce development time by 40-60%
2. **Vietnamese User Familiarity** - Android dominates Vietnam market; Material patterns feel native
3. **Solo Developer Efficiency** - Less custom code means faster shipping and easier maintenance
4. **Customization Flexibility** - Material 3 theming allows full brand differentiation
5. **Platform Adaptivity** - `.adaptive` widgets provide native feel on both iOS and Android
6. **Accessibility Built-In** - WCAG compliance with minimal extra effort

### Implementation Approach

**Theme Structure:**
```dart
ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: TourVNColors.primary,
    brightness: Brightness.light,
  ),
  textTheme: TourVNTypography.vietnamese,
  cardTheme: TourVNCards.rounded,
)
```

**Key Customizations:**
- **Color System:** Mood-based palette (warm for Adventure, cool for Chill, etc.)
- **Typography:** Vietnamese-optimized font sizing and line heights
- **Shapes:** Softer, rounded corners (16dp radius) for friendly feel
- **Elevation:** Subtle shadows for card depth without heaviness
- **Icons:** Mix of Material Icons + custom mood icons

### Customization Strategy

**Phase 1 (MVP):**
- Define primary color palette and mood colors
- Customize card components for destination cards
- Vietnamese typography configuration
- Badge component for verification/AI labels

**Phase 2 (Post-MVP):**
- Refined animations and micro-interactions
- Dark mode support
- Extended icon set
- Component library documentation

### Component Priority

| Component | Priority | Customization Level |
|-----------|----------|---------------------|
| Bottom Navigation | P0 | Theme colors only |
| Destination Cards | P0 | Heavy customization |
| Mood Chips | P0 | Custom component |
| Bottom Sheets | P0 | Theme + sizing |
| Badges (Verified, AI) | P0 | Custom component |
| Photo Gallery | P1 | Light customization |
| Form Inputs | P1 | Theme only |
| Buttons | P1 | Theme + sizing |

## Defining Experience

### The Core Interaction

**TourVN's Defining Experience:** "Feel your mood → See perfect destinations"

The magic moment occurs when a user taps a mood category and instantly sees destinations that match what they were vaguely feeling. No typing, no complex filters - just emotional recognition leading to visual discovery.

**One-Sentence Pitch:** "TourVN is the app where you tap how you feel and discover where to go."

### User Mental Model

**Current Solutions & Pain Points:**
- TikTok: Content disappears in feed, not organized for planning
- Google: Overwhelming results, requires knowing what you want
- Friends: Limited knowledge, inconsistent availability
- Review sites: Complex filters, province/district drilling

**User Expectation:**
- "Show me options based on how I feel, not what I know"
- "Understand me before I can articulate what I want"
- "Results should feel curated for me, not algorithmic"

**Confusion Points to Prevent:**
- Too many filter options → Keep to mood + distance only
- Empty results → Always provide fallbacks
- Fake-feeling AI content → Transparent labeling + authentic tone

### Success Criteria

| Criteria | Target | Why It Matters |
|----------|--------|----------------|
| Mood Recognition | "That's exactly my mood!" tap | Users feel understood |
| Instant Results | < 500ms to first card | Perceived speed = quality |
| Result Relevance | First 3 results feel right | Builds trust immediately |
| Discovery Delight | "I didn't know this existed!" | Differentiates from search |
| Action Completion | User views article/reviews | Core journey succeeds |

### Novel UX Patterns

**Innovation: Mood-Based Navigation**
- Emotions as primary filter (not categories/locations)
- Horizontal mood chips replace traditional dropdowns
- Visual icons + labels for quick recognition
- Color reinforcement of selected mood throughout session

**Established Patterns Adopted:**
- Card-based browsing (Pinterest/Airbnb)
- Contextual bottom sheets (Google Maps)
- Distance pills (Grab/Maps)
- One-tap save (Pinterest)

**Our Differentiation:** Novel mood selection + established browsing = low learning curve, high uniqueness

### Experience Mechanics

**1. Initiation**
- App opens to home with mood chips above fold
- Visual: Horizontal scroll with icons + Vietnamese labels
- No login required to browse

**2. Interaction**
- Single tap on mood chip
- Chip highlights immediately (< 50ms visual feedback)
- Skeleton cards appear (< 100ms perceived)
- Real content loads progressively

**3. Feedback**
- Cards populate with destination images
- Distance badges confirm relevance ("2h từ bạn")
- Empty state: Mood-adjacent suggestions, never dead end

**4. Completion**
- Tap card → Bottom sheet with details
- Clear next actions: Read Article, View Reviews, Contact Guide, Navigate
- Save button always visible

## Visual Design Foundation

### Color System

**Brand Palette with On-Colors:**
| Role | Hex | On-Color | Usage |
|------|-----|----------|-------|
| Primary | `#00BFA5` | `#000000` (Black) | Main actions, brand identity |
| Primary Dark | `#00897B` | `#FFFFFF` (White) | Accents, emphasis (NOT for AppBar backgrounds) |
| Secondary | `#FF7043` | `#000000` (Black) | CTAs, highlights |
| Background | `#FAFAFA` | `#212121` (Dark Gray) | Page backgrounds |
| Surface | `#FFFFFF` | `#212121` (Dark Gray) | Cards, sheets |

**On-Color Rationale:**
- Primary `#00BFA5` is relatively bright → **Black text** ensures readability outdoors/in sunlight
- Contrast ratio: Black on `#00BFA5` = 7.4:1 (exceeds WCAG AAA)
- White on `#00BFA5` = 2.8:1 (fails WCAG AA for small text)

**Modern AppBar Approach:**
- **Recommended:** White/Light Gray AppBar background with Dark text/icons
- **Avoid:** Dark colored AppBar backgrounds (dated Android look)
- Primary Dark retained in palette for accent use, not header backgrounds

**Mood Accent Colors:**
| Mood | Hex | On-Color | Association |
|------|-----|----------|-------------|
| 🌿 Chill | `#81C784` | `#000000` | Relaxation |
| 🏔️ Adventure | `#FF9800` | `#000000` | Energy |
| 🍜 Food | `#E57373` | `#000000` | Warmth |
| 🏖️ Beach | `#4FC3F7` | `#000000` | Freedom |
| 🏛️ Culture | `#9575CD` | `#FFFFFF` | Heritage |
| ❤️ Romance | `#F48FB1` | `#000000` | Intimacy |

**Semantic Colors:**
| Role | Hex | On-Color | Usage |
|------|-----|----------|-------|
| Success | `#4CAF50` | `#FFFFFF` | Confirmations |
| Warning | `#FFC107` | `#000000` | Cautions |
| Error | `#F44336` | `#FFFFFF` | Errors |
| Verified | `#1E88E5` | `#FFFFFF` | KYC badge |
| AI Label | `#7E57C2` | `#FFFFFF` | AI content |

### Elevation & Shadows

**Material 3 Elevation System:**
| State | Elevation | Shadow | Usage |
|-------|-----------|--------|-------|
| Surface (flat) | 0 | None | Backgrounds |
| Card (default) | 1 | Subtle | Destination cards, info cards |
| Card (hovered/focused) | 2 | Light | Interactive feedback |
| Card (pressed) | 3 | Medium | Active touch state |
| Bottom Sheet | 3 | Medium | Modal overlays |
| FAB | 6 | Prominent | Floating action buttons |
| Dialog | 24 | Strong | Modal dialogs |

### Typography System

**Font:** Roboto (Flutter default, excellent Vietnamese support)

**Type Scale:**
| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| H1 | 24sp | Bold | Screen titles |
| H2 | 20sp | SemiBold | Section headers |
| H3 | 18sp | SemiBold | Card titles |
| Body Large | 16sp | Regular | Article text |
| Body | 14sp | Regular | Descriptions |
| Caption | 12sp | Regular | Metadata |

**Vietnamese Optimization:** 1.5x line height, minimum 12sp font size

### Spacing & Layout Foundation

**Base Unit:** 8dp

| Token | Value | Usage |
|-------|-------|-------|
| xs | 4dp | Tight spacing |
| sm | 8dp | Chip padding |
| md | 16dp | Card padding |
| lg | 24dp | Screen margins |
| xl | 32dp | Section gaps |

**Layout Standards:**
- Screen margins: 16dp
- Card spacing: 12dp
- Card radius: 12dp
- Bottom nav: 56dp height
- Touch targets: 48dp minimum

### Accessibility Considerations

- WCAG AA contrast compliance (4.5:1 body text)
- On-Colors verified for all primary surfaces
- 48dp minimum touch targets
- Support system font scaling (1.0x - 2.0x)
- Color-independent design (icons + labels always paired)
- Visible focus states for keyboard/accessibility navigation

## Screen Layouts & User Flows

### Design Direction

**Approach:** "Mood-First Discovery" - Clean, image-forward, emotion-driven design

**Key Decisions:**
| Element | Choice | Rationale |
|---------|--------|-----------|
| Navigation | Bottom tabs (3) | Thumb-friendly, Vietnamese app familiarity |
| Content Focus | Full-bleed images | Travel is visual-first |
| Information Density | Medium-low | Spacious, not overwhelming |
| Interaction Model | Cards → Bottom sheets | Maintain context |
| Header Style | White/transparent | Modern, content-focused |

### Core Screens

**1. Home / Discover**
- Light AppBar with logo + search + profile
- Mood chips (horizontal scroll) as primary filter
- Distance toggle as secondary filter
- Infinite scroll destination cards
- Bottom navigation: Discover / Saved / Profile

**2. Location Detail (Bottom Sheet)**
- Swipeable photo gallery
- Title, rating, distance
- Tab selector: Article / Reviews
- AI-curated label visible
- Action buttons: Navigate / Contact Guide

**3. Guide Profile (Bottom Sheet)**
- Avatar, name, verified badge
- Rating, tour count
- Bio excerpt
- Tour listings with pricing
- Primary CTA: Contact

**4. Saved Screen**
- Grouped by mood categories
- Grid layout for visual browsing
- Edit mode for removal

**5. Empty States**
- Mood-adjacent suggestions first
- Trending fallback second
- Never a dead end

### Tourist User Flow

```
App Open → Home (Mood visible)
    ↓
Tap Mood Chip → Cards load (skeleton → real)
    ↓
Tap Card → Bottom Sheet slides up
    ↓
Read Article / Reviews → Build confidence
    ↓
Tap "Contact Guide" → Guide profile sheet
    ↓
Tap "Contact" → Contact info revealed
```

### Guide User Flow (Role Switch)

```
Profile → "Become a Guide" / Switch to Guide
    ↓
Guide Home: Tours / Inquiries / Profile tabs
    ↓
Create Tour → Form with pricing, photos
    ↓
Submit → Admin review (pending state)
    ↓
Approved → Tour visible to tourists
```

### Key Interaction Patterns

1. **Mood Selection:** Single tap → immediate skeleton → progressive load
2. **Card to Detail:** Tap → bottom sheet (keep scroll position)
3. **Save:** Heart tap → instant (no confirmation), haptic feedback
4. **Navigation:** Bottom sheet for details, full screens only for editing
5. **Empty Recovery:** Mood-adjacent chips → Trending section

## User Journey Flows

### Journey 1: Tourist Discovery Flow

**Nguyen's Weekend Discovery:**
1. App Open → Mood chips visible above fold
2. Tap mood (e.g., "Chill 🌿") → Skeleton cards appear
3. Cards load progressively → Browse with infinite scroll
4. Tap card → Bottom sheet with photos/article/reviews
5. Build confidence → Tap "Contact Guide"
6. Guide profile → View tours & pricing
7. Tap "Contact" → Info revealed → Success!

**Key Metrics:**
- Time to first card: < 500ms
- Steps to contact guide: 4 taps from mood selection

**Aha Moment:** First time mood filter returns exactly what she was vaguely feeling

### Journey 2: Guide Registration Flow

**Minh's Onboarding:**
1. Profile → "Become a Guide" CTA
2. Value proposition → Start registration
3. Step 1: Basic info (name, phone, location)
4. Step 2: KYC (ID photo, selfie, license) - with Save Progress option
5. Step 3: Review & Submit
6. Pending state with 24-48h timeframe
7. Push notification on approval
8. Guide dashboard unlocked → Create first tour

**Key Metrics:**
- Registration completion: < 10 minutes
- KYC approval: 24-48 hours target

**Aha Moment:** First booking inquiry notification - "The platform works!"

### Journey 3: Empty State Recovery

**Never a Dead End:**
1. No results for mood + location
2. Show mood-adjacent suggestions ("Similar: 🌿 Chill, 🌲 Nature")
3. If rejected → Show trending for original mood
4. User always has next action available

### Journey Patterns

**Navigation:** Bottom sheets for details, tabs for content switching, infinite scroll for browsing

**Feedback:** Skeleton loading, haptic on save, toast confirmations, progress indicators

**Recovery:** Mood-adjacent fallbacks, trending suggestions, retry guidance, offline banners

**State Restoration:** App resume restores selected mood, scroll position, and bottom sheet state

### Micro-Interaction Specifications

| Interaction | Animation | Duration |
|-------------|-----------|----------|
| Heart Save | Scale 1.0 → 1.2 → 1.0 with bounce | 300ms |
| Mood Chip Select | Color fill left-to-right | 200ms |
| Bottom Sheet Open | Spring physics slide-up | 350ms |
| Card Appear | Fade in + slight slide up | 250ms |
| Skeleton Shimmer | Left-to-right gradient | 1500ms loop |

### Network State Handling

| State | UX Response |
|-------|-------------|
| Network loss during browse | Show cached cards + sticky banner "Offline - showing saved content" |
| Network loss during KYC | Queue upload + "Will retry when connected" message |
| Network recovery | Silent sync, remove banner, no user action needed |
| Slow connection | Show skeleton longer, no error until timeout (10s) |

### UX Acceptance Criteria

**Tourist Discovery Flow:**
- [ ] Mood tap → skeleton visible < 100ms
- [ ] Cards load → first card visible < 500ms  
- [ ] Empty state → fallbacks always shown
- [ ] Bottom sheet → maintains scroll position on close
- [ ] Save → haptic feedback fires
- [ ] App resume → state restored correctly

**Guide Registration Flow:**
- [ ] KYC upload → progress indicator visible
- [ ] Validation error → specific field highlighted
- [ ] Save progress → data persisted on exit
- [ ] Submit → pending state with timeframe shown
- [ ] Approval → push notification delivered

---

## Summary

### Document Status

**UX Design Specification for TourVN** - Complete ✅

**Created:** 2025-12-23
**Author:** Nguye + Sally (UX Designer)
**Reviewed by:** BMAD Team (Mary, John, Winston, Amelia, Murat)

### Key Deliverables

| Section | Status |
|---------|--------|
| Executive Summary | ✅ Complete |
| Core User Experience | ✅ Complete |
| Desired Emotional Response | ✅ Complete |
| UX Pattern Analysis & Inspiration | ✅ Complete |
| Design System Foundation | ✅ Complete |
| Defining Experience | ✅ Complete |
| Visual Design Foundation | ✅ Complete |
| Screen Layouts & User Flows | ✅ Complete |
| User Journey Flows | ✅ Complete |

### Next Steps

1. **Architecture Design** - Create technical architecture based on this UX spec
2. **Story Creation** - Break down into implementable user stories
3. **Wireframe/Mockup** - Create visual wireframes (optional - spec has ASCII layouts)
4. **Development** - Begin Flutter implementation following this spec

### PRD Alignment Verification

| PRD Metric | UX Support | Status |
|------------|------------|--------|
| Time-to-Value < 60s | Mood → Card flow optimized | ✅ |
| 1,000 users target | No login wall, instant value | ✅ |
| 20+ verified guides | Confidence-building KYC | ✅ |
| 80% AI approval rate | Transparent AI labels | ✅ |
| Weekly return 30% | Save feature + state memory | ✅ |
