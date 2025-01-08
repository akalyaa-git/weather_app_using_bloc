# weather_app_using_bloc
This app provides real-time weather information based on the user's current location. It fetches weather data using the BLoC (Business Logic Component) pattern to manage the state and display it on the UI. The app is built with Flutter and uses the Geolocator package to determine the user's location and the Weather API to fetch weather details.

# Features
- Real-time Weather Data: Displays the current weather, including temperature, weather conditions (like sunny, rainy, cloudy), sunrise/sunset times, and minimum/maximum temperatures.
- Location-Based: Automatically fetches the user's current location to provide weather updates for that location.
- BLoC Pattern: Manages the application state using the BLoC pattern to handle weather data fetching and state management in a clean, efficient manner. 

# Key Components
- Home Screen: Displays the weather information, including:
* Weather Icon: Based on the current weather condition (e.g., sunny, cloudy, rainy).
* Temperature: The current temperature in Celsius.
* Weather Condition: A description of the weather (e.g., clear sky, rainy).
* Sunrise and Sunset: The times for sunrise and sunset.
* Temperature Min/Max: Shows the minimum and maximum temperatures for the day.

# BLoC (Business Logic Component):
- WeatherBloc: Fetches the weather data from the API based on the user's location.
- Weather Events: Triggers events like FetchWeatherEvent to request weather data from the API.
- Weather States: Handles different states like WeatherLoadingState, WeatherSuccessState, and WeatherFailureState to manage the app's UI flow.

# User Location: 
- Uses the Geolocator package to get the user's current latitude and longitude to fetch the weather data for that location.

# UI Layout:
- Uses a clean layout with a background image and various weather-related information displayed in an easy-to-read manner.
- Displays loading indicators when data is being fetched.

# How It Works
- When the app starts, it fetches the user's location using Geolocator.
- After the location is determined, a WeatherBloc is created, and a FetchWeatherEvent is triggered to fetch the weather data from the Weather API.

- The weather data is then displayed on the Home Screen using a variety of widgets, such as:
* Temperature and Weather Icon
* Sunrise/Sunset Information
* Max/Min Temperatures

- The app uses a FutureBuilder to handle asynchronous operations and show a loading indicator until the data is ready.

# App Flow
- App Initialization: The app determines the user's current location using the Geolocator package.
- Fetching Weather Data: The location is passed to the Weather API to fetch the current weather information.
- State Management: The app uses BLoC to handle the weather fetching logic and display the result on the screen based on different states (loading, success, failure).

# Libraries Used
- Flutter: The framework for building the app.
- Geolocator: To fetch the current location of the user.
- BLoC: For state management.
- Weather API: To fetch the weather data based on the user's location.
- Intl: For date formatting (for showing the time of sunrise and sunset).
