import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_using_bloc/weather/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

// WeatherBloc class for managing weather-related states and events.
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // Constructor initializing the WeatherBloc with the initial state.
  WeatherBloc() : super(WeatherInitial()) {
    // Registering the FetchWeatherEvent handler.
    on<FetchWeatherEvent>(fetchWeatherEvent);
  }

  // Function to handle FetchWeatherEvent and manage state transitions.
  FutureOr<void> fetchWeatherEvent(
      FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    // Emit the loading state while fetching weather data.
    emit(WeatherLoadingState());

    // Simulate a network delay for better user experience.
    await Future.delayed(const Duration(seconds: 3));

    try {
      // Initialize WeatherFactory with the API key and desired language.
      WeatherFactory weatherFactory = WeatherFactory(
        API_KEY, // Your weather API key stored in my_data.dart.
        language: Language.ENGLISH, // Set the language to English.
      );

      // Fetch the current weather data based on the user's latitude and longitude.
      Weather weather = await weatherFactory.currentWeatherByLocation(
        event.position.latitude, // Latitude from the event.
        event.position.longitude, // Longitude from the event.
      );

      // Emit success state with the fetched weather data.
      emit(WeatherSuccessState(weather: weather));
    } catch (e) {
      // If an error occurs, emit failure state to notify the UI.
      emit(WeatherFailureState());
    }
  }
}
