part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}
// Base class for all weather-related states.
// Declared as `sealed` to restrict inheritance to this file only, ensuring all possible states are defined here.

final class WeatherInitial extends WeatherState {}
// Represents the initial state of the WeatherBloc when no action has been taken yet.

class WeatherLoadingState extends WeatherState {}
// Represents the state when weather data is being fetched, typically shown with a loading indicator.

class WeatherFailureState extends WeatherState {}
// Represents the state when there is a failure in fetching weather data, such as an API error or no internet connection.

class WeatherSuccessState extends WeatherState {
  final Weather weather; // Holds the successfully fetched weather data.

  WeatherSuccessState({required this.weather});
// Constructor to initialize the state with the fetched weather data.
// `required` ensures that the weather data is always provided when creating an instance.
}
