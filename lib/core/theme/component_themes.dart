import 'package:flutter/material.dart';
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
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.foreground,
      ),
    );
  }

  static CardTheme getCardTheme(HotelBookingColors colors) {
    return CardTheme(
      color: colors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      shadowColor: colors.shadow,
      elevation: 2,
    );
  }

  static ElevatedButtonThemeData getButtonTheme(HotelBookingColors colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        textStyle: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static DividerThemeData getDividerTheme(HotelBookingColors colors) {
    return DividerThemeData(color: colors.divider, thickness: 1, space: 0);
  }

  static IconThemeData getIconTheme(HotelBookingColors colors) {
    return IconThemeData(color: colors.icon, size: 24);
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
