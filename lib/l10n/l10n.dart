import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invia_hotel_booking/l10n/app_localizations.dart';

class L10n {
  static final supportedLocales = [
    const Locale('en'),
    const Locale('de'),
    const Locale('fr'),
    const Locale('es'),
    const Locale('it'),
  ];

  // Localization delegate
  static List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
