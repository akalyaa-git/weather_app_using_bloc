import 'package:flutter/material.dart';

// Function to return appropriate weather icon based on weather code
Widget getWeatherIcon(int code) {
  if (code >= 200 && code < 300) {
    return Image.asset('assets/rain.png'); // Rain icon
  } else if (code >= 300 && code < 400) {
    return Image.asset(
        'assets/cloud_day_light_bolt_rain_sun_icon.png'); // Light rain or drizzle
  } else if (code >= 400 && code < 500) {
    return Image.asset('assets/cloud.png'); // Cloudy weather
  } else if (code >= 500 && code < 600) {
    return Image.asset('assets/snow.png'); // Snowy weather
  } else {
    return Image.asset(
        'assets/cloudy_day_fog_foggy_mist_icon.png'); // Default cloudy or foggy icon
  }
}
