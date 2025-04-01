// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Réservation d\'Hôtel';

  @override
  String get overview => 'Aperçu';

  @override
  String get hotels => 'Hôtels';

  @override
  String get favorites => 'Favoris';

  @override
  String get account => 'Compte';

  @override
  String get noFavorites => 'Aucun hôtel favori pour le moment';

  @override
  String pricePerNight(Object price) {
    return '\$$price/nuit';
  }

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get networkError => 'Pas de connexion Internet. Veuillez vérifier vos paramètres réseau.';

  @override
  String get serverError => 'Erreur du serveur. Veuillez réessayer plus tard.';

  @override
  String get cacheError => 'Erreur de cache';

  @override
  String get from => 'à partir de';

  @override
  String get toOffer => 'Voir les offres';

  @override
  String get toHotel => 'Voir l\'hôtel';

  @override
  String get errorLoadingHotels => 'Erreur lors du chargement des hôtels';

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get systemTheme => 'Système';

  @override
  String get language => 'Langue';

  @override
  String hotelsCountTitle(int count, String destination) {
    return '$count Hôtels pour $destination';
  }

  @override
  String travellers(int adultCount, String childrenPart) {
    return '$adultCount Adultes$childrenPart';
  }

  @override
  String childrenPart(int childCount) {
    String _temp0 = intl.Intl.pluralLogic(
      childCount,
      locale: localeName,
      other: ' | $childCount Enfants',
      one: ' | 1 Enfant',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String flightIncludedOrNot(String included) {
    String _temp0 = intl.Intl.selectLogic(
      included,
      {
        'true': 'vol inclus',
        'false': 'sans vol',
        'other': 'sans vol',
      },
    );
    return '$_temp0';
  }

  @override
  String travelDuration(int days, int nights) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      nights,
      locale: localeName,
      other: '$nights nuits',
      one: '1 nuit',
    );
    return '$_temp0 | $_temp1';
  }
}
