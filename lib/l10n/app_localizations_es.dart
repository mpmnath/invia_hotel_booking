// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Reserva de Hotel';

  @override
  String get overview => 'Resumen';

  @override
  String get hotels => 'Hoteles';

  @override
  String get favorites => 'Favoritos';

  @override
  String get account => 'Cuenta';

  @override
  String get noFavorites => 'No hay hoteles favoritos aún';

  @override
  String pricePerNight(Object price) {
    return '\$$price/noche';
  }

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get networkError => 'Sin conexión a internet. Por favor, revise su configuración de red.';

  @override
  String get serverError => 'Error del servidor. Por favor, inténtelo más tarde.';

  @override
  String get cacheError => 'Error de caché';

  @override
  String get from => 'desde';

  @override
  String get toOffer => 'Ver ofertas';

  @override
  String get toHotel => 'Ver hotel';

  @override
  String get settings => 'Configuración';

  @override
  String get theme => 'Tema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get language => 'Idioma';

  @override
  String hotelsCountTitle(int count, String destination) {
    return '$count Hoteles para $destination';
  }

  @override
  String travellers(int adultCount, String childrenPart) {
    return '$adultCount Adultos$childrenPart';
  }

  @override
  String childrenPart(int childCount) {
    String _temp0 = intl.Intl.pluralLogic(
      childCount,
      locale: localeName,
      other: ' | $childCount Niños',
      one: ' | 1 Niño',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String flightIncludedOrNot(String included) {
    String _temp0 = intl.Intl.selectLogic(
      included,
      {
        'true': 'incl. vuelo',
        'false': 'sin vuelo',
        'other': 'sin vuelo',
      },
    );
    return '$_temp0';
  }

  @override
  String travelDuration(int days, int nights) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
    );
    String _temp1 = intl.Intl.pluralLogic(
      nights,
      locale: localeName,
      other: '$nights noches',
      one: '1 noche',
    );
    return '$_temp0 | $_temp1';
  }
}
