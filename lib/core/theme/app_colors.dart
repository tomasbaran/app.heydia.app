import 'package:flutter/material.dart';

class AppColors {
  // Neutral color scale (white to black)
  // Lower numbers = lighter, higher numbers = darker
  static const Color neutral0 = Color(0xFFFFFFFF); // Pure white
  static const Color neutral50 = Color(0xFFFAFAFA); // Off white
  static const Color neutral100 = Color(0xFFF5F5F5); // Very light grey
  static const Color neutral200 = Color(0xFFEEEEEE); // Light grey
  static const Color neutral300 = Color(0xFFE0E0E0); // Light-medium grey
  static const Color neutral400 = Color(0xFFBDBDBD); // Medium-light grey
  static const Color neutral500 = Color(0xFF9E9E9E); // Medium grey
  static const Color neutral600 = Color(0xFF757575); // Medium-dark grey
  static const Color neutral700 = Color(0xFF616161); // Dark grey
  static const Color neutral800 = Color(0xFF424242); // Very dark grey
  static const Color neutral900 = Color(0xFF212121); // Near black
  static const Color neutral950 = Color(0xFF1A1A1A); // Almost black
  static const Color neutral1000 = Color(0xFF000000); // Pure black

  static const Color disabledColor = Colors.red;
  static const Color primaryDevColor = Color.fromARGB(255, 0, 128, 13);
  static const Color secondaryDevColor = Color.fromARGB(255, 255, 215, 16);

  // Notification type colors
  static const Color errorColor = Color(0xFFDC3545); // Red
  static const Color warningColor = Color(0xFFFFC107); // Amber/Yellow
  static const Color successColor = Color(0xFF28A745); // Green
  static const Color infoColor = Color(0xFF424242); // Neutral grey (same as neutral800)
}
