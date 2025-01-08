import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc/weather/presentation/sunrise_sunset_widget.dart';
import 'package:weather_app_using_bloc/weather/presentation/temp_min_max_widget.dart';
import 'package:weather_app_using_bloc/weather/presentation/weather_icon.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        // If the state is WeatherSuccessState, we will display the weather details.
        if (state is WeatherSuccessState) {
          return SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Set the width of the container to the screen width.
            height: MediaQuery.of(context)
                .size
                .height, // Set the height of the container to the screen height.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align the children of the column to the start.
              children: [
                // Display the country name in uppercase.
                Text(
                  '${state.weather.country?.toUpperCase()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Display a greeting message "Good Morning".
                const Text(
                  'Good Morning',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Display the weather icon based on the weather condition code.
                getWeatherIcon(state.weather.weatherConditionCode!),
                const SizedBox(
                  height: 8,
                ),
                // Display the current temperature in Celsius, rounded.
                Center(
                  child: Text(
                    '${state.weather.temperature?.celsius?.round()}°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 55,
                    ),
                  ),
                ),
                // Display the weather condition (e.g., sunny, cloudy).
                Center(
                  child: Text(
                    state.weather.weatherMain!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Display the current day, date, and time using the DateFormat class.
                Center(
                  child: Text(
                    DateFormat('EEEE dd ').add_jm().format(state.weather.date!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Display the sunrise and sunset widget with the weather state passed as parameter.
                SunriseSunsetWidget(
                  weatherSuccessState: state,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Divider(
                    color: Colors
                        .grey, // Divider between sunrise/sunset and temperature information.
                  ),
                ),
                // Display the temperature min and max widget with the weather state passed as parameter.
                TempMinMaxWidget(
                  weatherSuccessState: state,
                ),
              ],
            ),
          );
        } else {
          // If the state is not WeatherSuccessState, return an empty container (loading or error state).
          return Container();
        }
      },
    );
  }
}
