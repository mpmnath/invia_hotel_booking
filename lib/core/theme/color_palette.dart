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
  });
}

class HotelBookingColorPalette {
  static const light = HotelBookingColors(
    scaffold: Colors.white,
    surface: Color(0xFF002873),
    foreground: Colors.white,
    divider: Color(0xFFE9E9E9),
    primary: Color(0xFFFF8F16),
    secondary: Color(0xFF85BC39),
    tertiary: Colors.black,
    icon: Color(0xFF595959),
    card: Colors.white,
    shadow: Colors.black12,
  );

  static const dark = HotelBookingColors(
    scaffold: Color(0xFF1A1A1A),
    surface: Color(0xFF003087),
    foreground: Color(0xFFE0E0E0),
    divider: Color(0xFF424242),
    primary: Color(0xFFFF8F16),
    secondary: Color(0xFF85BC39),
    tertiary: Colors.white,
    icon: Color(0xFFB0B0B0),
    card: Color(0xFF2A2A2A),
    shadow: Colors.black26,
  );
}
