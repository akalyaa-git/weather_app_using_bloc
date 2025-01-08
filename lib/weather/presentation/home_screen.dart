import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_using_bloc/weather/presentation/weather_home.dart';

// HomeScreen widget, represents the main screen of the weather app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set the background color of the screen to black.
      extendBodyBehindAppBar:
          true, // Allows the body to extend behind the app bar.
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent.
        elevation: 0, // Remove shadow beneath the AppBar.
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness
                .light), // Sets the status bar icon brightness to light for contrast.
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40,
            20), // Adds padding around the content.
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // Makes the body take full screen height.
          child: Stack(
            // Stack widget allows layering of multiple widgets on top of each other.
            children: [
              // First circular background element (deep purple circle).
              Align(
                alignment: const AlignmentDirectional(
                    3, -0.3), // Positioned towards the right.
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Shape is a circle.
                    color: Colors.deepPurple, // Color is deep purple.
                  ),
                ),
              ),
              // Second circular background element (deep purple circle).
              Align(
                alignment: const AlignmentDirectional(
                    -3, -0.3), // Positioned towards the left.
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Shape is a circle.
                    color: Colors.deepPurple, // Color is deep purple.
                  ),
                ),
              ),
              // Large orange circle at the bottom of the screen.
              Align(
                alignment: const AlignmentDirectional(
                    0, -1.2), // Positioned towards the bottom.
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Shape is a circle.
                    color: Colors.orange, // Color is orange.
                  ),
                ),
              ),
              // BackdropFilter widget to apply a blur effect over the entire screen.
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 100.0, sigmaY: 100.0), // Apply strong blur effect.
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors
                          .transparent), // Transparent container to hold the blur effect.
                ),
              ),
              // The actual weather content of the screen (inside WeatherHome widget).
              const WeatherHome(), // Display the WeatherHome widget on top of the background.
            ],
          ),
        ),
      ),
    );
  }
}
