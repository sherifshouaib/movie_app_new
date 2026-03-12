# 🎬 Flutflix App

Flutflix is a Flutter application for browsing and watching movie trailers. The app fetches movies dynamically and presents them in an interactive UI with a carousel and horizontal list views.

## 🚀 Features
### 🏠 Home View

Displays movies in a carousel at the top.

Shows two horizontal ListViews stacked vertically, allowing independent scrolling.

Tap any movie to navigate to the Movie Details View.

### 🎥 Movie Details

Displays detailed information about the selected movie.

Includes a Watch Trailer button that navigates to the Trailer View, where the movie trailer plays using an embedded video player.

### 📄 Trailer View

Plays the trailer of the selected movie.

Uses YouTube player integration for seamless viewing.

## 🏗 Project Architecture

The project is structured for simplicity and maintainability:
```
lib
│
├── core
│   ├── buttons        # Reusable buttons used across the app
│   ├── errors         # Error handling and messages
│   ├── networking     # API service and network handling
│   └── utils          # Helpers, constants, and shared functions
│
├── features
│   ├── home           # Home view with carousel and horizontal listviews
│   ├── movie_details  # Movie detail page
│   └── trailer        # Trailer view page
│
└── main.dart
```
Core Folder

errors → Handles exceptions and error messages.

utils → Contains helpers, constants, and shared functions.

widgets → Reusable widgets across the app.

Features Folder

home → Displays movies in carousel and list views.

movie_details → Shows details of a selected movie.

trailer → Plays the movie trailer.

## 📱 Screens

<div>
<img src="https://github.com/user-attachments/assets/29271b68-148a-4c4f-b6ea-55c8f1b9a855" width="300">
<img src="https://github.com/user-attachments/assets/f8ebf22f-8c67-4770-8099-1c114d97badb" width="300">
<img src="https://github.com/user-attachments/assets/29c9e41e-6d52-4957-bb1b-8998aa3cd06d" width="300">
<img src="https://github.com/user-attachments/assets/057f64a8-b5fe-4a23-969f-e289667cfdc4" width="300">
</div>


* Home View
* Movie Details View (Trending View)
* Trailer View

---

## 🌐 API Integration

Movies are fetched from an external Movies API.

Data is displayed in real-time on the home view.

## 📦 Packages Used
Package	Purpose
carousel_slider	Displays movies in a carousel format
dio	Handles HTTP requests to fetch movie data
http	Alternative HTTP client for networking
youtube_player_flutter	Plays YouTube trailers
dartz	Handles functional programming patterns (like failures)
cupertino_icons	iOS style icons
flutter	Flutter SDK
## 🖼 Assets

Movie app logo located at: assets/images/flutflix.png

## 🛠 Built With

Flutter & Dart

REST API integration

Clean architecture with feature-based folder structure

## 👨‍💻 Author

Developed by Sherif Shouaib
