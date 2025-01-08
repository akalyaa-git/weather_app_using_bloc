import 'package:flutter/material.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc/weather/presentation/common_info_widget.dart';

class TempMinMaxWidget extends StatelessWidget {
  final WeatherSuccessState
      weatherSuccessState; // Holds the current weather state, including temperature data.

  const TempMinMaxWidget({super.key, required this.weatherSuccessState});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Distribute children equally within the row.
      children: [
        // CommonInfoWidget for displaying the maximum temperature.
        CommonInfoWidget(
          label: 'Temp Max', // Label text to be displayed.
          value: weatherSuccessState.weather.tempMax?.celsius
              ?.round(), // Max temperature in Celsius, rounded.
          iconPath:
              'assets/high_hot_summer_temperature_thermometer_icon.png', // Icon path for the max temperature icon.
          iconDescription:
              'High temperature icon', // Description for the icon (accessibility).
          isFromTempMaxMinWidget:
              true, // Since this widget is related to temperature, set it to true.
        ),
        // CommonInfoWidget for displaying the minimum temperature.
        CommonInfoWidget(
          label: 'Temp Min', // Label text to be displayed.
          value: weatherSuccessState.weather.tempMin?.celsius
              ?.round(), // Min temperature in Celsius, rounded.
          iconPath:
              'assets/temperature_min_icon.png', // Icon path for the min temperature icon.
          iconDescription:
              'Low temperature icon', // Description for the icon (accessibility).
          isFromTempMaxMinWidget:
              true, // Since this widget is related to temperature, set it to true.
        ),
      ],
    );
  }
}
