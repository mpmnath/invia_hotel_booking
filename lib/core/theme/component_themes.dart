import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invia_hotel_booking/core/theme/color_palette.dart';

class HotelBookingComponentThemes {
  static AppBarTheme getAppBarTheme(HotelBookingColors colors) {
    return AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: colors.foreground,
      elevation: 0,
      shadowColor: colors.shadow,
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colors.foreground,
      ),
    );
  }

  static CardTheme getCardTheme(HotelBookingColors colors) {
    return CardTheme(
      color: colors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      shadowColor: colors.shadow,
      elevation: 4,
    );
  }

  static ElevatedButtonThemeData getButtonTheme(HotelBookingColors colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        textStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static DividerThemeData getDividerTheme(HotelBookingColors colors) {
    return DividerThemeData(color: colors.divider, thickness: 1, space: 0);
  }

  static IconThemeData getIconTheme(HotelBookingColors colors) {
    return IconThemeData(color: colors.icon, size: 16);
  }

  static BottomNavigationBarThemeData getBottomNavTheme(
    HotelBookingColors colors,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.card,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.tertiary,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      elevation: 2,
    );
  }

  static RadioThemeData getRadioTheme(HotelBookingColors colors) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return colors.primary;
        return colors.tertiary;
      }),
    );
  }
}
