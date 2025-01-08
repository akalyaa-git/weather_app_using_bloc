import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// A reusable widget to display common information like temperature or time.
class CommonInfoWidget extends StatelessWidget {
  final String label; // The label to display (e.g., "Temp Max", "Sunrise").
  final String iconPath; // Path to the icon to display.
  final String
      iconDescription; // A description of the icon (for accessibility purposes).
  bool
      isFromTempMaxMinWidget; // Flag to differentiate between temperature and time-related data.
  int? value; // Holds the value of temperature (for temp max or min).
  DateTime? time; // Holds the time (for sunrise or sunset).

  // Constructor to initialize the widget's properties.
  CommonInfoWidget({
    super.key,
    required this.label, // The label text (e.g., "Temp Max").
    required this.iconPath, // The path to the weather icon.
    required this.iconDescription, // Description of the icon for accessibility.
    required this.isFromTempMaxMinWidget, // Flag to determine the type of info (temp or time).
    this.value, // Temperature value (optional).
    this.time, // Time value (optional).
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display the icon with the provided path and description for accessibility.
        Image.asset(
          iconPath,
          scale: 8, // Controls the size of the image.
          semanticLabel:
              iconDescription, // Helps with accessibility (screen readers).
        ),
        const SizedBox(width: 5), // Adds space between the icon and text.

        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns text to the left.
          children: [
            // Label text, like "Temp Max" or "Sunrise".
            Text(
              label,
              style: const TextStyle(
                color: Colors.white, // Text color.
                fontWeight: FontWeight.w400, // Light font weight for the label.
              ),
            ),
            const SizedBox(
                height: 3), // Adds space between the label and the value.

            // Display either the temperature or time, depending on the flag `isFromTempMaxMinWidget`.
            Text(
              isFromTempMaxMinWidget
                  ? value != null
                      ? '$value°C' // If temperature is available, display it with '°C'.
                      : 'N/A' // If no temperature value, display 'N/A'.
                  : time != null
                      ? DateFormat().add_jm().format(
                          time!) // If time is available, format and display it.
                      : 'N/A', // If no time value, display 'N/A'.
              style: const TextStyle(
                color: Colors.white, // Text color.
                fontWeight: FontWeight.w700, // Bold font weight for the value.
              ),
            ),
          ],
        ),
      ],
    );
  }
}
