import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/extensions/page_type_ext.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

void main() {
  testWidgets('PageTypeExt returns correct button text', (tester) async {
    late String hotelButtonText;
    late String favoritesButtonText;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        locale: const Locale('de'),
        home: Builder(
          builder: (context) {
            hotelButtonText = PageType.hotel.getButtonText(context);
            favoritesButtonText = PageType.favorites.getButtonText(context);
            return const SizedBox();
          },
        ),
      ),
    );

    expect(hotelButtonText, 'Zu den Angeboten');
    expect(favoritesButtonText, 'Zum Hotel');
  });
}
