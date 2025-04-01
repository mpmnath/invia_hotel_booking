import 'package:flutter/material.dart';

class HotelBookingColors {
  final Color scaffold;
  final Color surface;
  final Color foreground;
  final Color divider;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color icon;
  final Color card;
  final Color shadow;
  final Color textColor;
  final Color primaryText;
  final Color secondaryText;

  const HotelBookingColors({
    required this.scaffold,
    required this.surface,
    required this.foreground,
    required this.divider,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.icon,
    required this.card,
    required this.shadow,
    required this.textColor,
    required this.primaryText,
    required this.secondaryText,
  });
}

class HotelBookingColorPalette {
  static const light = HotelBookingColors(
  scaffold: Color(0xFFF5F5F5),
  surface: Color(0xFF002873),
  foreground: Colors.white,
  divider: Color(0xFFE9E9E9),
  primary: Color(0xFFFF8F16),
  secondary: Color(0xFF85BC39),
  tertiary: Colors.black,
  icon: Color(0xFF222222),
  card: Colors.white,
  shadow: Colors.black12,
  textColor: Color(0xFF595959),
  primaryText: Color(0xFF222222),
  secondaryText: Color(0xFF7A7A7A),
);


  static const dark = HotelBookingColors(
    scaffold: Color(0xFF121212),
    surface: Color(0xFF0A2940),
    foreground: Color(0xFFE0E0E0),
    divider: Color(0xFF424242),
    primary: Color(0xFFFFA833),
    secondary: Color(0xFF85BC39),
    tertiary: Colors.white,
    icon: Color(0xFFB0B0B0),
    card: Color(0xFF1E1E1E),
    shadow: Colors.black45,
    textColor: Color(0xFFE0E0E0),
    primaryText: Colors.white,
    secondaryText: Color(0xFFB0B0B0),
  );
}
