import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/theme/color_palette.dart';
import 'package:invia_hotel_booking/core/theme/component_themes.dart';
import 'package:invia_hotel_booking/core/theme/text_theme.dart';

class HotelBookingTheme {
  static ThemeData get light => _buildTheme(Brightness.light);
  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors =
        isDark ? HotelBookingColorPalette.dark : HotelBookingColorPalette.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.scaffold,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.foreground,
        secondary: colors.secondary,
        onSecondary: colors.foreground,
        error: Colors.redAccent,
        onError: colors.foreground,
        surface: colors.surface,
        onSurface: colors.foreground,
        tertiary: colors.tertiary,
      ),
      textTheme: HotelBookingTextTheme.getTextTheme(colors.tertiary),
      appBarTheme: HotelBookingComponentThemes.getAppBarTheme(colors),
      elevatedButtonTheme: HotelBookingComponentThemes.getButtonTheme(colors),
      dividerTheme: HotelBookingComponentThemes.getDividerTheme(colors),
      iconTheme: HotelBookingComponentThemes.getIconTheme(colors),
      cardTheme: HotelBookingComponentThemes.getCardTheme(colors),
      bottomNavigationBarTheme: HotelBookingComponentThemes.getBottomNavTheme(
        colors,
      ),
      radioTheme: HotelBookingComponentThemes.getRadioTheme(colors),
      visualDensity: VisualDensity.compact,
    );
  }
}
