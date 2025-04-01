import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';

extension PageTypeExt on PageType {
  String getButtonText(BuildContext context) {
    switch (this) {
      case PageType.hotel:
        return context.l10n.toOffer;
      case PageType.favorites:
        return context.l10n.toHotel;
    }
  }
}
