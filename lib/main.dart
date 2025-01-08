import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc/weather/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Disable the debug banner on the top-right of the app
      home: FutureBuilder(
        // Use FutureBuilder to handle asynchronous fetching of the position
        future:
            _determinePosition(), // This function will determine the current position
        builder: (context, snap) {
          if (snap.hasData) {
            // Check if the position data is successfully fetched
            return BlocProvider<WeatherBloc>(
              // Wrap the HomeScreen with a WeatherBloc provider so that WeatherBloc is available in the widget tree
              create: (context) => WeatherBloc()
                ..add(
                  // Dispatch the FetchWeatherEvent to get weather data for the given position
                  FetchWeatherEvent(
                    position: snap.data
                        as Position, // Use the fetched position from the Future
                  ),
                ),
              child:
                  HomeScreen(), // The HomeScreen widget is shown if data is available
            );
          } else {
            return const Scaffold(
              body: Center(
                // Show a loading indicator while waiting for the position to be determined
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
