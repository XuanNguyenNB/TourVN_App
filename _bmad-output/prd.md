---
stepsCompleted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
inputDocuments:
  - "_bmad-output/analysis/product-brief-tourvn_app-2025-12-23.md"
  - "_bmad-output/analysis/brainstorming-session-2025-12-23.md"
documentCounts:
  briefs: 1
  research: 0
  brainstorming: 1
  projectDocs: 0
workflowType: 'prd'
lastStep: 11
project_name: 'tourvn_app'
user_name: 'Nguye'
date: '2025-12-23'
---

# Product Requirements Document - tourvn_app

**Author:** Nguye
**Date:** 2025-12-23

## Executive Summary

**TourVN** is a mobile application designed to revolutionize how Vietnamese tourists discover and explore their own country. By combining AI-curated articles with verified tour guide services, TourVN addresses the critical gap between scattered, unreliable travel information and the authentic, up-to-date guidance tourists need.

### The Problem

Vietnamese tourists struggle to find suitable destinations and trustworthy tours when planning trips within Vietnam. Current information sources—TikTok, Google Maps, Instagram, and traditional travel sites—provide fragmented, outdated, or overly commercialized recommendations that lead to disappointment and wasted travel experiences.

### The Solution

TourVN provides a tourism-specialized platform where users simply open the app and find the perfect destination through:

- **Mood-Based Discovery** - Find destinations by emotion: "Beach vibes 🏖️", "Mountain escape ⛰️", "Food adventure 🍜"
- **AI-Curated Articles** - Fresh, organized content generated from TikTok videos, reviewed and approved by admins
- **Verified Tour Guides** - KYC-approved guides offering transparent group tour services
- **Location-Based Filtering** - Distance and trending status as intuitive filters

### What Makes This Special

1. 💭 **Mood-Based Navigation** - Emotions drive travel discovery, not just categories
2. 🎬 **AI Content Pipeline** - Admin-powered system transforms viral TikTok travel content into searchable articles (future: Telegram bot integration)
3. 🇻🇳 **Vietnamese-First Focus** - Local hidden gems, Vietnamese language and culture priority
4. ✅ **Verified Tour Guide Marketplace** - KYC-verified guides with transparent offerings
5. 🎯 **Radical Simplicity** - Open app → Feel the vibe → Find destination → Go

### Target Market

- **Phase 1 (MVP):** Vietnamese domestic tourists
- **Phase 2:** International visitors seeking authentic Vietnam experiences

### Default Language

- **Application Language:** Vietnamese (primary)
- **Future:** Multi-language support in Phase 2

## Project Classification

| Attribute | Value |
|-----------|-------|
| **Technical Type** | Mobile App (Flutter cross-platform) |
| **Domain** | Travel/Tourism |
| **Complexity** | Low-Medium |
| **Project Context** | Greenfield - new 3-month MVP |
| **Backend** | Firebase (Firestore, Auth) |
| **AI Integration** | Google Gemini |
| **Admin Platform** | React Web Dashboard |
| **Default Language** | Vietnamese |

## Success Criteria

### User Success

#### Tourist (Nguyen Persona)
| Success Moment | Measurable Indicator |
|----------------|---------------------|
| "Found the perfect hidden gem!" | Completed: Browse → Read article → Read reviews → View details |
| "This app understands me" | Selected mood filter → Found relevant destination |
| "Worth coming back" | Return visit within 7 days |

**North Star Metric:** Destinations Discovered (browse → article → reviews → details flow completed)

**Time-to-Value:** First meaningful discovery < 60 seconds from app open

#### Tour Guide (Minh Persona)
| Success Moment | Measurable Indicator |
|----------------|---------------------|
| "Got verified quickly" | KYC approval within 24-48 hours |
| "First booking came through!" | Received inquiry via contact info within 4-hour cycle |
| "Building my reputation" | Positive reviews on profile |

### Business Success

#### MVP Targets (3 Months)
| Metric | Target | Go/No-Go Threshold |
|--------|--------|-------------------|
| Registered Users | 1,000+ | 500+ minimum |
| Locations/Articles | 50-200 | 50 minimum |
| Verified Tour Guides | 20-50 | 20 minimum |
| Weekly Active Users | 200+ | 100+ minimum |
| User Return Rate | 30%+ within 7 days | 20%+ minimum |
| AI Article Approval | 80%+ first pass | 60%+ minimum |

#### Graduation Committee Success
**Pitch:** "Chúng em không bán địa điểm, chúng em bán trải nghiệm phù hợp với cảm xúc của người dùng ngay tại thời điểm họ mở app."

| Differentiator | Impressive Because |
|----------------|-------------------|
| **AI Pipeline Magic** | Proves TikTok → Article automation works in production |
| **Mood-Based Navigation** | Modern product mindset vs traditional province/price filters |
| **Trust & KYC System** | Shows operational thinking, risk management |

### Technical Success

| Area | Success Criteria |
|------|-----------------|
| **AI Content Pipeline** | Daily generation working, 80%+ approval rate |
| **AI Approval Criteria** | Content accuracy + relevance to location |
| **Mood Filter Performance** | Results return < 500ms |
| **App Performance** | Load < 3 seconds, smooth infinite scroll |
| **Time-to-Value** | First discovery < 60 seconds |
| **System Reliability** | Firebase uptime, zero data loss |
| **Security** | KYC documents encrypted, auth via Firebase |

## Product Scope

### MVP - Minimum Viable Product (3 Months)

**P0 - Foundation (Month 1):**
- User authentication (Firebase Auth)
- Location browsing with mood-based categories
- Location details with photos
- Basic admin dashboard
- **AI Pipeline v1** (basic TikTok URL → article generation, de-risking)

**P1 - Content & Reviews (Month 2):**
- AI Content Pipeline (full admin workflow with approval)
- Review system (view + write, no booking required)
- Article display per location

**P2 - Tour Guides (Month 3):**
- Tour Guide registration + KYC
- Tour listings and browsing
- Guide contact info exchange
- Full admin approval workflows

### Growth Features (Post-MVP)
- AI Chat Trip Planner
- Push notifications for seasonal alerts
- In-app tour booking with payments
- International user support (English)

### Vision (Future)
- Vietnam's #1 tourism discovery app
- Thousands of verified guides nationwide
- Telegram bot for AI content submission
- Revenue model via booking commissions

## User Journeys

### Journey 1: Nguyen - The Weekend Explorer (Tourist)

**Nguyen is a 25-year-old university student in Hanoi** who loves traveling but struggles to find authentic destinations. Every holiday, she faces the same frustration: scrolling through TikTok for hours, finding beautiful places, then losing the videos in her feed.

One Friday evening, her friend mentions TourVN. "Just tell it your mood," the friend says. Curious, Nguyen downloads the app.

**The next morning**, she opens TourVN with a vague feeling - she wants somewhere peaceful, not too far. She taps "Chill vibes 🌿".
- *Happy Path:* She instantly sees destinations organized by distance. An AI-curated article "Hidden waterfall 2 hours from Hanoi" catches her eye.
- *Empty State:* If no locations match nearby, the app gracefully suggests: "Nothing nearby? Check out these **Trending Chill Spots in Vietnam**" to keep her engaged.

She reads the article (generated from a viral TikTok she missed), then scrolls through real visitor reviews. One review says "Go early morning, bring snacks." **This is exactly what she needed.**

Nguyen saves the destination and contacts a verified guide offering weekend trips. That Sunday, she's standing at the waterfall, thinking "This app actually gets me."

### Journey 2: Minh - The Local Guide (Provider)

**Minh is a 32-year-old tour guide in Da Nang** who knows every hidden gem but struggles with visibility. Facebook posts get lost in the noise.

He registers on TourVN, uploads his ID and tour guide certificate, and waits.
**Notification:** 24 hours later, his phone pings with a push notification: *"You're Verified! Create your first tour now."*

He creates his first listing: "3-day Phong Nha adventure" with clear pricing.
**The breakthrough:** Two weeks later, he gets his first booking inquiry. A group of students found him via the "Adventure" mood filter. He replies instantly via the app.

Six months later, Minh has a steady stream of young Vietnamese tourists and a 4.8-star rating. **TourVN gave him a professional identity** that social media couldn't.

### Journey 3: Nguye - The Admin (Operator)

**Nguye is the solo admin** ensuring platform trust. Her morning routine starts with the Dashboard.

**Task 1: AI Content Review**
She opens the "Content Queue". 5 new AI-generated articles are waiting.
- One article about a cafe has the wrong address. **Action:** She clicks "Edit", fixes the address using the built-in editor, and hits "Publish".
- Another article is perfect. **Action:** "Approve".

**Task 2: KYC Verification**
She checks the "Provider Queue". A new guide application from Minh.
- She compares the ID photo with the selfie. Matches.
- She checks the Tour Guide License number against the national database. Valid.
- **Action:** "Approve". This triggers the push notification to Minh.

**Task 3: Moderation**
A report comes in: "Fake review". She investigates, sees the user has no location history near the spot, and removes the review.

### Journey Requirements Summary

| Journey | Capabilities Revealed |
|---------|----------------------|
| **Nguyen (Tourist)** | Mood-based browsing, AI article display, Empty State handling, reviews, location details, guide contact, save/favorites |
| **Minh (Guide)** | Registration, KYC upload, Push Notifications, profile creation, tour listing, booking inquiries |
| **Admin** | Content approval queue, Article Editor, KYC review workflow, user moderation |

## Innovation & Novel Patterns

### Core Innovation: AI Content Pipeline

TourVN's primary innovation is the **AI Content Pipeline** - an automated system that transforms viral TikTok travel videos into structured, searchable articles.

**Pipeline Architecture:**
```
TikTok URL → Download Video → Speech-to-Text → Gemini AI Processing → Location Verification → Admin Review → Publish
```

**Key Steps:**
1. **Video Download** - Fetch TikTok video from URL
2. **Speech-to-Text** - Automated transcription (Vietnamese language support required)
3. **AI Processing** - Gemini extracts location, tips, generates article structure
4. **Location Verification** - Auto-match against location database; flag unmatched for manual review
5. **Admin Review** - Human editor approves, edits, or rejects
6. **Publish** - Article goes live, linked to location

**Assumption challenged:** Travel content must be manually curated by editors. TourVN proves AI can transform social media content into tourism-grade information with admin oversight.

### Supporting Innovation: Mood-Based Discovery

The **mood-based navigation** UX differentiates TourVN from traditional filter-based tourism apps:

- Traditional: Province → District → Category
- TourVN: Mood → Distance → Discovery

This emotional-first approach makes the AI-generated content *accessible* to users who don't know what they want.

### Validation Strategy

| Innovation | Validation Method | Success Signal |
|------------|-------------------|----------------|
| AI Pipeline | Admin approval rate | 80%+ first-pass |
| AI Pipeline | Location verification pass rate | 95%+ auto-matched |
| Speech-to-Text | Transcript accuracy | Manual spot-check Vietnamese accuracy |
| Mood Discovery | Time-to-value | < 60 seconds to first discovery |

### Risk Mitigation

| Risk | Mitigation |
|------|------------|
| AI generates inaccurate content | Admin editor + approval workflow |
| Speech-to-text fails on Vietnamese | Test multiple STT providers (Google, Azure) |
| Location not in database | Flag for manual review, admin can add new location |
| Pipeline downtime | Manual article creation as fallback |

### Competitive Moat

The AI pipeline creates a **content moat** - fresh articles daily that competitors can't replicate without similar infrastructure. Combined with verified tour guides, TourVN offers a complete discovery-to-booking experience.

## Mobile App Specific Requirements

### Platform Requirements

| Requirement | Specification |
|-------------|---------------|
| **Framework** | Flutter (cross-platform) |
| **Target Platforms** | iOS 12+, Android 8+ (API 26+) |
| **Language** | Dart |
| **State Management** | Riverpod |
| **Min Screen Size** | 4.7" (iPhone SE) |

### Device Permissions

| Permission | Level | Use Case | Required By |
|------------|-------|----------|-------------|
| **Camera** | Standard | KYC document capture, review photos | Tour Guides, Tourists |
| **Photo Gallery** | Standard + iOS Limited Access | Select existing photos for KYC, reviews | Tour Guides, Tourists |
| **Location** | **When in use only** | "Nearby" filter, distance calculation | Tourists |
| **Internet** | Standard | Core functionality | All users |

**Permission Request Strategy:**
1. **Pre-permission screen** - Custom UI explaining WHY before system dialog
2. **Just-in-time** - Request when feature is first used
3. **Graceful degradation** - If denied, show disabled UI with enable path (not hidden)
4. **iOS Limited Photos** - Handle partial gallery access gracefully

**Denied Permission UX:**
- Don't hide features - show them **grayed out/disabled**
- Include message: "Enable location to filter by distance"
- Tap opens app settings to grant permission

### Offline Mode

**MVP Status:** Not supported

**Behavior when offline:**
- Show cached content if available (location list, saved articles)
- Display "No connection" banner
- Disable write operations (reviews, contact guide)
- Queue operations for retry when online (Post-MVP)

### Push Notification Strategy

**MVP Scope:**

| Recipient | Notification Type | Trigger |
|-----------|-------------------|---------|
| **Tour Guide** | KYC Approved | Admin approves application |
| **Tour Guide** | Tour Approved | Admin approves listing |
| **Tour Guide** | New Inquiry | Tourist contacts guide |

**Post-MVP (Phase 2):**
- Tourists: New articles in saved moods
- Tourists: Seasonal alerts

**Implementation:** Firebase Cloud Messaging (FCM)

### Store Compliance

| Store | Requirements | Status |
|-------|--------------|--------|
| **App Store (iOS)** | Privacy policy, no external payments | ✅ Compliant |
| **Play Store (Android)** | Privacy policy, content rating | ✅ Compliant |
| **Content Rating** | Everyone / 4+ | Tourism content |

### Architecture Pattern

**Clean Architecture with feature-based folders:**

```
lib/
├── core/                    # Shared utilities, theme, constants
│   ├── theme/
│   ├── utils/
│   └── constants/
├── features/
│   ├── auth/
│   │   ├── data/           # Repositories, Firebase data sources
│   │   ├── domain/         # Entities, use cases
│   │   └── presentation/   # UI widgets, Riverpod providers
│   ├── discover/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── location/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── guide/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart
```

**Key Technical Stack:**
- **State Management:** Riverpod
- **Authentication:** Firebase Auth
- **Database:** Cloud Firestore
- **Storage:** Firebase Storage (images)
- **Push:** Firebase Cloud Messaging
- **Maps:** Google Maps SDK

## Project Scoping & Phased Development

### MVP Strategy & Philosophy

**MVP Approach:** Experience MVP
- Deliver the core mood-based discovery experience with AI-curated content
- Prove the AI Pipeline works in production
- Validate two-sided marketplace (tourists + guides)

**Resource Requirements:**
- **Team Size:** Solo developer (Nguye)
- **Timeline:** 3 months (12 weeks)
- **Skills:** Flutter, Firebase, AI integration (Gemini)

### Development Phases

#### Phase 1: MVP (3 Months / 12 Weeks)

**Week 0 - Setup (Buffer):**
| Task | Duration |
|------|----------|
| Firebase project setup + security rules | 2-3 days |
| App Store / Play Store accounts | 1-2 days |
| Project scaffolding (Flutter + Riverpod) | 1-2 days |

**Month 1 (Weeks 1-4) - P0 Foundation:**
| Feature | User | Priority | Notes |
|---------|------|----------|-------|
| Firebase Auth (email/social) | All | P0 | |
| Location browsing + mood filters | Tourist | P0 | Core experience |
| Location details + photos | Tourist | P0 | |
| **AI Pipeline v1** (de-risk) | Admin | P0 | Test STT + Gemini |

*Admin dashboard moved to Month 2. Seed data via Firebase Console.*

**Month 2 (Weeks 5-8) - P1 Content:**
| Feature | User | Priority | Notes |
|---------|------|----------|-------|
| Basic admin dashboard | Admin | P1 | Moved from Month 1 |
| Full AI Content Pipeline | Admin | P1 | |
| Article Editor | Admin | P1 | |
| Review system (read/write) | Tourist | P1 | |
| Article display per location | Tourist | P1 | |

**Month 3 (Weeks 9-12) - P2 Guides:**
| Feature | User | Priority | Notes |
|---------|------|----------|-------|
| Tour Guide registration | Guide | P2 | |
| KYC document upload | Guide | P2 | |
| KYC approval workflow | Admin | P2 | |
| Tour listing creation | Guide | P2 | |
| Guide contact exchange | Tourist/Guide | P2 | |
| Push notifications (guides) | Guide | P2 | FCM setup |

### Checkpoints & Go/No-Go Decisions

| Checkpoint | Week | Decision |
|------------|------|----------|
| **Month 1 Review** | Week 4 | AI Pipeline v1 working? Proceed to Month 2 |
| **Month 2 Review** | Week 8 | Content + Reviews working? Proceed to Guides |
| **Week 10 Checkpoint** | Week 10 | On track for guides? If behind, simplify KYC flow |
| **Final Review** | Week 12 | Graduation ready? |

### Risk Mitigation Strategy

| Risk Type | Risk | Mitigation |
|-----------|------|------------|
| **Technical** | AI Pipeline complexity | De-risk in Month 1 with basic version |
| **Technical** | Vietnamese STT accuracy | Test Google/Azure STT early, manual fallback |
| **Schedule** | Month 1 overload | Admin dashboard moved to Month 2 |
| **Schedule** | Month 3 pressure | Week 10 checkpoint for scope adjustment |
| **Resource** | Solo developer bottleneck | Clear priorities, cut features not quality |

### Scope Boundaries

**In Scope (MVP):**
- Mobile app (iOS + Android via Flutter)
- Admin web dashboard (React)
- AI content pipeline (backend)
- Tour Guide marketplace with KYC
- Firebase backend services

**Out of Scope (MVP):**
- Payments/booking transactions
- Offline mode
- Multi-language support
- Social features
- Push notifications for tourists

## Functional Requirements

### User Authentication & Profile

- **FR1:** Users can register with email/password or social login (Google, Facebook)
- **FR2:** Users can log in and log out of their account
- **FR3:** Users can view and edit their profile information
- **FR4:** Users can switch between Tourist and Tour Guide roles
- **FR5:** System can distinguish user roles (Tourist, Guide, Admin)

### Location Discovery

- **FR6:** Tourists can browse locations filtered by mood categories (Chill, Adventure, Food, etc.)
- **FR7:** Tourists can filter locations by distance from current location
- **FR8:** Tourists can view trending locations
- **FR9:** Tourists can view location details including photos and description
- **FR10:** Tourists can view AI-curated articles for a location
- **FR11:** Tourists can save/favorite locations for later
- **FR12:** System displays empty state with trending suggestions when no nearby results

### Reviews & Ratings

- **FR13:** Tourists can view reviews for a location
- **FR14:** Tourists can write reviews with text and photos
- **FR15:** Tourists can rate locations
- **FR16:** System displays review count and average rating per location

### Tour Guide Discovery

- **FR17:** Tourists can view verified tour guides associated with a location
- **FR18:** Tourists can view tour guide profiles with ratings and tour listings
- **FR19:** Tourists can view tour details including pricing, duration, and description
- **FR20:** Tourists can contact tour guides via displayed contact information

### Tour Guide Registration & Management

- **FR21:** Users can apply to become a Tour Guide
- **FR22:** Guides can upload KYC documents (ID, selfie, license)
- **FR23:** Guides can view their KYC application status
- **FR24:** Guides can create tour listings with details and pricing
- **FR25:** Guides can edit and manage their tour listings
- **FR26:** Guides can view booking inquiries from tourists
- **FR27:** Guides receive push notifications for KYC approval and new inquiries

### AI Content Pipeline (Admin)

- **FR28:** Admins can input TikTok video URLs for processing
- **FR29:** System can download video and extract audio
- **FR30:** System can transcribe Vietnamese audio to text (Speech-to-Text)
- **FR31:** System can generate article content from transcript using AI (Gemini)
- **FR32:** System can auto-match generated content to existing locations
- **FR33:** System flags unmatched locations for manual review
- **FR34:** Admins can review AI-generated articles in approval queue
- **FR35:** Admins can edit article content before publishing
- **FR36:** Admins can approve or reject articles
- **FR37:** Admins can add new locations when AI identifies unknown places

### Admin Moderation

- **FR38:** Admins can view and process KYC application queue
- **FR39:** Admins can approve or reject KYC applications
- **FR40:** Admins can view and process tour listing approval queue
- **FR41:** Admins can approve or reject tour listings
- **FR42:** Admins can view reported content and user reports
- **FR43:** Admins can remove reviews or content
- **FR44:** Admins can warn or ban users

### System Capabilities

- **FR45:** System requests permissions just-in-time with pre-permission screens
- **FR46:** System handles denied permissions gracefully (disabled UI, not hidden)
- **FR47:** System displays offline state with cached content when no connection
- **FR48:** System sends push notifications to tour guides via FCM

### Navigation & Sharing

- **FR49:** System can open external map application (Google Maps/Apple Maps) to navigate from current location to selected destination
- **FR52:** Tourists can share location or article links via device Native Share functionality (Messenger, Zalo, copy link, etc.)

### Content Management (Admin)

- **FR50:** System supports article statuses: Draft, Pending, Published, Archived for content lifecycle management

### Analytics & Reporting (Admin)

- **FR51:** Admins can view basic dashboard metrics: Total registered users, New locations added this week, Total guide contact clicks

## Non-Functional Requirements

### Performance

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| **NFR1** | App initial load time | < 3 seconds on 4G | P0 |
| **NFR2** | First location card visible | < 3 seconds after mood selection | P0 |
| **NFR3** | Mood filter response | < 500ms (requires Firestore composite indexes) | P0 |
| **NFR4** | Location detail load | < 2 seconds | P1 |
| **NFR5** | Image loading | Progressive with placeholders | P1 |
| **NFR6** | Infinite scroll | Smooth 60fps, no jank | P1 |

### Security

| ID | Requirement | Specification | Priority |
|----|-------------|---------------|----------|
| **NFR7** | Authentication | Firebase Auth with secure token handling | P0 |
| **NFR8** | KYC document storage | Encrypted at rest in Firebase Storage | P0 |
| **NFR9** | Data transmission | HTTPS/TLS for all API calls | P0 |
| **NFR10** | Firestore rules | Role-based access (Tourist/Guide/Admin) | P0 |
| **NFR11** | Admin access | Separate authentication for admin dashboard | P1 |

### Reliability

| ID | Requirement | Target | Priority |
|----|-------------|--------|----------|
| **NFR12** | App crash rate | < 1% of sessions | P0 |
| **NFR13** | Firebase availability | 99.9% (Firebase SLA) | P0 |
| **NFR14** | AI Pipeline fallback | Manual article creation if Gemini fails | P1 |
| **NFR15** | Offline graceful degradation | Display cached content, show offline banner | P1 |
| **NFR28** | Rate Limiting | Handle Gemini 429 errors gracefully (retry after X seconds) | P1 |

### Integration

| ID | Requirement | Specification | Priority |
|----|-------------|---------------|----------|
| **NFR16** | Google Maps SDK | Open external maps for navigation | P0 |
| **NFR17** | Gemini AI API | Vietnamese language processing | P0 |
| **NFR18** | Speech-to-Text | Support Vietnamese audio transcription | P0 |
| **NFR19** | Firebase Cloud Messaging | Push notifications to guides | P1 |
| **NFR20** | Native Share | iOS/Android share sheet integration | P2 |
| **NFR30** | AI Pipeline latency | Article generation < 5 minutes from URL submission | P2 |

### Compatibility

| ID | Requirement | Specification | Priority |
|----|-------------|---------------|----------|
| **NFR29** | Device compatibility | Android 8.0 (API 26)+, iOS 13.0+ | P0 |
| **NFR21** | Font scaling | Support system font size preferences | P2 |
| **NFR22** | Touch targets | Minimum 44x44pt for interactive elements | P2 |
| **NFR23** | Color contrast | Meet WCAG AA for text readability | P2 |

### Optimization

| ID | Requirement | Specification | Priority |
|----|-------------|---------------|----------|
| **NFR27** | Image optimization | Auto compress uploaded images < 1MB | P1 |

### Localization

| ID | Requirement | Specification | Priority |
|----|-------------|---------------|----------|
| **NFR24** | Default language | Vietnamese (primary) | P0 |
| **NFR25** | Date/time format | Vietnamese locale (dd/MM/yyyy) | P1 |
| **NFR26** | Currency format | VND with proper formatting | P1 |
