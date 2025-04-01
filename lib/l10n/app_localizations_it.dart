// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Prenotazione Hotel';

  @override
  String get overview => 'Panoramica';

  @override
  String get hotels => 'Hotel';

  @override
  String get favorites => 'Preferiti';

  @override
  String get account => 'Account';

  @override
  String get noFavorites => 'Nessun hotel preferito ancora';

  @override
  String pricePerNight(Object price) {
    return '\$$price/notte';
  }

  @override
  String get tryAgain => 'Riprova';

  @override
  String get networkError => 'Nessuna connessione a Internet. Controlla le impostazioni di rete.';

  @override
  String get serverError => 'Errore del server. Riprova più tardi.';

  @override
  String get cacheError => 'Errore di cache';

  @override
  String get from => 'da';

  @override
  String get toOffer => 'Vedi offerte';

  @override
  String get toHotel => 'Vedi hotel';

  @override
  String get settings => 'Impostazioni';

  @override
  String get theme => 'Tema';

  @override
  String get lightTheme => 'Chiaro';

  @override
  String get darkTheme => 'Scuro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get language => 'Lingua';

  @override
  String hotelsCountTitle(int count, String destination) {
    return '$count Hotel per $destination';
  }

  @override
  String travellers(int adultCount, String childrenPart) {
    return '$adultCount Adulti$childrenPart';
  }

  @override
  String childrenPart(int childCount) {
    String _temp0 = intl.Intl.pluralLogic(
      childCount,
      locale: localeName,
      other: ' | $childCount Bambini',
      one: ' | 1 Bambino',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String flightIncludedOrNot(String included) {
    String _temp0 = intl.Intl.selectLogic(
      included,
      {
        'true': 'incl. volo',
        'false': 'senza volo',
        'other': 'senza volo',
      },
    );
    return '$_temp0';
  }

  @override
  String travelDuration(int days, int nights) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '1 giorno',
    );
    String _temp1 = intl.Intl.pluralLogic(
      nights,
      locale: localeName,
      other: '$nights notti',
      one: '1 notte',
    );
    return '$_temp0 | $_temp1';
  }
}
