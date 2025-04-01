import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/num_ext.dart';
import 'package:invia_hotel_booking/l10n/app_localizations.dart';

extension BestOfferLocalizationExt on BestOffer {
  /// Returns localized duration: e.g. "8 Tage | 7 Nächte"
  String localizedDuration(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return l10n.travelDuration(travelDate.days, travelDate.nights);
  }

  /// Returns a localized traveller summary: e.g. "2 Erw. | 1 Kind | inkl. Flug"
  String localizedTravellerInfo(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final travellers = l10n.travellers(
      rooms.overall.adultCount,
      l10n.childrenPart(rooms.overall.childrenCount),
    );
    final flight = l10n.flightIncludedOrNot(flightIncluded.toString());
    return "$travellers | $flight";
  }

  /// Returns a localized room type and boarding: e.g. "Doppelzimmer | All Inclusive"
  String get roomTypeAndBoarding {
    return "${rooms.overall.name} | ${rooms.overall.boarding}";
  }

  /// Returns a total price in euros: e.g. "1.234,56 €"
  String get totalPriceInEuros {
    return total.formattedEuro;
  }

  /// Returns per person price in euros: e.g. "123,45 € p.P."
  String get pricePerPersonInEuros {
    return "${simplePricePerPerson.formattedEuro} p.P.";
  }
}
