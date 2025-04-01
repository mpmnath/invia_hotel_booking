// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Hotelbuchung';

  @override
  String get overview => 'Übersicht';

  @override
  String get hotels => 'Hotels';

  @override
  String get favorites => 'Favoriten';

  @override
  String get account => 'Konto';

  @override
  String get noFavorites => 'Noch keine Favoriten';

  @override
  String pricePerNight(Object price) {
    return '\$$price/Nacht';
  }

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get networkError => 'Keine Internetverbindung. Bitte überprüfe deine Netzwerkeinstellungen.';

  @override
  String get serverError => 'Serverfehler. Bitte versuche es später erneut.';

  @override
  String get cacheError => 'Cache-Fehler';

  @override
  String get from => 'ab';

  @override
  String get toOffer => 'Zu den Angeboten';

  @override
  String get toHotel => 'Zum Hotel';

  @override
  String get errorLoadingHotels => 'Fehler beim Laden der Hotels';

  @override
  String get settings => 'Einstellungen';

  @override
  String get theme => 'Design';

  @override
  String get lightTheme => 'Helles';

  @override
  String get darkTheme => 'Dunkles';

  @override
  String get systemTheme => 'System';

  @override
  String get language => 'Sprache';

  @override
  String hotelsCountTitle(int count, String destination) {
    return '$count Hotels für $destination';
  }

  @override
  String travellers(int adultCount, String childrenPart) {
    return '$adultCount Erw.$childrenPart';
  }

  @override
  String childrenPart(int childCount) {
    String _temp0 = intl.Intl.pluralLogic(
      childCount,
      locale: localeName,
      other: ' | $childCount Kinder',
      one: ' | 1 Kind',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String flightIncludedOrNot(String included) {
    String _temp0 = intl.Intl.selectLogic(
      included,
      {
        'true': 'inkl. Flug',
        'false': 'ohne Flug',
        'other': 'ohne Flug',
      },
    );
    return '$_temp0';
  }

  @override
  String travelDuration(int days, int nights) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '1 Tag',
    );
    String _temp1 = intl.Intl.pluralLogic(
      nights,
      locale: localeName,
      other: '$nights Nächte',
      one: '1 Nacht',
    );
    return '$_temp0 | $_temp1';
  }
}
