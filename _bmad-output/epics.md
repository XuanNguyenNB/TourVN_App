---
stepsCompleted: [1, 2, 3, 4]
status: complete
completedAt: '2025-12-23'
inputDocuments:
  - "_bmad-output/prd.md"
  - "_bmad-output/architecture.md"
  - "_bmad-output/ux-design-specification.md"
workflowType: 'epics-and-stories'
lastStep: 4
project_name: 'tourvn_app'
user_name: 'Nguye'
date: '2025-12-23'
epicsApproved: true
totalEpics: 8
totalStories: 56
frsCovered: 52
---

# TourVN App - Epic Breakdown

## Overview

This document provides the complete epic and story breakdown for TourVN App, decomposing the requirements from the PRD, UX Design, and Architecture into implementable stories.

## Requirements Inventory

### Functional Requirements

**Authentication & Profile (FR1-FR5):**
- FR1: Users can register with email/password or social login (Google, Facebook)
- FR2: Users can log in and log out of their account
- FR3: Users can view and edit their profile information
- FR4: Users can switch between Tourist and Tour Guide roles
- FR5: System can distinguish user roles (Tourist, Guide, Admin)

**Location Discovery (FR6-FR12):**
- FR6: Tourists can browse locations filtered by mood categories (Chill, Adventure, Food, etc.)
- FR7: Tourists can filter locations by distance from current location
- FR8: Tourists can view trending locations
- FR9: Tourists can view location details including photos and description
- FR10: Tourists can view AI-curated articles for a location
- FR11: Tourists can save/favorite locations for later
- FR12: System displays empty state with trending suggestions when no nearby results

**Reviews & Ratings (FR13-FR16):**
- FR13: Tourists can view reviews for a location
- FR14: Tourists can write reviews with text and photos
- FR15: Tourists can rate locations
- FR16: System displays review count and average rating per location

**Tour Guide Discovery (FR17-FR20):**
- FR17: Tourists can view verified tour guides associated with a location
- FR18: Tourists can view tour guide profiles with ratings and tour listings
- FR19: Tourists can view tour details including pricing, duration, and description
- FR20: Tourists can contact tour guides via displayed contact information

**Tour Guide Registration & Management (FR21-FR27):**
- FR21: Users can apply to become a Tour Guide
- FR22: Guides can upload KYC documents (ID, selfie, license)
- FR23: Guides can view their KYC application status
- FR24: Guides can create tour listings with details and pricing
- FR25: Guides can edit and manage their tour listings
- FR26: Guides can view booking inquiries from tourists
- FR27: Guides receive push notifications for KYC approval and new inquiries

**AI Content Pipeline - Admin (FR28-FR37):**
- FR28: Admins can input TikTok video URLs for processing
- FR29: System can download video and extract audio
- FR30: System can transcribe Vietnamese audio to text (Speech-to-Text)
- FR31: System can generate article content from transcript using AI (Gemini)
- FR32: System can auto-match generated content to existing locations
- FR33: System flags unmatched locations for manual review
- FR34: Admins can review AI-generated articles in approval queue
- FR35: Admins can edit article content before publishing
- FR36: Admins can approve or reject articles
- FR37: Admins can add new locations when AI identifies unknown places

**Admin Moderation (FR38-FR44):**
- FR38: Admins can view and process KYC application queue
- FR39: Admins can approve or reject KYC applications
- FR40: Admins can view and process tour listing approval queue
- FR41: Admins can approve or reject tour listings
- FR42: Admins can view reported content and user reports
- FR43: Admins can remove reviews or content
- FR44: Admins can warn or ban users

**System Capabilities (FR45-FR48):**
- FR45: System requests permissions just-in-time with pre-permission screens
- FR46: System handles denied permissions gracefully (disabled UI, not hidden)
- FR47: System displays offline state with cached content when no connection
- FR48: System sends push notifications to tour guides via FCM

**Navigation & Sharing (FR49, FR52):**
- FR49: System can open external map application to navigate to destination
- FR52: Tourists can share location or article links via Native Share

**Content Management (FR50):**
- FR50: System supports article statuses: Draft, Pending, Published, Archived

**Analytics (FR51):**
- FR51: Admins can view basic dashboard metrics

### Non-Functional Requirements

**Performance (NFR1-NFR6):**
- NFR1: App initial load time < 3 seconds on 4G (P0)
- NFR2: First location card visible < 3 seconds after mood selection (P0)
- NFR3: Mood filter response < 500ms - requires Firestore composite indexes (P0)
- NFR4: Location detail load < 2 seconds (P1)
- NFR5: Image loading progressive with placeholders (P1)
- NFR6: Infinite scroll smooth 60fps, no jank (P1)

**Security (NFR7-NFR11):**
- NFR7: Authentication via Firebase Auth with secure token handling (P0)
- NFR8: KYC document storage encrypted at rest in Firebase Storage (P0)
- NFR9: Data transmission HTTPS/TLS for all API calls (P0)
- NFR10: Firestore rules with role-based access (Tourist/Guide/Admin) (P0)
- NFR11: Admin access via separate authentication for admin dashboard (P1)

**Reliability (NFR12-NFR15, NFR28):**
- NFR12: App crash rate < 1% of sessions (P0)
- NFR13: Firebase availability 99.9% (Firebase SLA) (P0)
- NFR14: AI Pipeline fallback - manual article creation if Gemini fails (P1)
- NFR15: Offline graceful degradation - display cached content, show offline banner (P1)
- NFR28: Rate Limiting - handle Gemini 429 errors gracefully (P1)

**Integration (NFR16-NFR20, NFR30):**
- NFR16: Google Maps SDK - open external maps for navigation (P0)
- NFR17: Gemini AI API - Vietnamese language processing (P0)
- NFR18: Speech-to-Text - support Vietnamese audio transcription (P0)
- NFR19: Firebase Cloud Messaging - push notifications to guides (P1)
- NFR20: Native Share - iOS/Android share sheet integration (P2)
- NFR30: AI Pipeline latency - article generation < 5 minutes from URL submission (P2)

**Compatibility (NFR21-NFR23, NFR29):**
- NFR29: Device compatibility - Android 8.0 (API 26)+, iOS 13.0+ (P0)
- NFR21: Font scaling - support system font size preferences (P2)
- NFR22: Touch targets - minimum 44x44pt for interactive elements (P2)
- NFR23: Color contrast - meet WCAG AA for text readability (P2)

**Optimization (NFR27):**
- NFR27: Image optimization - auto compress uploaded images < 1MB (P1)

**Localization (NFR24-NFR26):**
- NFR24: Default language Vietnamese (primary) (P0)
- NFR25: Date/time format Vietnamese locale (dd/MM/yyyy) (P1)
- NFR26: Currency format VND with proper formatting (P1)

### Additional Requirements

**From Architecture:**
- Project uses existing Flutter scaffold with manual Clean Architecture setup
- Firebase project setup required with Security Rules
- Firestore collections: `users`, `locations`, `tours`, `articles`, subcollection `locations/{id}/reviews`
- Cloud Functions required: `onReviewCreate`, `onReviewDelete`, `processAIContent`, `sendGuideNotification`
- Codemagic for CI/CD pipeline
- go_router with ShellRoute pattern + deep linking (`tourvn://location/{id}`, `tourvn://article/{id}`)
- Riverpod with `@riverpod` annotation for all providers
- Firestore composite indexes for mood + geo filtering
- Firebase Emulators for local development
- Repository pattern with try/catch + AsyncValue error handling

**From UX Design:**
- Mood-based navigation as primary UX pattern (5-7 mood categories)
- Bottom sheets for location details (Google Maps pattern)
- Skeleton loading states < 100ms perceived response
- State restoration on app resume (scroll position, mood filter, bottom sheet state)
- Empty state handling with mood-adjacent fallbacks then trending
- One-tap save with haptic feedback (no confirmation)
- Touch targets minimum 48dp
- Vietnamese typography optimization (1.5x line height, min 12sp font)
- Material Design 3 with custom TourVN theme
- White/Light AppBar with dark text (modern approach)
- Card-based discovery with hero images
- Badge system: Verified ✓, AI-curated 🤖, Trending 🔥

### FR Coverage Map

| FR | Epic | Description |
|----|------|-------------|
| FR1 | Epic 2 | Register with email/social |
| FR2 | Epic 2 | Login/logout |
| FR3 | Epic 2 | View/edit profile |
| FR4 | Epic 2 | Switch roles |
| FR5 | Epic 2 | Role distinction |
| FR6 | Epic 3 | Browse by mood |
| FR7 | Epic 3 | Filter by distance |
| FR8 | Epic 3 | View trending |
| FR9 | Epic 3 | Location details (basic) |
| FR10 | Epic 4 | View AI articles |
| FR11 | Epic 3 | Save/favorite |
| FR12 | Epic 3 | Empty state handling |
| FR13 | Epic 5 | View reviews |
| FR14 | Epic 5 | Write reviews |
| FR15 | Epic 5 | Rate locations |
| FR16 | Epic 5 | Display counts/ratings |
| FR17 | Epic 6 | View guides for location |
| FR18 | Epic 6 | View guide profiles |
| FR19 | Epic 6 | View tour details |
| FR20 | Epic 6 | Contact guides |
| FR21 | Epic 7 | Apply as guide |
| FR22 | Epic 7 | Upload KYC |
| FR23 | Epic 7 | View KYC status |
| FR24 | Epic 7 | Create tour listings |
| FR25 | Epic 7 | Manage tours |
| FR26 | Epic 7 | View inquiries |
| FR27 | Epic 7 | Push notifications |
| FR28 | Epic 8 | Input TikTok URLs |
| FR29 | Epic 8 | Download video/extract audio |
| FR30 | Epic 8 | Speech-to-text |
| FR31 | Epic 8 | AI article generation |
| FR32 | Epic 8 | Auto-match locations |
| FR33 | Epic 8 | Flag unmatched |
| FR34 | Epic 8 | Review article queue |
| FR35 | Epic 8 | Edit articles |
| FR36 | Epic 8 | Approve/reject articles |
| FR37 | Epic 8 | Add new locations |
| FR38 | Epic 8 | KYC queue |
| FR39 | Epic 8 | Approve/reject KYC |
| FR40 | Epic 8 | Tour approval queue |
| FR41 | Epic 8 | Approve/reject tours |
| FR42 | Epic 8 | View reports |
| FR43 | Epic 8 | Remove content |
| FR44 | Epic 8 | Warn/ban users |
| FR45 | Epic 3 | Just-in-time permissions |
| FR46 | Epic 3 | Graceful denied permissions |
| FR47 | Epic 3 | Offline state |
| FR48 | Epic 7 | FCM push |
| FR49 | Epic 4 | External maps navigation |
| FR50 | Epic 8 | Article statuses |
| FR51 | Epic 8 | Dashboard metrics |
| FR52 | Epic 4 | Native share |

## Epic List

### Epic 1: Project Foundation & App Shell
**Goal:** Developers have a working Flutter project with Clean Architecture structure. App opens with proper navigation shell and loading states.

**FRs covered:** Infrastructure/Architecture requirements (no direct FRs)

**Implementation Notes:**
- Firebase project setup with Security Rules
- Clean Architecture folder structure
- Core providers (Firebase instances)
- TourVN theme with Material Design 3
- go_router with ShellRoute + bottom navigation
- Firestore composite indexes

---

### Epic 2: User Authentication & Profiles
**Goal:** Users can register, login, logout, view/edit profile, and system recognizes their role (Tourist, Guide, Admin).

**FRs covered:** FR1, FR2, FR3, FR4, FR5

**Implementation Notes:**
- Firebase Auth with email/social login
- User document structure with role field
- Profile screen with edit capability
- Role switcher in profile

---

### Epic 3: Location Discovery & Mood-Based Browsing
**Goal:** Tourists can browse destinations by mood categories, filter by distance, see trending locations, save favorites, with proper empty states and offline handling.

**FRs covered:** FR6, FR7, FR8, FR9, FR11, FR12, FR45, FR46, FR47

**Implementation Notes:**
- Mood chips horizontal scroll
- Distance filtering with geolocation
- Trending badge display
- Skeleton loading states
- Empty state with mood-adjacent fallbacks
- Offline caching with banner
- Permission handling (location)

---

### Epic 4: Location Details & AI Articles
**Goal:** Tourists can view full location details with photo gallery, read AI-curated articles, navigate to destination via external maps, and share locations.

**FRs covered:** FR10, FR49, FR52

**Implementation Notes:**
- Bottom sheet pattern for details
- Swipeable photo gallery
- Article display with AI-curated badge
- Deep linking support
- Native share integration
- External maps navigation

---

### Epic 5: Reviews & Ratings
**Goal:** Tourists can read and write reviews with photos and ratings for locations, with real-time display of counts and averages.

**FRs covered:** FR13, FR14, FR15, FR16

**Implementation Notes:**
- Reviews subcollection under locations
- Image upload for review photos
- Cloud Function for denormalized counts
- Rating stars component
- Review card with user info

---

### Epic 6: Tour Guide Discovery
**Goal:** Tourists can find verified tour guides for a location, view their profiles and tour listings, and contact them.

**FRs covered:** FR17, FR18, FR19, FR20

**Implementation Notes:**
- Guide cards on location detail
- Guide profile bottom sheet
- Tour listing display
- Contact info reveal
- Verified badge display

---

### Epic 7: Tour Guide Marketplace
**Goal:** Users can apply to become guides, upload KYC documents, create and manage tours, receive inquiries and push notifications.

**FRs covered:** FR21, FR22, FR23, FR24, FR25, FR26, FR27, FR48

**Implementation Notes:**
- Guide registration flow
- KYC document upload (ID, selfie, license)
- KYC status display
- Tour creation form
- Inquiry management
- FCM integration for push notifications

---

### Epic 8: AI Content Pipeline & Admin Dashboard
**Goal:** Admins can process TikTok videos into AI-curated articles, review/edit/publish content, moderate KYC applications, tours, and users.

**FRs covered:** FR28, FR29, FR30, FR31, FR32, FR33, FR34, FR35, FR36, FR37, FR38, FR39, FR40, FR41, FR42, FR43, FR44, FR50, FR51

**Implementation Notes:**
- React Admin Dashboard (separate project)
- Cloud Functions for AI pipeline
- TikTok video download
- Vietnamese STT integration
- Gemini AI article generation
- Content approval queue
- KYC review workflow
- User moderation tools
- Dashboard metrics display

---

## Epic 1: Project Foundation & App Shell

**Goal:** Developers have a working Flutter project with Clean Architecture structure. App opens with proper navigation shell and loading states.

**FRs covered:** Infrastructure/Architecture requirements (no direct FRs)

**Relevant NFRs:** NFR1 (load < 3s), NFR24 (Vietnamese), NFR29 (Android 8+, iOS 13+)

### Story 1.1: Firebase Project Setup & Flutter Configuration

**As a** developer,
**I want** Firebase project configured with Flutter app,
**So that** I can access Firebase services (Auth, Firestore, Storage).

**Acceptance Criteria:**

**Given** a new Firebase project created in Firebase Console
**When** I add the Flutter app configuration files
**Then** `google-services.json` is in `android/app/`
**And** `GoogleService-Info.plist` is in `ios/Runner/`
**And** `firebase_core` initializes successfully in `main.dart`
**And** Firebase Emulators can connect for local development

---

### Story 1.2: Clean Architecture Folder Structure

**As a** developer,
**I want** the project organized with Clean Architecture folders,
**So that** code is maintainable and follows established patterns.

**Acceptance Criteria:**

**Given** the Flutter project
**When** I create the folder structure
**Then** `lib/core/` contains: `constants/`, `theme/`, `router/`, `providers/`, `services/`, `utils/`, `widgets/`
**And** `lib/features/` is ready for feature folders
**And** core Firebase providers are in `core/providers/firebase_providers.dart`
**And** imports follow the 4-section order from project-context.md

---

### Story 1.3: TourVN Theme & Design System

**As a** user,
**I want** the app to have a consistent, beautiful Vietnamese-friendly design,
**So that** the experience feels polished and culturally appropriate.

**Acceptance Criteria:**

**Given** the app is launched
**When** the theme is applied
**Then** Material Design 3 is enabled with TourVN color scheme (Primary: #00BFA5)
**And** Vietnamese typography has 1.5x line height, minimum 12sp font
**And** Touch targets are minimum 48dp
**And** AppBar uses white/light background with dark text
**And** Mood accent colors are defined (Chill, Adventure, Food, Beach, Culture, Romance)

---

### Story 1.4: Navigation Shell & Bottom Navigation

**As a** tourist,
**I want** easy navigation between main app sections,
**So that** I can quickly access Discover, Saved, and Profile.

**Acceptance Criteria:**

**Given** the app is launched
**When** the main screen loads
**Then** bottom navigation shows 3 tabs: Discover, Saved, Profile
**And** go_router ShellRoute maintains state between tabs
**And** each tab shows placeholder content
**And** navigation transitions are smooth (no jank)
**And** app loads in < 3 seconds (NFR1)

---

### Story 1.5: Firestore Security Rules & Indexes

**As a** developer,
**I want** Firestore configured with security rules and indexes,
**So that** data access is secure and queries perform well.

**Acceptance Criteria:**

**Given** the Firebase project
**When** security rules are deployed
**Then** `firestore.rules` has role-based access functions (isAuthenticated, getUserRole, isAdmin, isGuide, isOwner)
**And** unauthenticated users can read `locations` collection
**And** only authenticated users can write to `users/{uid}` where uid matches
**And** composite indexes exist for mood + createdAt queries
**And** `firestore.indexes.json` is committed to repo

---

## Epic 2: User Authentication & Profiles

**Goal:** Users can register, login, logout, view/edit profile, and system recognizes their role (Tourist, Guide, Admin).

**FRs covered:** FR1, FR2, FR3, FR4, FR5

**Relevant NFRs:** NFR7 (Firebase Auth), NFR10 (role-based access)

### Story 2.1: User Registration with Email & Social Login

**As a** new user,
**I want** to register with email/password or Google/Facebook,
**So that** I can create an account and access the app.

**Acceptance Criteria:**

**Given** I am on the registration screen
**When** I enter valid email and password (min 8 chars)
**Then** my account is created in Firebase Auth
**And** a user document is created in `users/{uid}` with role: 'tourist'
**And** I am navigated to the home screen

**Given** I tap "Continue with Google"
**When** Google sign-in completes successfully
**Then** my account is created/linked in Firebase Auth
**And** user document is created if new user
**And** I am navigated to the home screen

---

### Story 2.2: User Login & Logout

**As a** registered user,
**I want** to login and logout of my account,
**So that** I can access my personalized experience securely.

**Acceptance Criteria:**

**Given** I am on the login screen with valid credentials
**When** I tap "Login"
**Then** I am authenticated via Firebase Auth
**And** I am navigated to the home screen
**And** my auth state persists across app restarts

**Given** I am logged in
**When** I tap "Logout" in profile
**Then** I am signed out of Firebase Auth
**And** I am navigated to the login screen
**And** cached user data is cleared

**Given** I enter invalid credentials
**When** I tap "Login"
**Then** I see an error message "Invalid email or password"
**And** I remain on the login screen

---

### Story 2.3: User Profile View & Edit

**As a** logged-in user,
**I want** to view and edit my profile information,
**So that** I can keep my details up to date.

**Acceptance Criteria:**

**Given** I am logged in
**When** I navigate to Profile tab
**Then** I see my display name, email, and profile photo
**And** I see my current role (Tourist/Guide)

**Given** I am on the profile screen
**When** I tap "Edit Profile"
**Then** I can edit display name and profile photo
**And** changes are saved to Firestore `users/{uid}`
**And** I see a success confirmation

---

### Story 2.4: Role Switching (Tourist ↔ Guide)

**As a** user with guide status,
**I want** to switch between Tourist and Guide views,
**So that** I can browse as tourist or manage my guide business.

**Acceptance Criteria:**

**Given** I am a verified guide
**When** I tap "Switch to Guide Mode" in profile
**Then** bottom navigation updates to Guide tabs (Tours, Inquiries, Profile)
**And** my view context changes to guide perspective

**Given** I am in Guide mode
**When** I tap "Switch to Tourist Mode"
**Then** bottom navigation updates to Tourist tabs (Discover, Saved, Profile)
**And** my view context changes to tourist perspective

**Given** I am a tourist (not verified guide)
**When** I view the profile
**Then** I see "Become a Guide" CTA instead of role switcher

---

### Story 2.5: Auth State Provider & Role Management

**As a** developer,
**I want** auth state and user role available throughout the app,
**So that** UI can adapt based on authentication and role.

**Acceptance Criteria:**

**Given** the app is running
**When** auth state changes (login/logout)
**Then** `authStateProvider` emits the new state
**And** `currentUserProvider` provides user document with role
**And** protected routes redirect to login when unauthenticated
**And** role-specific UI elements show/hide correctly

---

## Epic 3: Location Discovery & Mood-Based Browsing

**Goal:** Tourists can browse destinations by mood categories, filter by distance, see trending locations, save favorites, with proper empty states and offline handling.

**FRs covered:** FR6, FR7, FR8, FR9, FR11, FR12, FR45, FR46, FR47

**Relevant NFRs:** NFR1-3 (performance), NFR5-6 (images, scroll), NFR15 (offline)

### Story 3.1: Location Data Model & Repository

**As a** developer,
**I want** Location entity and repository setup,
**So that** I can fetch and display location data.

**Acceptance Criteria:**

**Given** the `features/discover/` folder structure
**When** I create the data layer
**Then** `LocationModel` has: id, name, description, moods[], imageUrls[], coordinates, reviewCount, avgRating, trending, createdAt
**And** `Location` entity exists in domain layer
**And** `LocationRepository` can fetch locations from Firestore `locations` collection
**And** repository uses try/catch + throws `LocationException` on error

---

### Story 3.2: Mood Chips & Mood-Based Filtering

**As a** tourist,
**I want** to browse locations by mood category,
**So that** I can find destinations matching how I feel.

**Acceptance Criteria:**

**Given** I am on the Discover screen
**When** the screen loads
**Then** I see horizontal scrollable mood chips (Chill 🌿, Adventure 🏔️, Food 🍜, Beach 🏖️, Culture 🏛️, Romance ❤️)
**And** no mood is selected by default (show all locations)

**Given** I tap a mood chip
**When** the chip is selected
**Then** chip highlights with mood accent color
**And** skeleton cards appear < 100ms
**And** locations filtered by that mood load < 500ms (NFR3)
**And** cards display with progressive image loading

---

### Story 3.3: Distance Filtering & Geolocation

**As a** tourist,
**I want** to filter locations by distance from me,
**So that** I can find nearby destinations.

**Acceptance Criteria:**

**Given** I am on the Discover screen
**When** I tap the distance filter
**Then** I see options: "All", "< 50km", "< 100km", "< 200km"

**Given** location permission is granted
**When** I select a distance filter
**Then** locations are filtered by distance from my current location
**And** distance badge shows human-readable format ("30 phút", "2h lái xe")

**Given** location permission is denied (FR46)
**When** I view the distance filter
**Then** distance filter is disabled/grayed out
**And** I see message "Bật vị trí để lọc theo khoảng cách"
**And** tapping opens app settings

---

### Story 3.4: Location Cards & Infinite Scroll

**As a** tourist,
**I want** to browse location cards smoothly,
**So that** I can discover destinations without friction.

**Acceptance Criteria:**

**Given** locations are loaded
**When** I view the Discover screen
**Then** I see card grid with hero images, name, rating, distance badge
**And** trending locations show 🔥 badge
**And** images load progressively with placeholders (NFR5)

**Given** I scroll down
**When** I reach near the bottom
**Then** more locations load automatically (infinite scroll)
**And** scroll is smooth 60fps, no jank (NFR6)
**And** loading indicator shows during fetch

---

### Story 3.5: Save/Favorite Locations

**As a** tourist,
**I want** to save locations for later,
**So that** I can build a list of places to visit.

**Acceptance Criteria:**

**Given** I am viewing a location card
**When** I tap the heart icon
**Then** location is saved to my favorites (Firestore `users/{uid}/savedLocations`)
**And** heart fills with animation (scale 1.0 → 1.2 → 1.0, 300ms)
**And** haptic feedback fires
**And** no confirmation dialog (one-tap save)

**Given** I have saved locations
**When** I navigate to Saved tab
**Then** I see my saved locations grouped by mood
**And** I can remove locations by tapping filled heart

---

### Story 3.6: Empty States & Fallbacks

**As a** tourist,
**I want** helpful suggestions when no results match,
**So that** I'm never stuck with a dead end.

**Acceptance Criteria:**

**Given** I select a mood with no nearby results
**When** the query returns empty
**Then** I see mood-adjacent suggestions ("Tương tự: 🌿 Chill, 🌲 Thiên nhiên")
**And** below that, trending locations for original mood

**Given** no locations exist for selected mood anywhere
**When** the query returns empty
**Then** I see "Chưa có địa điểm" with trending suggestions
**And** I can tap to browse all locations

---

### Story 3.7: Trending Locations Display

**As a** tourist,
**I want** to see what's popular,
**So that** I can discover trending destinations.

**Acceptance Criteria:**

**Given** I am on Discover screen with no mood selected
**When** the screen loads
**Then** trending locations appear first (sorted by trending flag + recent)
**And** trending badge 🔥 is visible on trending cards

**Given** I select a mood
**When** results load
**Then** trending locations for that mood appear first
**And** non-trending follow after

---

### Story 3.8: Offline State & Caching

**As a** tourist,
**I want** to see cached content when offline,
**So that** I can still browse previously loaded locations.

**Acceptance Criteria:**

**Given** I have browsed locations while online
**When** I lose network connection
**Then** I see sticky banner "Offline - hiển thị nội dung đã lưu"
**And** cached locations remain visible
**And** save/favorite actions are disabled with tooltip

**Given** I am offline
**When** I try to load new content
**Then** I see "Không có kết nối" message
**And** "Thử lại" button appears when online detected

---

### Story 3.9: Location Permission Handling

**As a** tourist,
**I want** clear permission requests,
**So that** I understand why the app needs my location.

**Acceptance Criteria:**

**Given** I tap distance filter for the first time
**When** permission not yet requested (FR45)
**Then** I see pre-permission screen explaining "TourVN cần vị trí để tìm địa điểm gần bạn"
**And** I can tap "Cho phép" or "Để sau"

**Given** I tap "Cho phép"
**When** system dialog appears
**Then** I can grant "When In Use" permission
**And** distance filter becomes active

**Given** I denied permission previously
**When** I view distance filter (FR46)
**Then** filter shows disabled state with "Bật trong Cài đặt" link

---

## Epic 4: Location Details & AI Articles

**Goal:** Tourists can view full location details with photo gallery, read AI-curated articles, navigate to destination via external maps, and share locations.

**FRs covered:** FR10, FR49, FR52

**Relevant NFRs:** NFR4 (detail load < 2s), NFR16 (Maps SDK), NFR20 (Native Share)

### Story 4.1: Location Detail Bottom Sheet

**As a** tourist,
**I want** to view full location details,
**So that** I can learn more about a destination.

**Acceptance Criteria:**

**Given** I tap a location card
**When** the bottom sheet slides up
**Then** I see photo gallery, title, rating, distance
**And** bottom sheet uses spring physics animation (350ms)
**And** detail content loads < 2 seconds (NFR4)
**And** I can drag to dismiss or expand full screen

**Given** I am viewing location details
**When** I dismiss the bottom sheet
**Then** my Discover scroll position is preserved
**And** my selected mood filter remains active

---

### Story 4.2: Swipeable Photo Gallery

**As a** tourist,
**I want** to browse location photos,
**So that** I can see what the place looks like.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I view the photo gallery
**Then** I see hero image with swipe indicators (dots)
**And** I can swipe left/right to view more photos
**And** images load progressively with blur placeholder
**And** I can tap to view full screen

**Given** I tap a photo
**When** full screen gallery opens
**Then** I can pinch to zoom
**And** swipe to navigate
**And** tap or swipe down to dismiss

---

### Story 4.3: AI Article Display

**As a** tourist,
**I want** to read AI-curated articles about locations,
**So that** I get helpful, organized information.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I view the Article tab
**Then** I see AI-curated article content with proper formatting
**And** "🤖 AI-curated" badge is visible for transparency
**And** article shows: overview, tips, best time to visit, how to get there

**Given** a location has no article yet
**When** I view the Article tab
**Then** I see "Chưa có bài viết" placeholder
**And** reviews are highlighted as alternative

---

### Story 4.4: Navigate to Location (External Maps)

**As a** tourist,
**I want** to navigate to a location,
**So that** I can find my way there.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I tap "Chỉ đường" button
**Then** external maps app opens (Google Maps or Apple Maps)
**And** destination is pre-filled with location coordinates
**And** navigation mode is ready to start

**Given** no maps app is installed
**When** I tap "Chỉ đường"
**Then** I see option to open in browser
**And** Google Maps web version loads with destination

---

### Story 4.5: Share Location

**As a** tourist,
**I want** to share a location with friends,
**So that** I can recommend places to others.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I tap share button
**Then** native share sheet opens (iOS/Android)
**And** share content includes: location name, image, and deep link
**And** deep link format: `tourvn://location/{locationId}`

**Given** someone receives my shared link
**When** they tap the link with app installed
**Then** app opens directly to that location detail

---

### Story 4.6: Deep Linking Support

**As a** user,
**I want** shared links to open the right content,
**So that** I can access locations directly.

**Acceptance Criteria:**

**Given** the app is configured for deep links
**When** user taps `tourvn://location/{id}`
**Then** app launches and navigates to location detail

**Given** user taps `tourvn://article/{id}`
**When** app opens
**Then** article detail is displayed

**Given** app is not installed
**When** user taps deep link
**Then** fallback to app store (deferred deep link)

---

## Epic 5: Reviews & Ratings

**Goal:** Tourists can read and write reviews with photos and ratings for locations, with real-time display of counts and averages.

**FRs covered:** FR13, FR14, FR15, FR16

**Relevant NFRs:** NFR27 (image compression)

### Story 5.1: Review Data Model & Repository

**As a** developer,
**I want** Review entity and repository setup,
**So that** I can manage review data.

**Acceptance Criteria:**

**Given** the `features/location/` folder structure
**When** I create the review data layer
**Then** `ReviewModel` has: id, locationId, userId, userName, userPhoto, rating (1-5), text, photoUrls[], createdAt
**And** `Review` entity exists in domain layer
**And** `ReviewRepository` can CRUD reviews from `locations/{locationId}/reviews` subcollection
**And** repository handles Firestore subcollection queries

---

### Story 5.2: View Location Reviews

**As a** tourist,
**I want** to read reviews for a location,
**So that** I can see what others think.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I tap the Reviews tab
**Then** I see list of reviews sorted by most recent
**And** each review shows: user avatar, name, rating stars, date, text, photos
**And** review photos are tappable to view full size

**Given** a location has no reviews
**When** I view the Reviews tab
**Then** I see "Chưa có đánh giá" with prompt to be first reviewer
**And** "Viết đánh giá" CTA is prominent

---

### Story 5.3: Write Review with Text

**As a** tourist,
**I want** to write a review for a location,
**So that** I can share my experience.

**Acceptance Criteria:**

**Given** I am logged in and on location detail
**When** I tap "Viết đánh giá"
**Then** review form opens with: rating selector (1-5 stars), text input, photo add button

**Given** I fill out the review form
**When** I tap "Đăng"
**Then** review is saved to `locations/{locationId}/reviews` subcollection
**And** I see success confirmation
**And** review appears in the list immediately

**Given** I am not logged in
**When** I tap "Viết đánh giá"
**Then** I am prompted to login first

---

### Story 5.4: Add Photos to Review

**As a** tourist,
**I want** to add photos to my review,
**So that** I can show others what I saw.

**Acceptance Criteria:**

**Given** I am writing a review
**When** I tap "Thêm ảnh"
**Then** I can select from gallery or take new photo
**And** max 5 photos per review

**Given** I select photos
**When** photos are added
**Then** images are compressed < 1MB (NFR27)
**And** thumbnails preview in the form
**And** I can remove photos before posting

**Given** I submit review with photos
**When** review is posted
**Then** photos upload to Firebase Storage
**And** URLs are saved in review document

---

### Story 5.5: Rating Stars Component

**As a** tourist,
**I want** to rate locations with stars,
**So that** I can express how much I liked a place.

**Acceptance Criteria:**

**Given** I am writing a review
**When** I interact with rating selector
**Then** I can tap or drag to select 1-5 stars
**And** half stars are NOT supported (whole numbers only)
**And** selected stars fill with gold color
**And** rating is required before submitting

**Given** I am viewing reviews
**When** I see rating display
**Then** average rating shows with filled/empty stars
**And** numeric rating shows (e.g., "4.5")

---

### Story 5.6: Review Count & Average Display (Denormalization)

**As a** tourist,
**I want** to see rating summary on location cards,
**So that** I can quickly assess quality.

**Acceptance Criteria:**

**Given** a location has reviews
**When** I view the location card
**Then** I see review count and average rating
**And** display format: "⭐ 4.5 (123)"

**Given** a new review is posted
**When** Cloud Function `onReviewCreate` triggers
**Then** location document `reviewCount` increments
**And** `avgRating` is recalculated
**And** update completes within seconds (eventual consistency)

**Given** a review is deleted
**When** Cloud Function `onReviewDelete` triggers
**Then** location document `reviewCount` decrements
**And** `avgRating` is recalculated

---

## Epic 6: Tour Guide Discovery

**Goal:** Tourists can find verified tour guides for a location, view their profiles and tour listings, and contact them.

**FRs covered:** FR17, FR18, FR19, FR20

### Story 6.1: Guide Data Model & Repository

**As a** developer,
**I want** Guide and Tour entities and repositories,
**So that** I can display guide information.

**Acceptance Criteria:**

**Given** the `features/guide/` folder structure
**When** I create the data layer
**Then** `GuideModel` has: userId, displayName, avatar, bio, rating, tourCount, verified, verifiedAt, contactInfo
**And** `TourModel` has: id, guideId, title, description, price, duration, locationIds[], imageUrls[], status
**And** `GuideRepository` can fetch guides from `users` where role='guide' and verified=true
**And** `TourRepository` can fetch tours from `tours` collection

---

### Story 6.2: View Guides for Location

**As a** tourist,
**I want** to see tour guides for a location,
**So that** I can find someone to guide my trip.

**Acceptance Criteria:**

**Given** I am on location detail
**When** I view the Guides section
**Then** I see list of verified guides who offer tours at this location
**And** each guide card shows: avatar, name, rating, tour count, verified badge ✓

**Given** no guides offer tours at this location
**When** I view the Guides section
**Then** I see "Chưa có hướng dẫn viên" message
**And** section is not prominent (collapsed or minimal)

---

### Story 6.3: View Guide Profile

**As a** tourist,
**I want** to view a guide's full profile,
**So that** I can learn about them before contacting.

**Acceptance Criteria:**

**Given** I tap a guide card
**When** guide profile bottom sheet opens
**Then** I see: avatar, name, verified badge, bio, rating, total tours
**And** I see list of their tour offerings
**And** "Liên hệ" (Contact) CTA is prominent

**Given** the guide has reviews
**When** I view their profile
**Then** I see recent reviews from tourists

---

### Story 6.4: View Tour Details

**As a** tourist,
**I want** to see tour details,
**So that** I can decide if it fits my needs.

**Acceptance Criteria:**

**Given** I tap a tour listing
**When** tour detail expands
**Then** I see: title, description, price (VND formatted), duration, included locations
**And** I see tour photos if available
**And** "Liên hệ hướng dẫn viên" CTA is visible

**Given** tour has multiple locations
**When** I view locations list
**Then** I can tap location to see its detail

---

### Story 6.5: Contact Tour Guide

**As a** tourist,
**I want** to contact a tour guide,
**So that** I can inquire about booking.

**Acceptance Criteria:**

**Given** I am logged in and viewing guide/tour
**When** I tap "Liên hệ"
**Then** guide's contact info is revealed (phone, Zalo, email)
**And** inquiry is logged to `users/{guideId}/inquiries` collection
**And** guide receives push notification (if Epic 7 complete)

**Given** I am not logged in
**When** I tap "Liên hệ"
**Then** I am prompted to login first

**Given** contact info is revealed
**When** I tap phone number
**Then** phone dialer opens with number pre-filled

---

## Epic 7: Tour Guide Marketplace

**Goal:** Users can apply to become guides, upload KYC documents, create and manage tours, receive inquiries and push notifications.

**FRs covered:** FR21, FR22, FR23, FR24, FR25, FR26, FR27, FR48

**Relevant NFRs:** NFR8 (KYC encrypted), NFR19 (FCM)

### Story 7.1: Guide Registration Flow

**As a** tourist,
**I want** to apply to become a tour guide,
**So that** I can offer my services on the platform.

**Acceptance Criteria:**

**Given** I am logged in as tourist
**When** I tap "Trở thành hướng dẫn viên" in profile
**Then** I see value proposition screen explaining benefits
**And** "Bắt đầu đăng ký" CTA is visible

**Given** I start registration
**When** I complete Step 1 (Basic Info)
**Then** I enter: full legal name, phone, location/city
**And** I can proceed to Step 2

---

### Story 7.2: KYC Document Upload

**As a** guide applicant,
**I want** to upload my verification documents,
**So that** I can prove my identity and credentials.

**Acceptance Criteria:**

**Given** I am on KYC upload step
**When** I upload ID document
**Then** I can take photo or select from gallery
**And** image is compressed and uploaded to Firebase Storage
**And** storage path uses encrypted folder structure (NFR8)

**Given** I need to upload selfie
**When** I take selfie for verification
**Then** camera opens with face guide overlay
**And** photo is uploaded alongside ID

**Given** I have tour guide license (optional)
**When** I upload license document
**Then** document is stored securely
**And** I can proceed without license (optional field)

**Given** I am mid-registration
**When** I exit the app
**Then** my progress is saved
**And** I can resume from where I left off

---

### Story 7.3: KYC Application Status

**As a** guide applicant,
**I want** to see my application status,
**So that** I know when I'm approved.

**Acceptance Criteria:**

**Given** I submitted KYC application
**When** I view my profile
**Then** I see status: "Đang chờ duyệt" (Pending)
**And** I see estimated timeframe "24-48 giờ"

**Given** my application is approved
**When** admin approves in dashboard
**Then** my status updates to "Đã xác minh" ✓
**And** I receive push notification "Bạn đã được xác minh!"
**And** guide features are unlocked

**Given** my application is rejected
**When** admin rejects with reason
**Then** my status updates to "Cần bổ sung"
**And** I see rejection reason
**And** I can resubmit documents

---

### Story 7.4: Create Tour Listing

**As a** verified guide,
**I want** to create tour listings,
**So that** tourists can find and book my tours.

**Acceptance Criteria:**

**Given** I am a verified guide
**When** I tap "Tạo tour mới" in Guide dashboard
**Then** tour creation form opens

**Given** I am creating a tour
**When** I fill out the form
**Then** I enter: title, description, price (VND), duration, max participants
**And** I select locations included in tour
**And** I can upload up to 10 photos
**And** images are compressed < 1MB each

**Given** I complete tour form
**When** I tap "Gửi duyệt"
**Then** tour is saved with status "pending"
**And** I see confirmation "Tour đã gửi, chờ duyệt"

---

### Story 7.5: Manage Tour Listings

**As a** verified guide,
**I want** to manage my tours,
**So that** I can keep listings up to date.

**Acceptance Criteria:**

**Given** I am on Guide dashboard
**When** I view Tours tab
**Then** I see all my tours with status badges (pending, approved, archived)

**Given** I have an approved tour
**When** I tap to edit
**Then** I can update details, photos, price
**And** minor edits don't require re-approval
**And** major edits (locations, price >20% change) require re-approval

**Given** I want to remove a tour
**When** I tap "Ẩn tour"
**Then** tour status changes to "archived"
**And** tour no longer appears to tourists

---

### Story 7.6: View Booking Inquiries

**As a** verified guide,
**I want** to see who contacted me,
**So that** I can respond to potential customers.

**Acceptance Criteria:**

**Given** I am on Guide dashboard
**When** I view Inquiries tab
**Then** I see list of tourists who tapped "Liên hệ"
**And** each inquiry shows: tourist name, date, tour interested in

**Given** I have new inquiries
**When** new inquiry arrives
**Then** badge count updates on Inquiries tab
**And** newest inquiries appear at top

**Given** I view an inquiry
**When** I tap inquiry card
**Then** I see tourist's basic info
**And** I can mark as "Đã liên hệ" or "Đã hoàn thành"

---

### Story 7.7: Push Notifications for Guides

**As a** verified guide,
**I want** to receive push notifications,
**So that** I don't miss important updates.

**Acceptance Criteria:**

**Given** I am a verified guide with FCM token
**When** my KYC is approved
**Then** I receive push: "🎉 Chúc mừng! Bạn đã được xác minh"

**Given** I have approved tours
**When** a tourist contacts me
**Then** I receive push: "📩 Bạn có yêu cầu liên hệ mới"
**And** tapping notification opens Inquiries tab

**Given** my tour is approved by admin
**When** approval happens
**Then** I receive push: "✅ Tour của bạn đã được duyệt"

**Given** Cloud Function `sendGuideNotification`
**When** triggered by relevant events
**Then** FCM message is sent to guide's device token
**And** notification displays correctly on iOS and Android

---

## Epic 8: AI Content Pipeline & Admin Dashboard

**Goal:** Admins can process TikTok videos into AI-curated articles, review/edit/publish content, moderate KYC applications, tours, and users.

**FRs covered:** FR28, FR29, FR30, FR31, FR32, FR33, FR34, FR35, FR36, FR37, FR38, FR39, FR40, FR41, FR42, FR43, FR44, FR50, FR51

**Relevant NFRs:** NFR11 (admin auth), NFR17-18 (Gemini, STT), NFR28 (rate limiting), NFR30 (< 5min latency)

**Note:** This is a React Admin Dashboard (separate web project)

### Story 8.1: Admin Dashboard Setup (React)

**As an** admin,
**I want** a web dashboard to manage the platform,
**So that** I can moderate content efficiently.

**Acceptance Criteria:**

**Given** the `admin/` folder in project
**When** I set up React project
**Then** React app with Firebase Auth integration is created
**And** Admin-only authentication is configured (NFR11)
**And** Dashboard deploys to Firebase Hosting
**And** Only users with role='admin' can access

---

### Story 8.2: AI Pipeline - TikTok URL Input

**As an** admin,
**I want** to input TikTok video URLs,
**So that** AI can process them into articles.

**Acceptance Criteria:**

**Given** I am on Content > New Article page
**When** I paste a TikTok URL
**Then** URL is validated as TikTok format
**And** "Xử lý" button becomes active

**Given** I tap "Xử lý"
**When** processing starts
**Then** I see progress indicator
**And** status shows: "Đang tải video..."

---

### Story 8.3: AI Pipeline - Video Download & STT

**As a** system,
**I want** to download TikTok video and transcribe audio,
**So that** content can be processed.

**Acceptance Criteria:**

**Given** Cloud Function `processAIContent` is triggered
**When** TikTok URL is received
**Then** video is downloaded to temp storage
**And** audio is extracted from video

**Given** audio is extracted
**When** Speech-to-Text processes audio
**Then** Vietnamese audio is transcribed (NFR18)
**And** transcript is saved for next step
**And** status updates to "Đang chuyển giọng nói..."

**Given** STT fails
**When** error occurs
**Then** admin sees error message with retry option
**And** manual transcript input is available as fallback

---

### Story 8.4: AI Pipeline - Gemini Article Generation

**As a** system,
**I want** to generate article from transcript using Gemini,
**So that** content is structured and useful.

**Acceptance Criteria:**

**Given** transcript is ready
**When** Gemini API processes transcript
**Then** structured article is generated with: title, overview, tips, best time, how to get there
**And** location name is extracted from content
**And** status updates to "Đang tạo bài viết..."

**Given** Gemini returns 429 rate limit
**When** error is caught (NFR28)
**Then** system waits and retries automatically
**And** admin sees "Đang chờ xử lý..." message

**Given** article generation completes
**When** < 5 minutes from URL submission (NFR30)
**Then** article is ready for review
**And** total processing time is logged

---

### Story 8.5: AI Pipeline - Location Matching

**As a** system,
**I want** to match generated content to existing locations,
**So that** articles are properly linked.

**Acceptance Criteria:**

**Given** article is generated with location name
**When** auto-match runs against `locations` collection
**Then** matching location is suggested with confidence score

**Given** match confidence > 80%
**When** match is found
**Then** article is auto-linked to location
**And** admin can confirm or change

**Given** match confidence < 80% or no match (FR33)
**When** auto-match fails
**Then** article is flagged "Cần xác nhận vị trí"
**And** admin must manually select or create location

---

### Story 8.6: Content Approval Queue

**As an** admin,
**I want** to review AI-generated articles,
**So that** only quality content is published.

**Acceptance Criteria:**

**Given** I am on Content > Queue page
**When** I view the queue
**Then** I see list of pending articles with: title, source URL, created date, status
**And** count badge shows pending items

**Given** I tap an article
**When** detail view opens
**Then** I see full article content, matched location, source video
**And** I can edit any field inline

---

### Story 8.7: Article Editor & Publishing

**As an** admin,
**I want** to edit and publish articles,
**So that** content is accurate before going live.

**Acceptance Criteria:**

**Given** I am editing an article
**When** I make changes
**Then** rich text editor allows formatting
**And** I can update: title, content sections, linked location

**Given** article is ready
**When** I tap "Xuất bản"
**Then** article status changes to "published" (FR50)
**And** article appears on linked location in app

**Given** I want to reject
**When** I tap "Từ chối"
**Then** article status changes to "archived"
**And** article is removed from queue

**Given** I want to save for later
**When** I tap "Lưu nháp"
**Then** article status stays "draft" (FR50)

---

### Story 8.8: Add New Location from AI Content

**As an** admin,
**I want** to add new locations discovered by AI,
**So that** the database grows with fresh content.

**Acceptance Criteria:**

**Given** AI article references unknown location
**When** I tap "Thêm địa điểm mới"
**Then** location creation form opens
**And** name is pre-filled from AI extraction

**Given** I fill location form
**When** I save new location
**Then** location is created in `locations` collection
**And** article is linked to new location
**And** location appears in app immediately

---

### Story 8.9: KYC Application Queue

**As an** admin,
**I want** to review guide applications,
**So that** only verified guides can operate.

**Acceptance Criteria:**

**Given** I am on Guides > KYC Queue page
**When** I view the queue
**Then** I see pending applications with: name, submitted date, status
**And** count badge shows pending items

**Given** I tap an application
**When** detail view opens
**Then** I see: ID document, selfie, license (if provided), basic info
**And** I can compare ID photo with selfie

---

### Story 8.10: KYC Approve/Reject

**As an** admin,
**I want** to approve or reject KYC applications,
**So that** trust is maintained on the platform.

**Acceptance Criteria:**

**Given** I review a KYC application
**When** I tap "Duyệt"
**Then** guide status updates to verified
**And** push notification is sent to guide
**And** guide role is activated in user document

**Given** documents are invalid
**When** I tap "Từ chối" with reason
**Then** rejection reason is saved
**And** guide is notified with reason
**And** guide can resubmit

---

### Story 8.11: Tour Approval Queue

**As an** admin,
**I want** to review tour listings,
**So that** only legitimate tours are published.

**Acceptance Criteria:**

**Given** I am on Tours > Queue page
**When** I view pending tours
**Then** I see: tour title, guide name, price, submitted date

**Given** I review a tour
**When** I tap "Duyệt"
**Then** tour status changes to "approved"
**And** tour appears in app
**And** guide receives push notification

**Given** tour violates guidelines
**When** I tap "Từ chối" with reason
**Then** guide is notified with reason
**And** guide can edit and resubmit

---

### Story 8.12: User Moderation

**As an** admin,
**I want** to moderate users and content,
**So that** the platform remains trustworthy.

**Acceptance Criteria:**

**Given** I am on Moderation > Reports page
**When** I view reports
**Then** I see reported reviews, users, content with reason

**Given** I review a report
**When** content violates guidelines
**Then** I can remove the content (FR43)
**And** content is hidden from app

**Given** user repeatedly violates
**When** I tap "Cảnh báo" or "Cấm"
**Then** user receives warning or ban (FR44)
**And** banned users cannot login

---

### Story 8.13: Dashboard Metrics

**As an** admin,
**I want** to see platform metrics,
**So that** I can monitor growth and health.

**Acceptance Criteria:**

**Given** I am on Dashboard home
**When** page loads
**Then** I see: Total registered users, New locations this week, Total guide contact clicks (FR51)
**And** metrics update in real-time

---

## Summary

### Document Completion Status

**Epics and Stories Workflow:** COMPLETED ✅
**Date Completed:** 2025-12-23
**Document Location:** _bmad-output/epics.md

### Epic Summary

| Epic | Title | Stories | FRs Covered |
|------|-------|---------|-------------|
| 1 | Project Foundation & App Shell | 5 | Infrastructure |
| 2 | User Authentication & Profiles | 5 | FR1-5 |
| 3 | Location Discovery & Mood-Based Browsing | 9 | FR6-9, FR11-12, FR45-47 |
| 4 | Location Details & AI Articles | 6 | FR10, FR49, FR52 |
| 5 | Reviews & Ratings | 6 | FR13-16 |
| 6 | Tour Guide Discovery | 5 | FR17-20 |
| 7 | Tour Guide Marketplace | 7 | FR21-27, FR48 |
| 8 | AI Content Pipeline & Admin Dashboard | 13 | FR28-44, FR50-51 |

**Total: 8 Epics, 56 Stories, 52 FRs covered**

### Recommended Sprint Planning

**Sprint 1 (Week 1-2):** Epic 1 + Epic 2 (10 stories)
- Firebase setup, folder structure, theme, navigation
- Authentication system complete

**Sprint 2 (Week 3-4):** Epic 3 (9 stories)
- Core mood-based discovery experience
- This is the "wow" moment for graduation demo

**Sprint 3 (Week 5-6):** Epic 4 + Epic 5 (12 stories)
- Location details, articles, reviews
- Content depth for user engagement

**Sprint 4 (Week 7-8):** Epic 6 + Epic 7 (12 stories)
- Tour guide marketplace
- Two-sided marketplace complete

**Sprint 5 (Week 9-12):** Epic 8 (13 stories)
- Admin dashboard and AI pipeline
- Content generation automation

### Risk Areas to De-Risk Early

1. **AI Pipeline (Epic 8.3-8.5):** Test Vietnamese STT + Gemini in Week 1
2. **Performance (NFR3):** Verify Firestore indexes early in Sprint 2
3. **Push Notifications (Story 7.7):** Test FCM setup in Sprint 4

### Next Steps

1. **Sprint Planning:** Use `/sm` agent to create Sprint 1 backlog
2. **Implementation Readiness:** Run `/pm` > `implementation-readiness` to validate
3. **Development:** Use `/dev` agent to implement stories

---

**Document Status:** READY FOR IMPLEMENTATION ✅
