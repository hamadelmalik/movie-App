# 🎬 Movies App

A Flutter application for browsing movies using the **TMDb API**, built with Clean Architecture principles.

---

## 🚀 Features
- Display a list of available movies.
- Multiple categories (Action, Drama, etc.).
- Dynamic UI with **ListView.builder**.
- Clear separation of layers (Domain, Data, Presentation).
- Centralized asset management via `AppAssets`.

---

## 🛠️ Tech Stack
- **Flutter/Dart** for UI development.
- **Clean Architecture** for maintainability.
- **Dependency Injection** for object management.
- **TMDb API** as the data source.
- **GitHub** for version control and collaboration.

---

## 📂 Project Structure
lib/
├── core/
│   ├── connection/       # Network info & internet checker
│   ├── constants/        # App assets, colors, endpoints
│   ├── route/            # App routing
│   ├── services/         # Service locator / DI
│   └── theme/            # App theme
├── features/
│   └── home/
│       ├── data/
│       │   ├── datasource/   # Remote data sources
│       │   └── repositories/ # Implementations
│       ├── domain/
│       │   ├── entity/       # Models (Trending, Action)
│       │   ├── repositories/ # Abstract contracts
│       │   └── usecase/      # Use cases
│       └── presentation/
│           ├── cubit/       # BLoC / Cubit state management
│           └── pages/
│               ├── widgets/ # Reusable UI components
│               └── home_view.dart
└── main.dart

