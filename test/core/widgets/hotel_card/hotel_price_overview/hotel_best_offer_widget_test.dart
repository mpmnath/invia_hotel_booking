import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/hotel_best_offer_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/hotel_price_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/travel_details_widget.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

import '../../../../helpers/dummy_data.dart';

void main() {
  group('HotelBestOffer', () {
    late BestOffer bestOffer;

    setUp(() {
      bestOffer = dummyHotel.bestOffer;
    });

    testWidgets('renders TravelDetailsWidget and HotelPriceWidget correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (_, __) {
              return Scaffold(body: HotelBestOffer(bestOffer: bestOffer));
            },
          ),
        ),
      );

      // Check if TravelDetailsWidget is present
      expect(find.byType(TravelDetailsWidget), findsOneWidget);

      // Check if HotelPriceWidget is present
      expect(find.byType(HotelPriceWidget), findsOneWidget);

      // Optionally check if correct data is passed
      final travelDetailsWidget = tester.widget<TravelDetailsWidget>(
        find.byType(TravelDetailsWidget),
      );
      final hotelPriceWidget = tester.widget<HotelPriceWidget>(
        find.byType(HotelPriceWidget),
      );

      expect(travelDetailsWidget.bestOffer, equals(bestOffer));
      expect(hotelPriceWidget.bestOffer, equals(bestOffer));
    });
  });
}
