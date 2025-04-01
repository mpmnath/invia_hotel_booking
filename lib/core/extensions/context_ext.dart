import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/theme/color_palette.dart';
import 'package:invia_hotel_booking/l10n/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  bool get isTablet {
    // Get the device's screen size and density
    final size = MediaQuery.of(this).size;
    final diagonalSize = sqrt(pow(size.width, 2) + pow(size.height, 2));
    final pixelRatio = MediaQuery.of(this).devicePixelRatio;

    // Calculate the physical screen size in inches
    final physicalWidth = size.width / pixelRatio;
    final physicalHeight = size.height / pixelRatio;
    final physicalSize = sqrt(pow(physicalWidth, 2) + pow(physicalHeight, 2));

    // Determine the device type based on the physical screen size
    return physicalSize >= 7 && diagonalSize >= 1100;
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryTextColor {
    final colors =
        Theme.of(this).brightness == Brightness.dark
            ? HotelBookingColorPalette.dark
            : HotelBookingColorPalette.light;
    return colors.primaryText;
  }
}
