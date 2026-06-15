# WakeyWakey

> A production-grade smart alarm app for Android — built with Flutter, BLoC, Clean Architecture, and a beautiful Neumorphism UI.

---

## 📱 About

WakeyWakey is an Alarmy-inspired alarm application that makes sure you actually wake up. Instead of just swiping to dismiss, you must complete a **mission** — like solving a math problem, scanning a QR code, or walking a set number of steps — before the alarm turns off.

---

## ✨ Features

### 🔔 Core Alarm System
- Create, edit, and delete alarms
- One-time and repeating alarms (per day of week)
- Custom labels and categories
- Custom ringtones
- Vibration control
- Gradual volume increase
- Snooze with configurable duration and max count
- Alarm history

### 🎯 Mission Engine
| Mission | Description |
|---------|-------------|
| 🧮 Math | Solve arithmetic equations |
| 📷 Camera | Photograph a pre-saved object |
| 📦 QR / Barcode | Scan a saved QR code |
| ⌨️ Typing | Type a predefined sentence exactly |
| 📳 Shake | Shake the phone N times |
| 🚶 Walking | Walk a set number of steps |

### 🛡️ Anti-Cheat System
- Foreground service keeps alarm alive
- Full-screen alarm on lock screen
- Alarm recovery after phone reboot
- Android battery optimization guidance
- Back button disabled during alarm

### 🤖 AI Features
- **AI Wake-Up Verification** — AI asks questions (date, goals, what you studied) before dismissal
- **Goal-Based Alarm** — Set a daily goal; alarm dismisses only after proof of completion
- Voice and text input support

### 🏆 Gamification
- Daily wake-up streaks
- XP and level system
- Achievement badges
- Wake-up score
- Statistics dashboard

---

## 🎨 Design

**Theme:** Neumorphism — soft, embossed, tactile UI

| Token | Value |
|-------|-------|
| Base background | `#E0E5EC` |
| Shadow dark | `#B8BEC7` |
| Shadow light | `#FFFFFF` |
| Accent | `#6C63FF` |
| Text primary | `#2D3748` |

---

## 🏗️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Language | Dart |
| Framework | Flutter |
| State Management | BLoC (`flutter_bloc ^8.x`) |
| Architecture | Clean Architecture + Repository Pattern |
| Database | Isar |
| Navigation | go_router |
| DI | get_it |
| Alarm Scheduling | android_alarm_manager_plus |
| Notifications | flutter_local_notifications |
| Audio | just_audio |
| AI | Anthropic Claude API |

---

## 📁 Project Structure

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── errors/
│   └── usecases/
├── config/
│   ├── injection/
│   └── routes/
├── theme/
│   ├── app_theme.dart
│   ├── neu_colors.dart
│   ├── neu_shadows.dart
│   ├── neu_spacing.dart
│   └── neu_typography.dart
├── shared/
│   └── widgets/
│       ├── neu_card.dart
│       ├── neu_button.dart
│       ├── neu_text_field.dart
│       └── neu_toggle.dart
└── features/
    ├── alarm/
    ├── mission/
    ├── ai/
    ├── gamification/
    └── settings/
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio or VS Code
- Android device / emulator (Android 8.0+)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Ira9181/wakeywakey.git
cd wakeywakey

# 2. Install dependencies
flutter pub get

# 3. Run code generation (for Isar schemas)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

### Windows users — create asset folders

```powershell
New-Item -ItemType Directory -Force -Path assets/sounds, assets/images, assets/animations
New-Item -Force assets/sounds/.gitkeep, assets/images/.gitkeep, assets/animations/.gitkeep
```

---

## 🤝 Contributing

This project is currently in active development. Contributions, issues, and feature requests are welcome once the initial phases are complete.

---


## 👤 Author

**Ira**
- GitHub: https://github.com/Ira9181

---

> ⚠️ **Note:** This README will be updated as new features are completed.
> Current status: **in progress.**
