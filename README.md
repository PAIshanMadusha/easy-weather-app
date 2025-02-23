# 📌 Easy Weather App: Flutter

A simple Flutter weather application that fetches real-time weather data from the [OpenWeatherMap API](https://openweathermap.org/current). The app displays current weather conditions based on the user's location.

## 🚀 Features:
- Fetches current weather data using **OpenWeatherMap API**
- **Geolocation support** to get the user's current location.
- **City search functionality** for getting weather updates anywhere.
- **Lottie animations** for a better user experience.
- **Shared preferences** to save dark mode/light mode preferences
- Uses **Provider** for state management.

## 🛠 Dependencies:
This project uses the following dependencies:
- [Google Fonts](https://pub.dev/packages/google_fonts) (^6.2.1)
- [HTTP](https://pub.dev/packages/http) (^1.3.0)
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv) (^5.2.1)
- [Geolocator](https://pub.dev/packages/geolocator) (^13.0.2)
- [Geocoding](https://pub.dev/packages/geocoding) (^3.0.0)
- [Provider](https://pub.dev/packages/provider) (^6.1.2)
- [Shared Preferences](https://pub.dev/packages/shared_preferences) (^2.5.2)
- [Lottie](https://pub.dev/packages/lottie) (^3.3.1)

## 📂 Project Setup:
Follow these steps to clone and run the project:

### 1️⃣ Clone the Repository:
```bash
git clone https://github.com/PAIshanMadusha/easy-weather-app.git
```

### 2️⃣ Create a `.env` File:
- Since the `.env` file is excluded from GitHub, create it manually in the project root folder and add your **OpenWeather API key**:

Inside `.env`, add:
```ini
WEATHER_API_KEY="API-KEY"
```
- Replace `"API-KEY"` with your actual API key from [OpenWeather](https://home.openweathermap.org/api_keys).

### 3️⃣ Install Dependencies:
Run the following command:
```bash
flutter pub get
```

### 4️⃣ Run the App:
To start the app on a connected device or emulator, use:
```bash
flutter run
```

## 📸 System Screenshots:
---
<p align="center">
  <img src="https://github.com/user-attachments/assets/bc226d20-2ae2-4d43-82ab-f3bea1e5cb86" alt="Screenshot 1" width="196">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b5214c4d-5b2d-4504-a295-f5acdab2779a" alt="Screenshot 2" width="196">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/ad69c69c-453c-4437-9130-92efc6a19ac2" alt="Screenshot 3" width="196">&nbsp;&nbsp;&nbsp;
</p><br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/34b644ec-adef-440c-a140-1fb7da1d1fc1" alt="Screenshot 1" width="196">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/92298b40-375f-404c-83a4-0438513ba14b" alt="Screenshot 2" width="196">&nbsp;&nbsp;&nbsp;
</p>

## 📜 License
This project is open-source and available under the MIT License.
