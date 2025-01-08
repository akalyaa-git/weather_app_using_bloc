part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}
// Base class for all weather-related events.
// Declared as `sealed` to restrict inheritance to this file only, ensuring all possible events are defined here.

class FetchWeatherEvent extends WeatherEvent {
  final Position
      position; // Holds the user's geographic position (latitude and longitude).

  FetchWeatherEvent({required this.position});
// Constructor to initialize the event with the user's position.
// `required` ensures the position is provided when creating an instance.
}
