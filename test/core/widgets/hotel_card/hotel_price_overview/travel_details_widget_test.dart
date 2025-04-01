import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/extensions/best_offer_ext.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/travel_details_widget.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  group('TravelDetailsWidget', () {
    testWidgets('displays travel details correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale: const Locale('de'),
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder:
                (context, child) => Scaffold(
                  body: TravelDetailsWidget(bestOffer: dummyHotel.bestOffer),
                ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 🔥 Check localizedDuration and localizedTravellerInfo
      expect(find.text('8 Tage | 7 Nächte'), findsOneWidget);
      expect(find.text('2 Erw. | ohne Flug'), findsOneWidget);

      // ✅ Also check room type and boarding text
      expect(
        find.text(dummyHotel.bestOffer.roomTypeAndBoarding),
        findsOneWidget,
      );
    });
  });
}
