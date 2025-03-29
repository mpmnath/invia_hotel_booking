import 'package:flutter/material.dart';

class HotelBookingTextTheme {
  static TextTheme getTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 45,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
