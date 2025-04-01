import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_card_widget.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  group('HotelCard Widget', () {
    testWidgets('renders hotel card correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale: const Locale('de'),
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder:
                (context, child) => Scaffold(
                  body: HotelCard(
                    hotel: dummyHotel,
                    isFavorite: true,
                    onFavoriteToggle: () {},
                    pageType: PageType.hotel,
                  ),
                ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check hotel name
      expect(find.text(dummyHotel.name), findsOneWidget);

      // Check destination
      expect(find.text(dummyHotel.destination), findsOneWidget);

      // Check button text
      expect(find.text('Zu den Angeboten'), findsOneWidget);

      // Check favorite icon
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
