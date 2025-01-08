import 'package:flutter/material.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc/weather/presentation/common_info_widget.dart';

class SunriseSunsetWidget extends StatelessWidget {
  final WeatherSuccessState weatherSuccessState; // Holds the current weather state, which contains sunrise and sunset data.

  const SunriseSunsetWidget({super.key, required this.weatherSuccessState});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute children equally within the row.
      children: [
        // CommonInfoWidget for displaying the Sunrise information.
        CommonInfoWidget(
          label: 'Sunrise', // Label text to be displayed.
          time: weatherSuccessState.weather.sunrise, // Sunrise time obtained from the weather data.
          iconPath: 'assets/day_forecast_sun_sunny_weather_icon.png', // Icon path for the sunrise image.
          iconDescription: 'Sunrise icon', // Description for the icon (accessibility).
          isFromTempMaxMinWidget: false, // Since this is not related to temperature, set it to false.
        ),
        // CommonInfoWidget for displaying the Sunset information.
        CommonInfoWidget(
          label: 'Sunset', // Label text to be displayed.
          time: weatherSuccessState.weather.sunset, // Sunset time obtained from the weather data.
          iconPath: 'assets/weather_moon_moonlight_night_icon.png', // Icon path for the sunset image.
          iconDescription: 'Sunset icon', // Description for the icon (accessibility).
          isFromTempMaxMinWidget: false, // Since this is not related to temperature, set it to false.
        ),
      ],
    );
  }
}
