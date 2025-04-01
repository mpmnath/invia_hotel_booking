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
  String pricePerNight(Object price) {
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

  @override
  String get from => 'from';

  @override
  String get toOffer => 'To offers';

  @override
  String get toHotel => 'To hotel';

  @override
  String get errorLoadingHotels => 'Error loading hotels';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get language => 'Language';

  @override
  String hotelsCountTitle(int count, String destination) {
    return '$count Hotels for $destination';
  }

  @override
  String travellers(int adultCount, String childrenPart) {
    return '$adultCount Adults$childrenPart';
  }

  @override
  String childrenPart(int childCount) {
    String _temp0 = intl.Intl.pluralLogic(
      childCount,
      locale: localeName,
      other: ' | $childCount Children',
      one: ' | 1 Child',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String flightIncludedOrNot(String included) {
    String _temp0 = intl.Intl.selectLogic(
      included,
      {
        'true': 'incl. flight',
        'false': 'without flight',
        'other': 'without flight',
      },
    );
    return '$_temp0';
  }

  @override
  String travelDuration(int days, int nights) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    String _temp1 = intl.Intl.pluralLogic(
      nights,
      locale: localeName,
      other: '$nights nights',
      one: '1 night',
    );
    return '$_temp0 | $_temp1';
  }
}
