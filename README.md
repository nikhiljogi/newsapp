📰 News App – Flutter News App Using NewsAPI
This Flutter application is developed as part of the Alltake Flutter Developer Assessment. It fetches and displays news articles from NewsAPI, incorporating features like offline caching, search functionality, and theme switching, built with a clean and responsive UI following Material Design principles.
📱 Features Overview

Home Screen: Displays a list of news articles with title, image (if available), and published date.
Detail Screen: Shows detailed article information, including title, author, full content, and a button to open the original article URL in a browser.
Search Functionality: Allows filtering articles by title or content using a search bar.
Offline Caching: Stores articles locally using Hive for offline access.
Theme Switching: Supports light and dark mode toggling for enhanced user experience.
Bonus Features:
Pull-to-refresh for updating the news list.
Basic unit test for the article model parsing.



🧑‍💻 Architecture
The project follows Clean Architecture to ensure separation of concerns and maintainability. The codebase is organized into three main layers:
lib/
├── core/                # App-wide utilities, constants, and themes
│   ├── constants/       # API keys, endpoints, and constants
│   ├── themes/          # Light and dark theme configurations
│   └── utils/           # Helper functions and utilities
├── data/                # Data layer (API calls, local storage)
│   ├── models/          # Data models (e.g., ArticleModel)
│   ├── repositories/    # Repository implementations
│   └── services/        # API and local storage services
├── domain/              # Business logic
│   ├── entities/        # Business entities
│   ├── repositories/    # Abstract repository interfaces
│   └── usecases/        # Use cases for business logic
├── presentation/        # UI layer (screens, widgets, state management)
│   ├── blocs/           # BLoC for state management
│   ├── screens/         # UI screens
│   └── widgets/         # Reusable UI components


State Management: Uses the Bloc package for reactive state management, ensuring a clear separation between UI and business logic.
HTTP Client: Utilizes the http package for making API calls to NewsAPI.
Local Storage: Implements Hive for caching articles locally, enabling offline access.
Navigation: Uses Flutter’s Navigator for routing between screens (Home, Detail, Search, etc.).

📦 Dependencies
The following packages are used to implement the required functionality:

http: For making API requests to NewsAPI.
hive and hive_flutter: For local storage and offline caching.
flutter_bloc: For state management.
url_launcher: To open article URLs in the browser.
timeago: To format published dates (e.g., "2 hours ago").
flutter_html: To render article content with HTML formatting.
pull_to_refresh: For pull-to-refresh functionality.
equatable: For value comparison in BLoC states.
cupertino_icons: For iOS-style icons.
flutter_test: For unit and widget testing.

Run flutter pub get to install all dependencies.
📥 How to Run the App
🔧 Prerequisites

Flutter SDK: Latest stable version (ensure null safety support).
Dart: Compatible with the Flutter version.
IDE: Android Studio or VS Code with Flutter plugins.
Device: A connected device or emulator (Android/iOS).
NewsAPI Key: Obtain an API key from NewsAPI or use mock data for testing.

⚙️ Setup Instructions

Clone the Repository:
git clone https://github.com/your-username/news-app.git
cd news-app


Install Dependencies:
flutter pub get


Configure API Key:

Add your NewsAPI key to lib/core/constants/api_constants.dart:const String newsApiKey = 'YOUR_API_KEY';


Alternatively, use the provided mock_data.json in the assets/ folder for testing without an API key.


Initialize Hive:

Ensure Hive is initialized in main.dart for local storage.


Run the App:
flutter run

Or open the project in Android Studio/VS Code, select a device, and click the Run button (▶️).


📂 Screens Included

HomeScreen: Displays a list of top headlines with images, titles, and published dates.
DetailNewsScreen: Shows detailed article information with a button to open the original URL.
SearchScreen: Allows filtering articles by keyword (title or content).
SettingsScreen: Includes a toggle for switching between light and dark themes.

🧠 Assumptions & Trade-offs

API Key: Assumes a NewsAPI key is available. If not, mock data from a local JSON file (assets/mock_data.json) can be used for testing.
Caching Strategy: Articles are cached using Hive with a simple key-value store. Only the latest fetched articles are stored to optimize storage usage.
Offline Mode: Displays cached articles when no internet is available. Assumes the user has fetched articles at least once while online.
Search: Implements client-side search by filtering cached articles, as NewsAPI’s free tier has limited search capabilities.
Theme Switching: Persists the theme preference using Hive for consistency across app restarts.
Pagination: Omitted due to time constraints and NewsAPI’s free tier limitations (e.g., limited page size). Pull-to-refresh is implemented instead.
Testing: Includes a basic unit test for the ArticleModel parsing to ensure data integrity.

📎 Submission Links

GitHub Repository: https://github.com/your-username/news-app
APK Download: https://drive.google.com/file/d/1YhutGImBel4I-feMtPt6_ANZ02351nzb/view
App Demo Video: https://drive.google.com/file/d/1YhN-uBwaVeIPgl-8ODgJzPXgmgND_H2P/view


