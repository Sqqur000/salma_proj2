# 🎮 OmniGamer

Discover. Explore. Find Your Next Adventure.

OmniGamer is a Flutter game discovery application powered by the RAWG Video Games Database API. It allows users to explore games, view ratings and release dates, browse genres and platforms, and open detailed information about selected games.

# ✨ Features
🎮 Browse a list of games
⭐ View game ratings and Metacritic scores
📅 View release dates
🔍 Search & discovery section
🎯 Explore genres and platforms
📖 View detailed game information
⏳ Loading, error, and empty states
📱 Responsive interface using MediaQuery
🧩 Reusable Flutter widgets
🧭 Navigation between screens
🔗 APIs

# OmniGamer uses two RAWG API endpoints following a List → Details pattern.

# Games List API
GET https://api.rawg.io/api/games

Used to retrieve the list of games displayed on the Home screen.

Game Details API
GET https://api.rawg.io/api/games/{id}

# 🔄 Data Flow
RAWG Games API
      ↓
HomeScreen
      ↓
User selects a game
      ↓
Game ID is passed to DetailsScreen
      ↓
RAWG Game Details API
      ↓
GameModel
      ↓
DetailsScreen

# 🧩 GameModel & fromJson

The project uses a reusable GameModel to convert RAWG JSON responses into Dart objects.

factory GameModel.fromJson(Map<String, dynamic> json) {
  return GameModel(
    name: json['name'],
    released: json['released'],
    backgroundImage: json['background_image'],
    rating: (json['rating'] as num?)?.toDouble(),
    id: json['id'],
    description: json['description'],
    metacritic: (json['metacritic'] as num?)?.toDouble(),
    ratingsCount: json['ratings_count'],
  );
}

The same model is used for both the games list and details response because both APIs return game data.

# 🏠 Home Screen

The Home screen retrieves games from the RAWG API using FutureBuilder and displays them in a responsive grid.

# Each game card shows:

Game image
Game name
Rating

Selecting a card navigates to its corresponding details page.

# 🃏 Game Cards

Game cards are reusable UI components displayed inside the game grid. They use rounded corners, game artwork, ratings, and responsive sizing.

# 🔎 Search & Discovery

# The Search screen provides a visual discovery area with:

Action
Strategy
RPG
Shooter
Adventure
Puzzle
Racing
Sports
Simulation
Horror
PC
PlayStation
Xbox
Mobile

# 📖 Game Details

When a game is selected, its ID is passed to DetailsScreen.

The Details screen then requests:

/api/games/{id}

and displays:

Game artwork
Name
Rating
Release date
Metacritic score
Description

HTML tags returned inside descriptions are cleaned before displaying the text.

# 🧭 Navigation

The application contains four main screens:

Splash Screen
Home Screen
Search Screen
Details Screen

Navigation uses Flutter's Navigator, including passing the selected GameModel to the Details screen.

# ⏳ Loading & Error Handling

FutureBuilder is used to manage API states:

Loading → animated loading indicator
Error → "Oops Something went wrong!"
No data → "No game found"
Success → display the requested game information
🛠️ Technologies
Flutter
Dart
RAWG Video Games Database API
HTTP
Google Fonts
Loading Animation Widget
# 🔐 API Configuration

The RAWG API key and base URL are stored separately in ApiConfig, keeping API configuration outside the UI and service logic.

# 📸 Screenshots

### Splash Screen




<img width="373" height="370" alt="Screenshot 2026-09-06 154801" src="https://github.com/user-attachments/assets/b34d008a-bbeb-4ebe-9dfa-17c741bd2bc4" />






 Home Screen





### Search / Discovery Screen





<img width="451" height="468" alt="Screenshot 2026-09-06 160914" src="https://github.com/user-attachments/assets/4c999763-98bf-480d-b52e-6c2ded612e53" />



















Game Details Screen

# 🚀 Extra Features
Reusable custom widgets
Responsive layouts
Custom gaming background
Genre and platform discovery cards
Animated loading states
HTML description cleaning
Clean separation between models, services, screens, and widgets
# 🎯 Assignment Requirements
 List screen using API
 Details screen using API
 Pass game ID between screens
 fromJson model
 FutureBuilder
 Loading state
 Error state
 Empty state
 Navigation
 Reusable widgets
 Organized project structure
 List → Details API flow
# 💡 Learning Outcomes

Through OmniGamer, the project demonstrates practical experience with Flutter UI development, REST APIs, JSON parsing, asynchronous programming, navigation, reusable widgets, responsive layouts, and API-driven applications.
