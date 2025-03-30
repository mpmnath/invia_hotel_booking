// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hotel Booking';

  @override
  String get overview => 'Overview';

  @override
  String get hotels => 'Hotels';

  @override
  String get favorites => 'Favorites';

  @override
  String get account => 'Account';

  @override
  String get noFavorites => 'No favorite hotels yet';

  @override
  String pricePerNight(String price) {
    return '\$$price/night';
  }

  @override
  String get tryAgain => 'Try Again';

  @override
  String get networkError => 'No internet connection. Please check your network settings.';

  @override
  String get serverError => 'Server error. Please try again later.';

  @override
  String get cacheError => 'Cache error';
}
