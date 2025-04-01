import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

/// Registers fallback values needed by mocktail to avoid runtime errors.
void registerFallbackValues() {
  // Fallbacks for domain entities & models
  registerFallbackValue(MockHotel());
  registerFallbackValue(MockHotelModel());

  // Fallbacks for ThemeMode & Locale
  registerFallbackValue(ThemeMode.system);
  registerFallbackValue(const Locale('en'));

  // Fallbacks for Fake NoParams
  registerFallbackValue(NoParamsFake());
}
