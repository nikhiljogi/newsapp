# 📰 News App – Flutter News App Using NewsAPI

This Flutter application is built as part of the developer assessment for Alltake. It displays news articles fetched from NewsAPI, with features such as detailed views, search functionality, offline caching, and theme switching.

 📱 Features Overview

- Home Screen – Displays a list of news articles with image, title, and published time.
- Detail Screen – Shows article title, author, content, and link to the original source.
- Source-wise Filter – View articles from a selected source.
- Search Functionality – Filter articles by keyword (title/content).
- Offline Caching – Articles are stored locally using Hive for offline access.
- Dark/Light Theme Toggle – Users can switch between light and dark modes.

---

 🧑‍💻 Architecture

This project follows Clean Architecture, separating responsibilities into distinct layers:

lib/
├── core/ # App-wide constants, themes, utilities
├── data/ # Data sources (API services, local storage)
│ └── models/ # Data models used by the app
├── domain/ # Business logic, use cases
├── presentation/ # UI, screens, widgets, BLoC logic
│ └── blocs/ # BLoC and state management classes

markdown
Copy
Edit

- **State Management**: Implemented using `rxdart` and manual stream controllers to manage reactive UI.
- **HTTP Client**: Used `http` package to fetch data from the NewsAPI.
- **Local Storage**: Used `Hive` to cache articles and display them when offline.

---

## 📦 Dependencies

- [`http`](https://pub.dev/packages/http)
- [`hive`](https://pub.dev/packages/hive)
- [`flutter_html`](https://pub.dev/packages/flutter_html)
- [`url_launcher`](https://pub.dev/packages/url_launcher)
- [`timeago`](https://pub.dev/packages/timeago)
- [`carousel_slider`](https://pub.dev/packages/carousel_slider)
- [`eva_icons_flutter`](https://pub.dev/packages/eva_icons_flutter)
- [`rxdart`](https://pub.dev/packages/rxdart)
- [`hexcolor`](https://pub.dev/packages/hexcolor)
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons)

---

## 📥 How to Run the App

### 🔧 Prerequisites

- Flutter SDK (latest stable version)
- Git
- Android Studio / VS Code
- A connected device or emulator

### ⚙️ Setup Instructions

```bash
# 1. Clone the repository
git clone https://github.com/your-username/news-app.git
cd news-app

# 2. Get all dependencies
flutter pub get

# 3. Run the app
flutter run
To open in Android Studio:

Launch Android Studio → Open the project folder

Wait for indexing to complete

Use the Run button ▶️ to launch the app

📂 Screens Included
HomeScreen: List of top headlines

DetailNewsScreen: Article details with content and external link

SourceScreen: Articles filtered by source

SearchScreen: Live search through news content

AboutScreen: Toggle theme (dark/light)

🧠 Assumptions & Notes
API key is required for NewsAPI; mock data can be used for testing if unavailable.

Simple local caching is implemented for offline reading using Hive.

App uses BLoC-like reactive architecture using RxDart.

This submission was created within the 48-hour deadline as per instruction.

📎 Submission Links
🔗 APK Download: Click to Download

🎥 App Demo Video: Watch Video

