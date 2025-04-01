import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/extensions/best_offer_ext.dart';
import 'package:invia_hotel_booking/l10n/l10n.dart';

import '../../helpers/dummy_data.dart';

void main() {
  group('BestOfferLocalizationExt', () {
    testWidgets('returns correct localized duration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale: const Locale('de'),
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return Builder(
                builder: (context) {
                  final result = dummyHotel.bestOffer.localizedDuration(
                    context,
                  );
                  expect(
                    result,
                    '8 Tage | 7 Nächte',
                  ); // Adjust as per dummyData
                  return Container();
                },
              );
            },
          ),
        ),
      );
    });

    testWidgets('returns correct traveller info', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          locale: const Locale('de'),
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return Builder(
                builder: (context) {
                  final result = dummyHotel.bestOffer.localizedTravellerInfo(
                    context,
                  );
                  expect(result, contains('2 Erw'));
                  expect(result, contains('ohne Flug')); // as per dummyData
                  return Container();
                },
              );
            },
          ),
        ),
      );
    });

    test('returns correct room type and boarding', () {
      final result = dummyHotel.bestOffer.roomTypeAndBoarding;
      expect(result, 'Double Room | Breakfast');
    });
  });
}
