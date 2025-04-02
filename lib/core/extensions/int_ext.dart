import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/l10n/app_localizations.dart';

extension NumberFormatExt on int {
  String localizedReviews(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final formattedCount = NumberFormat.decimalPattern(locale).format(this);
    final l10n = AppLocalizations.of(context)!;
    return l10n.ratingReviews(formattedCount);
  }
}
