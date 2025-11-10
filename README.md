# ☀️ Clima: Your Cross-Platform Weather Companion 🌦️

Clima is a beautiful and intuitive weather application built with Flutter, designed to provide you with real-time weather information across multiple platforms. Whether you're on iOS, Android, macOS, Linux, or the web, Clima delivers accurate and up-to-date weather forecasts right at your fingertips. It leverages geolocation services to pinpoint your location and fetches weather data from reliable APIs, presenting it in a user-friendly interface.

## 🚀 Key Features

*   **Cross-Platform Compatibility:** Runs seamlessly on iOS, Android, macOS, Linux, and web browsers. 📱💻
*   **Geolocation:** Automatically detects your current location to provide localized weather information. 📍
*   **Real-time Weather Data:** Fetches the latest weather conditions, including temperature, humidity, wind speed, and more. 🌡️💨
*   **Asynchronous Data Fetching:** Uses HTTP requests to retrieve weather data from external APIs efficiently. 🌐
*   **Loading Animations:** Provides engaging loading animations while fetching data, enhancing the user experience. ⏳
*   **Environment Variable Management:** Securely manages API keys and other sensitive information using `.env` files. 🔑

## 🛠️ Tech Stack

| Category    | Technology                               | Version   | Description                                                                                                |
| :---------- | :--------------------------------------- | :-------- | :--------------------------------------------------------------------------------------------------------- |
| **Frontend**  | Flutter                                  | 3.x       | Cross-platform UI toolkit for building native apps from a single codebase.                               |
| **Language**  | Dart                                     | 3.8.1+   | The programming language used for Flutter development.                                                    |
| **UI**        | Flutter Widgets                          | N/A       | Pre-built UI components for creating a visually appealing and responsive user interface.                    |
| **Geolocation** | geolocator                             | ^14.0.2  | Package for accessing geolocation services on various platforms.                                           |
| **Networking**  | http                                     | ^1.5.0   | Package for making HTTP requests to fetch weather data from APIs.                                          |
| **Animations**  | flutter_spinkit                          | ^5.2.2   | Package for creating smooth and visually appealing loading animations.                                       |
| **Environment** | flutter_dotenv                         | ^6.0.0   | Package for loading environment variables from a `.env` file, securing API keys.                            |
| **Icons**     | cupertino_icons                          | N/A       | Provides iOS-style icons for a consistent look and feel on iOS devices.                                  |
| **IDE**       | VS Code, Android Studio, or similar     | N/A       | Development environment for writing and debugging Flutter code.                                           |
| **iOS**       | Swift, UIKit                             | N/A       | Native technologies used for iOS app initialization and plugin registration.                               |
| **macOS**     | Swift, Cocoa                             | N/A       | Native technologies used for macOS app initialization and lifecycle management.                             |
| **Linux**     | C++, GTK, GLib                           | N/A       | Native technologies used for Linux app initialization, window management, and plugin registration.          |
| **Windows**   | C++, Win32 API                           | N/A       | Native technologies used for Windows app initialization, window management, and plugin registration.        |
| **Web**       | HTML, JavaScript                         | N/A       | Standard web technologies for building the web application.                                                |
| **Build Tool**| Flutter CLI                            | N/A       | Command-line tool for building, testing, and deploying Flutter applications.                               |

## 📦 Getting Started

Follow these instructions to get Clima up and running on your local machine.

### Prerequisites

*   Flutter SDK: Make sure you have the Flutter SDK installed. You can download it from [flutter.dev](https://flutter.dev/docs/get-started/install).
*   Dart SDK: Dart comes bundled with Flutter, so you don't need to install it separately.
*   Android Studio or Xcode (for mobile development): Required for running the app on emulators or physical devices.
*   CMake and Ninja (for desktop development): Required for building the Linux and Windows versions.
*   A Weather API Key: You'll need to obtain an API key from a weather data provider (e.g., OpenWeatherMap) to fetch weather information.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd clima
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Configure environment variables:**

    *   Create a `.env` file in the root of the project.
    *   Add your Weather API key to the `.env` file:

        ```
        WEATHER_API_KEY=YOUR_API_KEY
        ```

### Running Locally

1.  **Run on Android/iOS:**

    *   Connect a physical device or start an emulator.
    *   Run the app:

        ```bash
        flutter run
        ```

2.  **Run on macOS:**

    ```bash
    flutter run -d macos
    ```

3.  **Run on Linux:**

    ```bash
    flutter run -d linux
    ```

4.  **Run on Windows:**

    ```bash
    flutter run -d windows
    ```

5.  **Run on Web:**

    ```bash
    flutter run -d chrome
    ```

## 📂 Project Structure

```
clima/
├── android/             # Android-specific files
├── ios/                 # iOS-specific files
├── lib/                 # Dart source code
│   ├── main.dart        # Main application entry point
│   └── ...              # Other Dart files
├── linux/               # Linux-specific files
│   └── runner/
│       ├── main.cc      # Linux entry point
│       └── my_application.cc # GTK application class
├── macos/               # macOS-specific files
│   └── Runner/
│       └── AppDelegate.swift # macOS entry point
├── windows/             # Windows-specific files
│   └── runner/
│       ├── main.cpp     # Windows entry point
│       └── flutter_window.cpp # Flutter window management
├── web/                 # Web-specific files
│   └── index.html       # Main HTML file
├── .env                 # Environment variables (API keys)
├── pubspec.yaml         # Flutter project configuration
├── README.md            # Project documentation
└── ...                  # Other project files
```

### 📸 App Preview
<p align="left">
  <img src="https://raw.githubusercontent.com/Muhammad-Ali-5331/Clima/master/clima.gif" alt="Clima App Demo" width="30%"/>
</p>

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute to Clima, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with clear, concise messages.
4.  Submit a pull request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📬 Contact

If you have any questions or suggestions, feel free to contact me at [malitariq5324@gmail.com](mailto:your_email@example.com).

## 💖 Thanks

Thank you for checking out Clima! I hope you find it useful. Your feedback and contributions are greatly appreciated.
